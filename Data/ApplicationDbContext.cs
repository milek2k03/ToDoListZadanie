using Microsoft.EntityFrameworkCore;
using ToDoList_Zadanie.Models;

namespace ToDoList_Zadanie.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<TodoTask> TodoTasks { get; set; }
    }
}
