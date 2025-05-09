﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PerceptronAPI.Models
{
    public class ResultsDto
    {
        
        public SearchResult Results;
        public List<ResultInsilicoMatchLeft> InsilicioLeft;
        public List<ResultInsilicoMatchRight> InsilicoRight;
        public ResultPtmSite PtmSitesInfo;
        public int NoOfPtmSites;
        public int NoOfMatchedFragments;

        public ResultsDto()
        {
            Results=new SearchResult();
            InsilicioLeft=new List<ResultInsilicoMatchLeft>();
            InsilicoRight=new List<ResultInsilicoMatchRight>();
            NoOfPtmSites = 0;
            PtmSitesInfo = new ResultPtmSite();
            NoOfMatchedFragments = 0;
        }

    }
}