; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21602 () Bool)

(assert start!21602)

(declare-fun b!108876 () Bool)

(declare-fun e!71292 () Bool)

(declare-fun e!71299 () Bool)

(assert (=> b!108876 (= e!71292 e!71299)))

(declare-fun res!89788 () Bool)

(assert (=> b!108876 (=> (not res!89788) (not e!71299))))

(declare-fun lt!164296 () (_ BitVec 64))

(declare-fun lt!164321 () (_ BitVec 64))

(assert (=> b!108876 (= res!89788 (= lt!164296 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164321)))))

(declare-datatypes ((array!4965 0))(
  ( (array!4966 (arr!2852 (Array (_ BitVec 32) (_ BitVec 8))) (size!2259 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3992 0))(
  ( (BitStream!3993 (buf!2650 array!4965) (currentByte!5186 (_ BitVec 32)) (currentBit!5181 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6659 0))(
  ( (Unit!6660) )
))
(declare-datatypes ((tuple2!9004 0))(
  ( (tuple2!9005 (_1!4759 Unit!6659) (_2!4759 BitStream!3992)) )
))
(declare-fun lt!164298 () tuple2!9004)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108876 (= lt!164296 (bitIndex!0 (size!2259 (buf!2650 (_2!4759 lt!164298))) (currentByte!5186 (_2!4759 lt!164298)) (currentBit!5181 (_2!4759 lt!164298))))))

(declare-fun thiss!1305 () BitStream!3992)

(assert (=> b!108876 (= lt!164321 (bitIndex!0 (size!2259 (buf!2650 thiss!1305)) (currentByte!5186 thiss!1305) (currentBit!5181 thiss!1305)))))

(declare-datatypes ((tuple2!9006 0))(
  ( (tuple2!9007 (_1!4760 BitStream!3992) (_2!4760 (_ BitVec 64))) )
))
(declare-fun lt!164322 () tuple2!9006)

(declare-fun lt!164300 () BitStream!3992)

(declare-datatypes ((tuple2!9008 0))(
  ( (tuple2!9009 (_1!4761 BitStream!3992) (_2!4761 BitStream!3992)) )
))
(declare-fun lt!164313 () tuple2!9008)

(declare-fun lt!164301 () (_ BitVec 64))

(declare-fun lt!164318 () tuple2!9008)

(declare-fun lt!164304 () tuple2!9006)

(declare-fun b!108877 () Bool)

(declare-fun lt!164309 () (_ BitVec 64))

(declare-fun e!71295 () Bool)

(assert (=> b!108877 (= e!71295 (and (= lt!164309 (bvsub lt!164301 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4761 lt!164313) lt!164300)) (and (= (_2!4760 lt!164304) (_2!4760 lt!164322)) (= (_1!4760 lt!164304) (_2!4761 lt!164318))))))))

(declare-fun b!108878 () Bool)

(declare-fun e!71294 () Bool)

(declare-fun lt!164323 () tuple2!9004)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108878 (= e!71294 (invariant!0 (currentBit!5181 thiss!1305) (currentByte!5186 thiss!1305) (size!2259 (buf!2650 (_2!4759 lt!164323)))))))

(declare-fun res!89786 () Bool)

(declare-fun e!71293 () Bool)

(assert (=> start!21602 (=> (not res!89786) (not e!71293))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21602 (= res!89786 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21602 e!71293))

(assert (=> start!21602 true))

(declare-fun e!71298 () Bool)

(declare-fun inv!12 (BitStream!3992) Bool)

(assert (=> start!21602 (and (inv!12 thiss!1305) e!71298)))

(declare-fun b!108879 () Bool)

(declare-fun e!71296 () Bool)

(declare-datatypes ((tuple2!9010 0))(
  ( (tuple2!9011 (_1!4762 BitStream!3992) (_2!4762 Bool)) )
))
(declare-fun lt!164319 () tuple2!9010)

(assert (=> b!108879 (= e!71296 (= (bitIndex!0 (size!2259 (buf!2650 (_1!4762 lt!164319))) (currentByte!5186 (_1!4762 lt!164319)) (currentBit!5181 (_1!4762 lt!164319))) lt!164296))))

(declare-fun b!108880 () Bool)

(declare-fun array_inv!2061 (array!4965) Bool)

(assert (=> b!108880 (= e!71298 (array_inv!2061 (buf!2650 thiss!1305)))))

(declare-fun b!108881 () Bool)

(declare-fun res!89792 () Bool)

(declare-fun e!71291 () Bool)

(assert (=> b!108881 (=> (not res!89792) (not e!71291))))

(assert (=> b!108881 (= res!89792 (bvslt i!615 nBits!396))))

(declare-fun b!108882 () Bool)

(declare-fun e!71300 () Bool)

(assert (=> b!108882 (= e!71300 true)))

(assert (=> b!108882 e!71295))

(declare-fun res!89793 () Bool)

(assert (=> b!108882 (=> (not res!89793) (not e!71295))))

(declare-fun lt!164297 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3992 (_ BitVec 64)) BitStream!3992)

