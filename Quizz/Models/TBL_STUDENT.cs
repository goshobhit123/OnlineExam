//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Quizz.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class TBL_STUDENT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TBL_STUDENT()
        {
            this.TBL_SETEXAM = new HashSet<TBL_SETEXAM>();
        }
    
        public int S_ID { get; set; }
        [Display(Name = "Student Name")]
        [Required] public string S_NAME { get; set; }
        [Display(Name = "Student Password")]
        [StringLength(12,ErrorMessage ="Password should be atleast 8 length",MinimumLength =8)]
        [Required] public string S_PASSWORD { get; set; }
        [Display(Name = "Phone Number")]
       
        [Required] public Nullable<long> PHONE_NO { get; set; }
        [Display(Name = "Address")]
        [Required] public string ADDRESS { get; set; }
        [Display(Name = "Age")]
        
        
        [Required] public string GENDER { get; set; }

        [Required] public Nullable<int> AGE { get; set; }
        [Display(Name = "Email")]
        [DataType(DataType.EmailAddress, ErrorMessage = "E-mail is not valid")]
        public string S_EMAIL { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBL_SETEXAM> TBL_SETEXAM { get; set; }
    }
}
