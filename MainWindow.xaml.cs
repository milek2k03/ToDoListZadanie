using System.Windows;
using ToDoList_Zadanie.Data;
using ToDoList_Zadanie.Models;

namespace ToDoList_Zadanie
{
    public partial class MainWindow : Window
    {
        private readonly ApplicationDbContext _context;
        private TodoTask? _taskBeingEdited;


        public MainWindow(ApplicationDbContext context)
        {
            InitializeComponent();
            _context = context;
            FilterDatePicker.SelectedDate = DateTime.Today;
            LoadTasks();
            //CheckForUpcomingTasks();
        }

        private void AddTask_Click(object sender, RoutedEventArgs e)
        {
            if (_taskBeingEdited != null)
            {
                MessageBox.Show("Zakończ edytowanie obecnego zadania lub kliknij 'Zapisz zmiany'.");
                return;
            }

            var task = new TodoTask
            {
                Title = TitleTextBox.Text,
                Description = DescriptionTextBox.Text,
                DueDate = DueDatePicker.SelectedDate ?? DateTime.Now,
                IsCompleted = false
            };

            if (string.IsNullOrWhiteSpace(task.Title) || string.IsNullOrWhiteSpace(task.Description))
            {
                MessageBox.Show("Uzupełnij tytuł i opis zadania.");
                return;
            }

            _context.TodoTasks.Add(task);
            _context.SaveChanges();
            LoadTasks();
            ClearInputFields();
        }

        private void EditTask_Click(object sender, RoutedEventArgs e)
        {
            if (TasksListBox.SelectedItem is TodoTask selectedTask)
            {
                _taskBeingEdited = selectedTask;
                TitleTextBox.Text = _taskBeingEdited.Title;
                DescriptionTextBox.Text = _taskBeingEdited.Description;
                DueDatePicker.SelectedDate = _taskBeingEdited.DueDate;
                SaveButton.Visibility = Visibility.Visible;
                AddButton.Visibility = Visibility.Collapsed;
                DeleteButton.Visibility = Visibility.Collapsed;
            }
        }

        private void SaveTask_Click(object sender, RoutedEventArgs e)
        {
            if (_taskBeingEdited == null) return;

            _taskBeingEdited.Title = TitleTextBox.Text;
            _taskBeingEdited.Description = DescriptionTextBox.Text;
            _taskBeingEdited.DueDate = DueDatePicker.SelectedDate ?? DateTime.Now;

            _context.TodoTasks.Update(_taskBeingEdited);
            _context.SaveChanges();

            LoadTasks();
            ClearInputFields();
            SaveButton.Visibility = Visibility.Collapsed;
            AddButton.Visibility = Visibility.Visible;
            DeleteButton.Visibility = Visibility.Visible;
            _taskBeingEdited = null;
        }

        private void DeleteTask_Click(object sender, RoutedEventArgs e)
        {
            if (TasksListBox.SelectedItem is TodoTask selectedTask)
            {
                _context.TodoTasks.Remove(selectedTask);
                _context.SaveChanges();
                LoadTasks();
            }
            else
            {
                MessageBox.Show("Wybierz zadanie do usunięcia.");
            }
        }

        private void LoadTasks()
        {
            try
            {
                DateTime? selectedDate = FilterDatePicker.SelectedDate;
                var tasks = _context.TodoTasks
                                    .Where(t => !selectedDate.HasValue || t.DueDate.Date == selectedDate.Value.Date)
                                    .OrderBy(t => t.DueDate)
                                    .ToList();

                TasksListBox.ItemsSource = tasks;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Błąd podczas ładowania zadań: {ex.Message}");
            }
        }

        private void ClearInputFields()
        {
            TitleTextBox.Clear();
            DescriptionTextBox.Clear();
            DueDatePicker.SelectedDate = null;
        }

        private void FilterDatePicker_SelectedDateChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e) => LoadTasks();

        private void CheckForUpcomingTasks()
        {
            var upcomingTasks = _context.TodoTasks
                                        .Where(t => (t.DueDate.Date == DateTime.Now.Date || t.DueDate.Date == DateTime.Now.Date.AddDays(1)) && !t.IsCompleted)
                                        .ToList();

            if (upcomingTasks.Any())
            {
                string tasksList = string.Join("\n", upcomingTasks.Select(t => $"{t.Title} - {t.DueDate:dd.MM.yyyy}"));
                MessageBox.Show($"Zbliżające się zadania:\n{tasksList}", "Powiadomienie o zbliżających się zadaniach", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

    }
}