(assert (=> b!108882 (= res!89793 (= (_1!4761 lt!164313) (withMovedBitIndex!0 (_2!4761 lt!164313) (bvsub lt!164301 lt!164297))))))

(assert (=> b!108882 (= lt!164301 (bitIndex!0 (size!2259 (buf!2650 (_2!4759 lt!164298))) (currentByte!5186 (_2!4759 lt!164298)) (currentBit!5181 (_2!4759 lt!164298))))))

(assert (=> b!108882 (= (_1!4761 lt!164318) (withMovedBitIndex!0 (_2!4761 lt!164318) (bvsub lt!164309 lt!164297)))))

(assert (=> b!108882 (= lt!164297 (bitIndex!0 (size!2259 (buf!2650 (_2!4759 lt!164323))) (currentByte!5186 (_2!4759 lt!164323)) (currentBit!5181 (_2!4759 lt!164323))))))

(assert (=> b!108882 (= lt!164309 (bitIndex!0 (size!2259 (buf!2650 thiss!1305)) (currentByte!5186 thiss!1305) (currentBit!5181 thiss!1305)))))

(declare-fun lt!164317 () tuple2!9006)

(assert (=> b!108882 (and (= (_2!4760 lt!164304) (_2!4760 lt!164317)) (= (_1!4760 lt!164304) (_1!4760 lt!164317)))))

(declare-fun lt!164311 () Unit!6659)

(declare-fun lt!164307 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6659)

(assert (=> b!108882 (= lt!164311 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4761 lt!164318) nBits!396 i!615 lt!164307))))

(declare-fun lt!164303 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9006)

(assert (=> b!108882 (= lt!164317 (readNLeastSignificantBitsLoopPure!0 lt!164300 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164303))))

