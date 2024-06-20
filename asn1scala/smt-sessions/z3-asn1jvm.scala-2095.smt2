; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53128 () Bool)

(assert start!53128)

(declare-fun b!246763 () Bool)

(declare-fun e!170969 () Bool)

(declare-datatypes ((array!13456 0))(
  ( (array!13457 (arr!6887 (Array (_ BitVec 32) (_ BitVec 8))) (size!5900 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10722 0))(
  ( (BitStream!10723 (buf!6381 array!13456) (currentByte!11777 (_ BitVec 32)) (currentBit!11772 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21180 0))(
  ( (tuple2!21181 (_1!11512 BitStream!10722) (_2!11512 Bool)) )
))
(declare-fun lt!384896 () tuple2!21180)

(declare-fun lt!384898 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246763 (= e!170969 (= (bitIndex!0 (size!5900 (buf!6381 (_1!11512 lt!384896))) (currentByte!11777 (_1!11512 lt!384896)) (currentBit!11772 (_1!11512 lt!384896))) lt!384898))))

(declare-fun b!246764 () Bool)

(declare-fun res!206462 () Bool)

(declare-fun e!170965 () Bool)

(assert (=> b!246764 (=> (not res!206462) (not e!170965))))

(declare-fun thiss!1005 () BitStream!10722)

(declare-datatypes ((Unit!17912 0))(
  ( (Unit!17913) )
))
(declare-datatypes ((tuple2!21182 0))(
  ( (tuple2!21183 (_1!11513 Unit!17912) (_2!11513 BitStream!10722)) )
))
(declare-fun lt!384908 () tuple2!21182)

(declare-fun isPrefixOf!0 (BitStream!10722 BitStream!10722) Bool)

(assert (=> b!246764 (= res!206462 (isPrefixOf!0 thiss!1005 (_2!11513 lt!384908)))))

(declare-fun b!246765 () Bool)

(declare-fun res!206470 () Bool)

(declare-fun e!170963 () Bool)

(assert (=> b!246765 (=> res!206470 e!170963)))

(declare-datatypes ((tuple2!21184 0))(
  ( (tuple2!21185 (_1!11514 BitStream!10722) (_2!11514 BitStream!10722)) )
))
(declare-fun lt!384909 () tuple2!21184)

(declare-fun lt!384907 () tuple2!21184)

(declare-fun withMovedBitIndex!0 (BitStream!10722 (_ BitVec 64)) BitStream!10722)

(assert (=> b!246765 (= res!206470 (not (= (_1!11514 lt!384909) (withMovedBitIndex!0 (_1!11514 lt!384907) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246766 () Bool)

(declare-fun e!170958 () Bool)

(declare-fun lt!384905 () tuple2!21182)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246766 (= e!170958 (invariant!0 (currentBit!11772 thiss!1005) (currentByte!11777 thiss!1005) (size!5900 (buf!6381 (_2!11513 lt!384905)))))))

(declare-fun b!246767 () Bool)

(declare-fun e!170967 () Bool)

(declare-fun lt!384897 () tuple2!21180)

(declare-fun lt!384913 () tuple2!21180)

(assert (=> b!246767 (= e!170967 (= (_2!11512 lt!384897) (_2!11512 lt!384913)))))

(declare-fun b!246769 () Bool)

(declare-fun e!170962 () Bool)

(declare-fun lt!384915 () tuple2!21180)

(declare-fun lt!384917 () tuple2!21184)

(assert (=> b!246769 (= e!170962 (not (or (not (_2!11512 lt!384915)) (not (= (_1!11512 lt!384915) (_2!11514 lt!384917))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10722 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21180)

(assert (=> b!246769 (= lt!384915 (checkBitsLoopPure!0 (_1!11514 lt!384917) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384903 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246769 (validate_offset_bits!1 ((_ sign_extend 32) (size!5900 (buf!6381 (_2!11513 lt!384905)))) ((_ sign_extend 32) (currentByte!11777 (_2!11513 lt!384908))) ((_ sign_extend 32) (currentBit!11772 (_2!11513 lt!384908))) lt!384903)))

(declare-fun lt!384900 () Unit!17912)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10722 array!13456 (_ BitVec 64)) Unit!17912)

(assert (=> b!246769 (= lt!384900 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11513 lt!384908) (buf!6381 (_2!11513 lt!384905)) lt!384903))))

(declare-fun reader!0 (BitStream!10722 BitStream!10722) tuple2!21184)

(assert (=> b!246769 (= lt!384917 (reader!0 (_2!11513 lt!384908) (_2!11513 lt!384905)))))

(declare-fun b!246770 () Bool)

(declare-fun res!206473 () Bool)

(declare-fun e!170966 () Bool)

(assert (=> b!246770 (=> (not res!206473) (not e!170966))))

(assert (=> b!246770 (= res!206473 (validate_offset_bits!1 ((_ sign_extend 32) (size!5900 (buf!6381 thiss!1005))) ((_ sign_extend 32) (currentByte!11777 thiss!1005)) ((_ sign_extend 32) (currentBit!11772 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246771 () Bool)

(declare-fun e!170959 () Bool)

(assert (=> b!246771 (= e!170959 true)))

(declare-fun lt!384895 () (_ BitVec 64))

(assert (=> b!246771 (= lt!384895 (bitIndex!0 (size!5900 (buf!6381 (_2!11513 lt!384905))) (currentByte!11777 (_2!11513 lt!384905)) (currentBit!11772 (_2!11513 lt!384905))))))

(declare-fun lt!384910 () (_ BitVec 64))

(assert (=> b!246771 (= lt!384910 (bitIndex!0 (size!5900 (buf!6381 thiss!1005)) (currentByte!11777 thiss!1005) (currentBit!11772 thiss!1005)))))

(declare-fun b!246772 () Bool)

(assert (=> b!246772 (= e!170966 (not e!170963))))

(declare-fun res!206463 () Bool)

(assert (=> b!246772 (=> res!206463 e!170963)))

(declare-fun lt!384914 () tuple2!21180)

(assert (=> b!246772 (= res!206463 (not (= (_1!11512 lt!384914) (_2!11514 lt!384909))))))

(assert (=> b!246772 (= lt!384914 (checkBitsLoopPure!0 (_1!11514 lt!384909) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384902 () (_ BitVec 64))

(assert (=> b!246772 (validate_offset_bits!1 ((_ sign_extend 32) (size!5900 (buf!6381 (_2!11513 lt!384905)))) ((_ sign_extend 32) (currentByte!11777 (_2!11513 lt!384908))) ((_ sign_extend 32) (currentBit!11772 (_2!11513 lt!384908))) lt!384902)))

(declare-fun lt!384901 () Unit!17912)

(assert (=> b!246772 (= lt!384901 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11513 lt!384908) (buf!6381 (_2!11513 lt!384905)) lt!384902))))

(declare-fun lt!384904 () tuple2!21180)

(assert (=> b!246772 (= lt!384904 (checkBitsLoopPure!0 (_1!11514 lt!384907) nBits!297 bit!26 from!289))))

(assert (=> b!246772 (validate_offset_bits!1 ((_ sign_extend 32) (size!5900 (buf!6381 (_2!11513 lt!384905)))) ((_ sign_extend 32) (currentByte!11777 thiss!1005)) ((_ sign_extend 32) (currentBit!11772 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384906 () Unit!17912)

(assert (=> b!246772 (= lt!384906 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6381 (_2!11513 lt!384905)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10722) tuple2!21180)

(assert (=> b!246772 (= (_2!11512 (readBitPure!0 (_1!11514 lt!384907))) bit!26)))

(assert (=> b!246772 (= lt!384909 (reader!0 (_2!11513 lt!384908) (_2!11513 lt!384905)))))

(assert (=> b!246772 (= lt!384907 (reader!0 thiss!1005 (_2!11513 lt!384905)))))

(assert (=> b!246772 e!170967))

(declare-fun res!206471 () Bool)

(assert (=> b!246772 (=> (not res!206471) (not e!170967))))

(assert (=> b!246772 (= res!206471 (= (bitIndex!0 (size!5900 (buf!6381 (_1!11512 lt!384897))) (currentByte!11777 (_1!11512 lt!384897)) (currentBit!11772 (_1!11512 lt!384897))) (bitIndex!0 (size!5900 (buf!6381 (_1!11512 lt!384913))) (currentByte!11777 (_1!11512 lt!384913)) (currentBit!11772 (_1!11512 lt!384913)))))))

(declare-fun lt!384911 () Unit!17912)

(declare-fun lt!384899 () BitStream!10722)

(declare-fun readBitPrefixLemma!0 (BitStream!10722 BitStream!10722) Unit!17912)

(assert (=> b!246772 (= lt!384911 (readBitPrefixLemma!0 lt!384899 (_2!11513 lt!384905)))))

(assert (=> b!246772 (= lt!384913 (readBitPure!0 (BitStream!10723 (buf!6381 (_2!11513 lt!384905)) (currentByte!11777 thiss!1005) (currentBit!11772 thiss!1005))))))

(assert (=> b!246772 (= lt!384897 (readBitPure!0 lt!384899))))

(assert (=> b!246772 (= lt!384899 (BitStream!10723 (buf!6381 (_2!11513 lt!384908)) (currentByte!11777 thiss!1005) (currentBit!11772 thiss!1005)))))

(assert (=> b!246772 e!170958))

(declare-fun res!206475 () Bool)

(assert (=> b!246772 (=> (not res!206475) (not e!170958))))

(assert (=> b!246772 (= res!206475 (isPrefixOf!0 thiss!1005 (_2!11513 lt!384905)))))

(declare-fun lt!384916 () Unit!17912)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10722 BitStream!10722 BitStream!10722) Unit!17912)

(assert (=> b!246772 (= lt!384916 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11513 lt!384908) (_2!11513 lt!384905)))))

(declare-fun e!170961 () Bool)

(assert (=> b!246772 e!170961))

(declare-fun res!206472 () Bool)

(assert (=> b!246772 (=> (not res!206472) (not e!170961))))

(assert (=> b!246772 (= res!206472 (= (size!5900 (buf!6381 (_2!11513 lt!384908))) (size!5900 (buf!6381 (_2!11513 lt!384905)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10722 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21182)

(assert (=> b!246772 (= lt!384905 (appendNBitsLoop!0 (_2!11513 lt!384908) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246772 (validate_offset_bits!1 ((_ sign_extend 32) (size!5900 (buf!6381 (_2!11513 lt!384908)))) ((_ sign_extend 32) (currentByte!11777 (_2!11513 lt!384908))) ((_ sign_extend 32) (currentBit!11772 (_2!11513 lt!384908))) lt!384902)))

(assert (=> b!246772 (= lt!384902 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384912 () Unit!17912)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10722 BitStream!10722 (_ BitVec 64) (_ BitVec 64)) Unit!17912)

(assert (=> b!246772 (= lt!384912 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11513 lt!384908) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170964 () Bool)

(assert (=> b!246772 e!170964))

(declare-fun res!206460 () Bool)

(assert (=> b!246772 (=> (not res!206460) (not e!170964))))

(assert (=> b!246772 (= res!206460 (= (size!5900 (buf!6381 thiss!1005)) (size!5900 (buf!6381 (_2!11513 lt!384908)))))))

(declare-fun appendBit!0 (BitStream!10722 Bool) tuple2!21182)

(assert (=> b!246772 (= lt!384908 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246773 () Bool)

(assert (=> b!246773 (= e!170965 e!170969)))

(declare-fun res!206474 () Bool)

(assert (=> b!246773 (=> (not res!206474) (not e!170969))))

(assert (=> b!246773 (= res!206474 (and (= (_2!11512 lt!384896) bit!26) (= (_1!11512 lt!384896) (_2!11513 lt!384908))))))

(declare-fun readerFrom!0 (BitStream!10722 (_ BitVec 32) (_ BitVec 32)) BitStream!10722)

(assert (=> b!246773 (= lt!384896 (readBitPure!0 (readerFrom!0 (_2!11513 lt!384908) (currentBit!11772 thiss!1005) (currentByte!11777 thiss!1005))))))

(declare-fun b!246774 () Bool)

(declare-fun res!206466 () Bool)

(assert (=> b!246774 (=> (not res!206466) (not e!170958))))

(assert (=> b!246774 (= res!206466 (invariant!0 (currentBit!11772 thiss!1005) (currentByte!11777 thiss!1005) (size!5900 (buf!6381 (_2!11513 lt!384908)))))))

(declare-fun b!246775 () Bool)

(assert (=> b!246775 (= e!170961 e!170962)))

(declare-fun res!206465 () Bool)

(assert (=> b!246775 (=> (not res!206465) (not e!170962))))

(assert (=> b!246775 (= res!206465 (= (bitIndex!0 (size!5900 (buf!6381 (_2!11513 lt!384905))) (currentByte!11777 (_2!11513 lt!384905)) (currentBit!11772 (_2!11513 lt!384905))) (bvadd (bitIndex!0 (size!5900 (buf!6381 (_2!11513 lt!384908))) (currentByte!11777 (_2!11513 lt!384908)) (currentBit!11772 (_2!11513 lt!384908))) lt!384903)))))

(assert (=> b!246775 (= lt!384903 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246776 () Bool)

(declare-fun e!170968 () Bool)

(declare-fun array_inv!5641 (array!13456) Bool)

(assert (=> b!246776 (= e!170968 (array_inv!5641 (buf!6381 thiss!1005)))))

(declare-fun b!246777 () Bool)

(assert (=> b!246777 (= e!170963 e!170959)))

(declare-fun res!206467 () Bool)

(assert (=> b!246777 (=> res!206467 e!170959)))

(assert (=> b!246777 (= res!206467 (not (= (size!5900 (buf!6381 thiss!1005)) (size!5900 (buf!6381 (_2!11513 lt!384905))))))))

(assert (=> b!246777 (and (= (_2!11512 lt!384904) (_2!11512 lt!384914)) (= (_1!11512 lt!384904) (_2!11514 lt!384907)))))

(declare-fun b!246778 () Bool)

(declare-fun res!206468 () Bool)

(assert (=> b!246778 (=> (not res!206468) (not e!170962))))

(assert (=> b!246778 (= res!206468 (isPrefixOf!0 (_2!11513 lt!384908) (_2!11513 lt!384905)))))

(declare-fun b!246779 () Bool)

(assert (=> b!246779 (= e!170964 e!170965)))

(declare-fun res!206464 () Bool)

(assert (=> b!246779 (=> (not res!206464) (not e!170965))))

(declare-fun lt!384918 () (_ BitVec 64))

(assert (=> b!246779 (= res!206464 (= lt!384898 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384918)))))

(assert (=> b!246779 (= lt!384898 (bitIndex!0 (size!5900 (buf!6381 (_2!11513 lt!384908))) (currentByte!11777 (_2!11513 lt!384908)) (currentBit!11772 (_2!11513 lt!384908))))))

(assert (=> b!246779 (= lt!384918 (bitIndex!0 (size!5900 (buf!6381 thiss!1005)) (currentByte!11777 thiss!1005) (currentBit!11772 thiss!1005)))))

(declare-fun b!246768 () Bool)

(declare-fun res!206469 () Bool)

(assert (=> b!246768 (=> (not res!206469) (not e!170966))))

(assert (=> b!246768 (= res!206469 (bvslt from!289 nBits!297))))

(declare-fun res!206461 () Bool)

(assert (=> start!53128 (=> (not res!206461) (not e!170966))))

(assert (=> start!53128 (= res!206461 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53128 e!170966))

(assert (=> start!53128 true))

(declare-fun inv!12 (BitStream!10722) Bool)

(assert (=> start!53128 (and (inv!12 thiss!1005) e!170968)))

(assert (= (and start!53128 res!206461) b!246770))

(assert (= (and b!246770 res!206473) b!246768))

(assert (= (and b!246768 res!206469) b!246772))

(assert (= (and b!246772 res!206460) b!246779))

(assert (= (and b!246779 res!206464) b!246764))

(assert (= (and b!246764 res!206462) b!246773))

(assert (= (and b!246773 res!206474) b!246763))

(assert (= (and b!246772 res!206472) b!246775))

(assert (= (and b!246775 res!206465) b!246778))

(assert (= (and b!246778 res!206468) b!246769))

(assert (= (and b!246772 res!206475) b!246774))

(assert (= (and b!246774 res!206466) b!246766))

(assert (= (and b!246772 res!206471) b!246767))

(assert (= (and b!246772 (not res!206463)) b!246765))

(assert (= (and b!246765 (not res!206470)) b!246777))

(assert (= (and b!246777 (not res!206467)) b!246771))

(assert (= start!53128 b!246776))

(declare-fun m!372145 () Bool)

(assert (=> b!246766 m!372145))

(declare-fun m!372147 () Bool)

(assert (=> b!246773 m!372147))

(assert (=> b!246773 m!372147))

(declare-fun m!372149 () Bool)

(assert (=> b!246773 m!372149))

(declare-fun m!372151 () Bool)

(assert (=> b!246775 m!372151))

(declare-fun m!372153 () Bool)

(assert (=> b!246775 m!372153))

(assert (=> b!246771 m!372151))

(declare-fun m!372155 () Bool)

(assert (=> b!246771 m!372155))

(declare-fun m!372157 () Bool)

(assert (=> b!246770 m!372157))

(assert (=> b!246779 m!372153))

(assert (=> b!246779 m!372155))

(declare-fun m!372159 () Bool)

(assert (=> b!246772 m!372159))

(declare-fun m!372161 () Bool)

(assert (=> b!246772 m!372161))

(declare-fun m!372163 () Bool)

(assert (=> b!246772 m!372163))

(declare-fun m!372165 () Bool)

(assert (=> b!246772 m!372165))

(declare-fun m!372167 () Bool)

(assert (=> b!246772 m!372167))

(declare-fun m!372169 () Bool)

(assert (=> b!246772 m!372169))

(declare-fun m!372171 () Bool)

(assert (=> b!246772 m!372171))

(declare-fun m!372173 () Bool)

(assert (=> b!246772 m!372173))

(declare-fun m!372175 () Bool)

(assert (=> b!246772 m!372175))

(declare-fun m!372177 () Bool)

(assert (=> b!246772 m!372177))

(declare-fun m!372179 () Bool)

(assert (=> b!246772 m!372179))

(declare-fun m!372181 () Bool)

(assert (=> b!246772 m!372181))

(declare-fun m!372183 () Bool)

(assert (=> b!246772 m!372183))

(declare-fun m!372185 () Bool)

(assert (=> b!246772 m!372185))

(declare-fun m!372187 () Bool)

(assert (=> b!246772 m!372187))

(declare-fun m!372189 () Bool)

(assert (=> b!246772 m!372189))

(declare-fun m!372191 () Bool)

(assert (=> b!246772 m!372191))

(declare-fun m!372193 () Bool)

(assert (=> b!246772 m!372193))

(declare-fun m!372195 () Bool)

(assert (=> b!246772 m!372195))

(declare-fun m!372197 () Bool)

(assert (=> b!246772 m!372197))

(declare-fun m!372199 () Bool)

(assert (=> b!246776 m!372199))

(declare-fun m!372201 () Bool)

(assert (=> b!246778 m!372201))

(declare-fun m!372203 () Bool)

(assert (=> b!246765 m!372203))

(declare-fun m!372205 () Bool)

(assert (=> start!53128 m!372205))

(declare-fun m!372207 () Bool)

(assert (=> b!246764 m!372207))

(declare-fun m!372209 () Bool)

(assert (=> b!246763 m!372209))

(declare-fun m!372211 () Bool)

(assert (=> b!246774 m!372211))

(declare-fun m!372213 () Bool)

(assert (=> b!246769 m!372213))

(declare-fun m!372215 () Bool)

(assert (=> b!246769 m!372215))

(declare-fun m!372217 () Bool)

(assert (=> b!246769 m!372217))

(assert (=> b!246769 m!372159))

(check-sat (not b!246771) (not b!246772) (not b!246778) (not b!246764) (not b!246769) (not b!246770) (not b!246779) (not b!246774) (not b!246765) (not b!246773) (not b!246775) (not b!246763) (not b!246776) (not b!246766) (not start!53128))
