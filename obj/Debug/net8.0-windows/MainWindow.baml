   M S B A M L   `   `   `  ����K  GToDoList_Zadanie, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:ToDoList_Zadanie.ConvertersToDoList_Zadanie.Converters  5   	   O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem 5   	   !    ToDoList_Zadanie.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   ;local)clr-namespace:ToDoList_Zadanie.Converters     5   	   9system&clr-namespace:System;assembly=mscorlib     5   	     � Title$  	Todo List��5   	   $	��450��6   $	��800��6(   ���#f9f9f9 � WindowStartupLocation$ CenterScreen=�5       � 	Resources 5	      =   7ToDoList_Zadanie.Converters.StringToVisibilityConverter   StringToVisibilityConverter;   5ToDoList_Zadanie.Converters.NullToVisibilityConverter  NullToVisibilityConverter;   5ToDoList_Zadanie.Converters.BoolToVisibilityConverter  BoolToVisibilityConverter �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius �� Triggers	 P� Property
 P� Value �� Binding �� Value��%1  &	        &	      &	 &     '�� 9     '�� 6    '�� �      5
   
   6,     5   
   6*     5   
   6*   �� 5   
   " ��6   .�5      ��  � ��$ 14(�6)   �� 5       � ��$ 4q�6'   �� 5       � ��$
 15,8q�6(   �� 5       � �� �#3A86FF6+   �� 5       � ��
 �����6+   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   #��z��5   !   $ 5��5   !   ._�5      �� $��Center=�6/   $��Center=�6L   5      5       5"      5#      �� 5&   
   " ��6   .�5'      ��  � ��$	 5,2q�6'   �� 5(       � ��$ 5q�6(   �� 5)       � ��
 �����6+   �� 5*       � �� �#ddd6,   �� 5+       � ��$ 1q�60    5,      P� 5-      	 �@J�IsMouseOver$

 True��61   . �5.      ��  � �� �#ebebeb63   5/      �� 50       6   �� *IsCompleted+ True6>   .a�51      ��  � ��
 � � �63   52      54      �� 57   
   " ��6   .�58      ��  � ��$ 14(�6)   �� 59       � ��$	 0,5q�6'   �� 5:       � ��$	 8,4q�6(   �� 5;       � �� �#ddd6,   �� 5<       � ��$ 1q�60   �� 5=       � ��
 �����6+   5>      5?      .��5A      � $��10q�6    � RowDefinitions 5B   
   �� 5C      $
��Auto �6   �� 5D      $��* �6   .+�5H   
   ��  �� Orientation$ 
Horizontal=�6   $	��Top=�6.   .+�5I      �� $��Filtruj zadania dla dnia:��6   $��0,0,10,0q�69   $��Center=�6K   $��16(�6f   (  "System.Windows.Controls.DatePicker  5J      -   5          Name$ FilterDatePicker��5J      63   5K      �� 5O   
   $��1��6   $��0,10,0,0q�6"   .+�5P      � $	��0,5q�6   .+�5Q      �� -   5         ��Name$ TitleTextBox��5Q      $��0,0,0,5q�60   �� 5R      $��Wprowadź tytuł��6    J� IsHitTestVisible$ False��5S      $��8,0,0,0q�5T      
�������$��Center=�5V      y�5W      �� *Text+ �� ElementName$ TitleTextBox�� �� 	Converter# [  5X      � 5Z      $	��0,5q�6   .+�5[      �� -   5        $ DescriptionTextBox��5[      $��0,0,0,5q�66   �� 5\      $��Wprowadź opis��6   $ False��5]      $��8,0,0,0q�5^      
�������$��Center=�5`      y�5a      �� *Text+$ DescriptionTextBox��# [  5b        5d      -   5        $ DueDatePicker��5d      $	��0,5q�60    �� Today   DisplayDateStart# Z 6x   �� 5g      $ 
Horizontal=�6   $��Center=�62   $
��0,10q�6O   .+�5h      �� -   5         ��Name$ 	AddButton��5h   G   $��Dodaj zadanie��6   $	��119��6Z   �� 5i      -   5        $ 
SaveButton��5i   H   $��Zapisz zmiany��6   $y�	Collapsed=�6\   $	��119��6t   �� 5j      -   5        $ DeleteButton��5j   T   $��Usuń zaznaczone zadanie��6   ���#FF4C4C$	��174��6   5k      �� 5n      -   5         ��Name$ TasksListBox��5n      $
��0,10q�6,   ��5o      �� 5p      .R�5q      �� $ 
Horizontal=�6%   $��4q�6>   .+�5r      �� $��Center=�6V    d� 	IsChecked 6'   �� *IsCompleted+ �� Mode$ TwoWay=�6V   �� 5s      $	��5,0q�6Q   $��Center=�6^   ��6(   �� *	DueDate+ �� StringFormat$ d��6^   �� 5t      $	��5,0q�6?   $��Center=�6L   $
��Bold"�6g   ��6(   �� *Title+6g   �� 5u      $	��5,0q�6E   $��Center=�6R   
���������6(   �� *Description+6m   �� 5v      -	   5        $��Edytuj��5v   %   $��60��6�   y�6M   ��  �� RelativeSource ��  �� AncestorType ListBoxItem �� Path$ 
IsSelected�# [ 6�   5w      5x      5z      5{      5|      5}      