using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Xsl;
using System.IO;
using System.Data;
using System.Net;

namespace MovieProject
{
    public class XmlCommercialClass
    {
        private string sourcefile { get; set; }
        public string xsltfile { get; set; }
        public string destinationfile { get; set; }
        //public string xslthtmlfile { get; set; }
        //public string destinationhtmlfile { get; set; }


        public XmlCommercialClass(string sourcefile, string xsltfile, string destinationfile)
        {
            this.sourcefile = sourcefile;
            this.xsltfile = xsltfile;
            this.destinationfile = destinationfile;

        }

        public void CreateToTransformXml()
        {
            FileStream fs = new FileStream(destinationfile, FileMode.Create);
            XslCompiledTransform xct = new XslCompiledTransform();
            xct.Load(xsltfile);
            xct.Transform(sourcefile, null, fs);
            fs.Close();
        }

    }
    public class HtmlCommercialClass
    {
        private string sourcefile { get; set; }
        public string xslthtmlfile { get; set; }
        public string destinationhtmlfile { get; set; }

        public HtmlCommercialClass(string sourcefile, string xslthtmlfile, string destinationhtmlfile)
        {
            this.sourcefile = sourcefile;
            this.xslthtmlfile = xslthtmlfile;
            this.destinationhtmlfile = destinationhtmlfile;

        }
        public void CreateToTransformHtml()
        {

            FileStream nsfshtml = new FileStream(destinationhtmlfile, FileMode.Create);
            XslCompiledTransform nsxcthtml = new XslCompiledTransform();
            nsxcthtml.Load(xslthtmlfile);
            nsxcthtml.Transform(sourcefile, null, nsfshtml);
            nsfshtml.Close();

        }
    }
}