//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace eLearningWebPortal.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Subject
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public int FkCourseId { get; set; }
    
        public virtual Cours Cours { get; set; }
    }
}