(assert (=> b!108882 (= lt!164300 (withMovedBitIndex!0 (_1!4761 lt!164318) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108883 () Bool)

(declare-fun res!89787 () Bool)

(assert (=> b!108883 (=> (not res!89787) (not e!71299))))

(declare-fun isPrefixOf!0 (BitStream!3992 BitStream!3992) Bool)

(assert (=> b!108883 (= res!89787 (isPrefixOf!0 thiss!1305 (_2!4759 lt!164298)))))

(declare-fun b!108884 () Bool)

(assert (=> b!108884 (= e!71293 e!71291)))

(declare-fun res!89785 () Bool)

(assert (=> b!108884 (=> (not res!89785) (not e!71291))))

(declare-fun lt!164306 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108884 (= res!89785 (validate_offset_bits!1 ((_ sign_extend 32) (size!2259 (buf!2650 thiss!1305))) ((_ sign_extend 32) (currentByte!5186 thiss!1305)) ((_ sign_extend 32) (currentBit!5181 thiss!1305)) lt!164306))))

(assert (=> b!108884 (= lt!164306 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108885 () Bool)

(declare-fun res!89795 () Bool)

(assert (=> b!108885 (=> (not res!89795) (not e!71294))))

(assert (=> b!108885 (= res!89795 (invariant!0 (currentBit!5181 thiss!1305) (currentByte!5186 thiss!1305) (size!2259 (buf!2650 (_2!4759 lt!164298)))))))

(declare-fun b!108886 () Bool)

(declare-fun res!89790 () Bool)

(assert (=> b!108886 (=> (not res!89790) (not e!71291))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108886 (= res!89790 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108887 () Bool)

(assert (=> b!108887 (= e!71299 e!71296)))

(declare-fun res!89791 () Bool)

(assert (=> b!108887 (=> (not res!89791) (not e!71296))))

(declare-fun lt!164305 () Bool)

(assert (=> b!108887 (= res!89791 (and (= (_2!4762 lt!164319) lt!164305) (= (_1!4762 lt!164319) (_2!4759 lt!164298))))))

(declare-fun readBitPure!0 (BitStream!3992) tuple2!9010)

(declare-fun readerFrom!0 (BitStream!3992 (_ BitVec 32) (_ BitVec 32)) BitStream!3992)

(assert (=> b!108887 (= lt!164319 (readBitPure!0 (readerFrom!0 (_2!4759 lt!164298) (currentBit!5181 thiss!1305) (currentByte!5186 thiss!1305))))))

(declare-fun b!108888 () Bool)

(assert (=> b!108888 (= e!71291 (not e!71300))))

(declare-fun res!89796 () Bool)

(assert (=> b!108888 (=> res!89796 e!71300)))

(assert (=> b!108888 (= res!89796 (not (= (_1!4760 lt!164322) (_2!4761 lt!164313))))))

(assert (=> b!108888 (= lt!164322 (readNLeastSignificantBitsLoopPure!0 (_1!4761 lt!164313) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164303))))

(declare-fun lt!164324 () (_ BitVec 64))

(assert (=> b!108888 (validate_offset_bits!1 ((_ sign_extend 32) (size!2259 (buf!2650 (_2!4759 lt!164323)))) ((_ sign_extend 32) (currentByte!5186 (_2!4759 lt!164298))) ((_ sign_extend 32) (currentBit!5181 (_2!4759 lt!164298))) lt!164324)))

(declare-fun lt!164308 () Unit!6659)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3992 array!4965 (_ BitVec 64)) Unit!6659)

(assert (=> b!108888 (= lt!164308 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4759 lt!164298) (buf!2650 (_2!4759 lt!164323)) lt!164324))))

(assert (=> b!108888 (= lt!164324 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164299 () tuple2!9010)

(declare-fun lt!164316 () (_ BitVec 64))

(assert (=> b!108888 (= lt!164303 (bvor lt!164307 (ite (_2!4762 lt!164299) lt!164316 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108888 (= lt!164304 (readNLeastSignificantBitsLoopPure!0 (_1!4761 lt!164318) nBits!396 i!615 lt!164307))))

(assert (=> b!108888 (validate_offset_bits!1 ((_ sign_extend 32) (size!2259 (buf!2650 (_2!4759 lt!164323)))) ((_ sign_extend 32) (currentByte!5186 thiss!1305)) ((_ sign_extend 32) (currentBit!5181 thiss!1305)) lt!164306)))

(declare-fun lt!164312 () Unit!6659)

(assert (=> b!108888 (= lt!164312 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2650 (_2!4759 lt!164323)) lt!164306))))

(assert (=> b!108888 (= lt!164307 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108888 (= (_2!4762 lt!164299) lt!164305)))

(assert (=> b!108888 (= lt!164299 (readBitPure!0 (_1!4761 lt!164318)))))

(declare-fun reader!0 (BitStream!3992 BitStream!3992) tuple2!9008)

(assert (=> b!108888 (= lt!164313 (reader!0 (_2!4759 lt!164298) (_2!4759 lt!164323)))))

(assert (=> b!108888 (= lt!164318 (reader!0 thiss!1305 (_2!4759 lt!164323)))))

(declare-fun e!71290 () Bool)

(assert (=> b!108888 e!71290))

(declare-fun res!89797 () Bool)

(assert (=> b!108888 (=> (not res!89797) (not e!71290))))

(declare-fun lt!164320 () tuple2!9010)

(declare-fun lt!164302 () tuple2!9010)

(assert (=> b!108888 (= res!89797 (= (bitIndex!0 (size!2259 (buf!2650 (_1!4762 lt!164320))) (currentByte!5186 (_1!4762 lt!164320)) (currentBit!5181 (_1!4762 lt!164320))) (bitIndex!0 (size!2259 (buf!2650 (_1!4762 lt!164302))) (currentByte!5186 (_1!4762 lt!164302)) (currentBit!5181 (_1!4762 lt!164302)))))))

(declare-fun lt!164310 () Unit!6659)

(declare-fun lt!164315 () BitStream!3992)

(declare-fun readBitPrefixLemma!0 (BitStream!3992 BitStream!3992) Unit!6659)

(assert (=> b!108888 (= lt!164310 (readBitPrefixLemma!0 lt!164315 (_2!4759 lt!164323)))))

(assert (=> b!108888 (= lt!164302 (readBitPure!0 (BitStream!3993 (buf!2650 (_2!4759 lt!164323)) (currentByte!5186 thiss!1305) (currentBit!5181 thiss!1305))))))

(assert (=> b!108888 (= lt!164320 (readBitPure!0 lt!164315))))

(assert (=> b!108888 (= lt!164315 (BitStream!3993 (buf!2650 (_2!4759 lt!164298)) (currentByte!5186 thiss!1305) (currentBit!5181 thiss!1305)))))

(assert (=> b!108888 e!71294))

(declare-fun res!89789 () Bool)

(assert (=> b!108888 (=> (not res!89789) (not e!71294))))

(assert (=> b!108888 (= res!89789 (isPrefixOf!0 thiss!1305 (_2!4759 lt!164323)))))

(declare-fun lt!164314 () Unit!6659)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3992 BitStream!3992 BitStream!3992) Unit!6659)

(assert (=> b!108888 (= lt!164314 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4759 lt!164298) (_2!4759 lt!164323)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3992 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9004)

(assert (=> b!108888 (= lt!164323 (appendNLeastSignificantBitsLoop!0 (_2!4759 lt!164298) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108888 e!71292))

(declare-fun res!89794 () Bool)

(assert (=> b!108888 (=> (not res!89794) (not e!71292))))

(assert (=> b!108888 (= res!89794 (= (size!2259 (buf!2650 thiss!1305)) (size!2259 (buf!2650 (_2!4759 lt!164298)))))))

(declare-fun appendBit!0 (BitStream!3992 Bool) tuple2!9004)

(assert (=> b!108888 (= lt!164298 (appendBit!0 thiss!1305 lt!164305))))

(assert (=> b!108888 (= lt!164305 (not (= (bvand v!199 lt!164316) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108888 (= lt!164316 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108889 () Bool)

(assert (=> b!108889 (= e!71290 (= (_2!4762 lt!164320) (_2!4762 lt!164302)))))

(assert (= (and start!21602 res!89786) b!108884))

(assert (= (and b!108884 res!89785) b!108886))

(assert (= (and b!108886 res!89790) b!108881))

(assert (= (and b!108881 res!89792) b!108888))

(assert (= (and b!108888 res!89794) b!108876))

(assert (= (and b!108876 res!89788) b!108883))

(assert (= (and b!108883 res!89787) b!108887))

(assert (= (and b!108887 res!89791) b!108879))

(assert (= (and b!108888 res!89789) b!108885))

(assert (= (and b!108885 res!89795) b!108878))

(assert (= (and b!108888 res!89797) b!108889))

(assert (= (and b!108888 (not res!89796)) b!108882))

(assert (= (and b!108882 res!89793) b!108877))

(assert (= start!21602 b!108880))

(declare-fun m!161469 () Bool)

(assert (=> b!108885 m!161469))

(declare-fun m!161471 () Bool)

(assert (=> b!108887 m!161471))

(assert (=> b!108887 m!161471))

(declare-fun m!161473 () Bool)

(assert (=> b!108887 m!161473))

(declare-fun m!161475 () Bool)

(assert (=> b!108888 m!161475))

(declare-fun m!161477 () Bool)

(assert (=> b!108888 m!161477))

(declare-fun m!161479 () Bool)

(assert (=> b!108888 m!161479))

(declare-fun m!161481 () Bool)

(assert (=> b!108888 m!161481))

(declare-fun m!161483 () Bool)

(assert (=> b!108888 m!161483))

(declare-fun m!161485 () Bool)

(assert (=> b!108888 m!161485))

(declare-fun m!161487 () Bool)

(assert (=> b!108888 m!161487))

(declare-fun m!161489 () Bool)

(assert (=> b!108888 m!161489))

(declare-fun m!161491 () Bool)

(assert (=> b!108888 m!161491))

(declare-fun m!161493 () Bool)

(assert (=> b!108888 m!161493))

(declare-fun m!161495 () Bool)

(assert (=> b!108888 m!161495))

(declare-fun m!161497 () Bool)

(assert (=> b!108888 m!161497))

(declare-fun m!161499 () Bool)

(assert (=> b!108888 m!161499))

(declare-fun m!161501 () Bool)

(assert (=> b!108888 m!161501))

(declare-fun m!161503 () Bool)

(assert (=> b!108888 m!161503))

(declare-fun m!161505 () Bool)

(assert (=> b!108888 m!161505))

(declare-fun m!161507 () Bool)

(assert (=> b!108888 m!161507))

(declare-fun m!161509 () Bool)

(assert (=> b!108888 m!161509))

(declare-fun m!161511 () Bool)

(assert (=> b!108888 m!161511))

(declare-fun m!161513 () Bool)

(assert (=> b!108884 m!161513))

(declare-fun m!161515 () Bool)

(assert (=> b!108883 m!161515))

(declare-fun m!161517 () Bool)

(assert (=> start!21602 m!161517))

(declare-fun m!161519 () Bool)

(assert (=> b!108876 m!161519))

(declare-fun m!161521 () Bool)

(assert (=> b!108876 m!161521))

(declare-fun m!161523 () Bool)

(assert (=> b!108882 m!161523))

(assert (=> b!108882 m!161521))

(declare-fun m!161525 () Bool)

(assert (=> b!108882 m!161525))

(assert (=> b!108882 m!161519))

(declare-fun m!161527 () Bool)

(assert (=> b!108882 m!161527))

(declare-fun m!161529 () Bool)

(assert (=> b!108882 m!161529))

(declare-fun m!161531 () Bool)

(assert (=> b!108882 m!161531))

(declare-fun m!161533 () Bool)

(assert (=> b!108882 m!161533))

(declare-fun m!161535 () Bool)

(assert (=> b!108880 m!161535))

(declare-fun m!161537 () Bool)

(assert (=> b!108886 m!161537))

(declare-fun m!161539 () Bool)

(assert (=> b!108879 m!161539))

(declare-fun m!161541 () Bool)

(assert (=> b!108878 m!161541))

(push 1)

