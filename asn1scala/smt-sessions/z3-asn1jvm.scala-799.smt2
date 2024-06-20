; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23110 () Bool)

(assert start!23110)

(declare-fun b!117307 () Bool)

(declare-fun res!97034 () Bool)

(declare-fun e!76910 () Bool)

(assert (=> b!117307 (=> (not res!97034) (not e!76910))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117307 (= res!97034 (bvslt i!615 nBits!396))))

(declare-fun b!117308 () Bool)

(declare-fun res!97044 () Bool)

(declare-fun e!76907 () Bool)

(assert (=> b!117308 (=> (not res!97044) (not e!76907))))

(declare-datatypes ((array!5281 0))(
  ( (array!5282 (arr!2989 (Array (_ BitVec 32) (_ BitVec 8))) (size!2396 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4266 0))(
  ( (BitStream!4267 (buf!2809 array!5281) (currentByte!5452 (_ BitVec 32)) (currentBit!5447 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4266)

(declare-datatypes ((Unit!7215 0))(
  ( (Unit!7216) )
))
(declare-datatypes ((tuple2!9780 0))(
  ( (tuple2!9781 (_1!5155 Unit!7215) (_2!5155 BitStream!4266)) )
))
(declare-fun lt!179595 () tuple2!9780)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117308 (= res!97044 (invariant!0 (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179595)))))))

(declare-fun b!117309 () Bool)

(declare-fun e!76906 () Bool)

(declare-fun e!76909 () Bool)

(assert (=> b!117309 (= e!76906 e!76909)))

(declare-fun res!97037 () Bool)

(assert (=> b!117309 (=> (not res!97037) (not e!76909))))

(declare-datatypes ((tuple2!9782 0))(
  ( (tuple2!9783 (_1!5156 BitStream!4266) (_2!5156 Bool)) )
))
(declare-fun lt!179602 () tuple2!9782)

(declare-fun lt!179601 () Bool)

(assert (=> b!117309 (= res!97037 (and (= (_2!5156 lt!179602) lt!179601) (= (_1!5156 lt!179602) (_2!5155 lt!179595))))))

(declare-fun readBitPure!0 (BitStream!4266) tuple2!9782)

(declare-fun readerFrom!0 (BitStream!4266 (_ BitVec 32) (_ BitVec 32)) BitStream!4266)

(assert (=> b!117309 (= lt!179602 (readBitPure!0 (readerFrom!0 (_2!5155 lt!179595) (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305))))))

(declare-fun b!117310 () Bool)

(declare-fun res!97033 () Bool)

(assert (=> b!117310 (=> (not res!97033) (not e!76910))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117310 (= res!97033 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117311 () Bool)

(declare-fun e!76911 () Bool)

(assert (=> b!117311 (= e!76910 (not e!76911))))

(declare-fun res!97041 () Bool)

(assert (=> b!117311 (=> res!97041 e!76911)))

(declare-fun lt!179588 () tuple2!9780)

(declare-fun lt!179590 () (_ BitVec 64))

(assert (=> b!117311 (= res!97041 (or (not (= (size!2396 (buf!2809 (_2!5155 lt!179595))) (size!2396 (buf!2809 (_2!5155 lt!179588))))) (bvslt lt!179590 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117311 (= lt!179590 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!9784 0))(
  ( (tuple2!9785 (_1!5157 BitStream!4266) (_2!5157 (_ BitVec 64))) )
))
(declare-fun lt!179589 () tuple2!9784)

(declare-datatypes ((tuple2!9786 0))(
  ( (tuple2!9787 (_1!5158 BitStream!4266) (_2!5158 BitStream!4266)) )
))
(declare-fun lt!179593 () tuple2!9786)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9784)

(assert (=> b!117311 (= lt!179589 (readNLeastSignificantBitsLoopPure!0 (_1!5158 lt!179593) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!179596 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117311 (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179588)))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305)) lt!179596)))

(declare-fun lt!179599 () Unit!7215)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4266 array!5281 (_ BitVec 64)) Unit!7215)

(assert (=> b!117311 (= lt!179599 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2809 (_2!5155 lt!179588)) lt!179596))))

(assert (=> b!117311 (= (_2!5156 (readBitPure!0 (_1!5158 lt!179593))) lt!179601)))

(declare-fun lt!179597 () tuple2!9786)

(declare-fun reader!0 (BitStream!4266 BitStream!4266) tuple2!9786)

(assert (=> b!117311 (= lt!179597 (reader!0 (_2!5155 lt!179595) (_2!5155 lt!179588)))))

(assert (=> b!117311 (= lt!179593 (reader!0 thiss!1305 (_2!5155 lt!179588)))))

(declare-fun e!76902 () Bool)

(assert (=> b!117311 e!76902))

(declare-fun res!97040 () Bool)

(assert (=> b!117311 (=> (not res!97040) (not e!76902))))

(declare-fun lt!179594 () tuple2!9782)

(declare-fun lt!179604 () tuple2!9782)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117311 (= res!97040 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!179594))) (currentByte!5452 (_1!5156 lt!179594)) (currentBit!5447 (_1!5156 lt!179594))) (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!179604))) (currentByte!5452 (_1!5156 lt!179604)) (currentBit!5447 (_1!5156 lt!179604)))))))

(declare-fun lt!179600 () Unit!7215)

(declare-fun lt!179598 () BitStream!4266)

(declare-fun readBitPrefixLemma!0 (BitStream!4266 BitStream!4266) Unit!7215)

(assert (=> b!117311 (= lt!179600 (readBitPrefixLemma!0 lt!179598 (_2!5155 lt!179588)))))

(assert (=> b!117311 (= lt!179604 (readBitPure!0 (BitStream!4267 (buf!2809 (_2!5155 lt!179588)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305))))))

(assert (=> b!117311 (= lt!179594 (readBitPure!0 lt!179598))))

(assert (=> b!117311 (= lt!179598 (BitStream!4267 (buf!2809 (_2!5155 lt!179595)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)))))

(assert (=> b!117311 e!76907))

(declare-fun res!97042 () Bool)

(assert (=> b!117311 (=> (not res!97042) (not e!76907))))

(declare-fun isPrefixOf!0 (BitStream!4266 BitStream!4266) Bool)

(assert (=> b!117311 (= res!97042 (isPrefixOf!0 thiss!1305 (_2!5155 lt!179588)))))

(declare-fun lt!179591 () Unit!7215)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4266 BitStream!4266 BitStream!4266) Unit!7215)

(assert (=> b!117311 (= lt!179591 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5155 lt!179595) (_2!5155 lt!179588)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9780)

(assert (=> b!117311 (= lt!179588 (appendNLeastSignificantBitsLoop!0 (_2!5155 lt!179595) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76903 () Bool)

(assert (=> b!117311 e!76903))

(declare-fun res!97036 () Bool)

(assert (=> b!117311 (=> (not res!97036) (not e!76903))))

(assert (=> b!117311 (= res!97036 (= (size!2396 (buf!2809 thiss!1305)) (size!2396 (buf!2809 (_2!5155 lt!179595)))))))

(declare-fun appendBit!0 (BitStream!4266 Bool) tuple2!9780)

(assert (=> b!117311 (= lt!179595 (appendBit!0 thiss!1305 lt!179601))))

(assert (=> b!117311 (= lt!179601 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!117312 () Bool)

(assert (=> b!117312 (= e!76902 (= (_2!5156 lt!179594) (_2!5156 lt!179604)))))

(declare-fun b!117313 () Bool)

(assert (=> b!117313 (= e!76911 (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179595)))) ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!179595))) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!179595))) lt!179590))))

(declare-fun res!97039 () Bool)

(declare-fun e!76904 () Bool)

(assert (=> start!23110 (=> (not res!97039) (not e!76904))))

(assert (=> start!23110 (= res!97039 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23110 e!76904))

(assert (=> start!23110 true))

(declare-fun e!76905 () Bool)

(declare-fun inv!12 (BitStream!4266) Bool)

(assert (=> start!23110 (and (inv!12 thiss!1305) e!76905)))

(declare-fun b!117314 () Bool)

(assert (=> b!117314 (= e!76907 (invariant!0 (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179588)))))))

(declare-fun b!117315 () Bool)

(assert (=> b!117315 (= e!76903 e!76906)))

(declare-fun res!97038 () Bool)

(assert (=> b!117315 (=> (not res!97038) (not e!76906))))

(declare-fun lt!179592 () (_ BitVec 64))

(declare-fun lt!179603 () (_ BitVec 64))

(assert (=> b!117315 (= res!97038 (= lt!179592 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!179603)))))

(assert (=> b!117315 (= lt!179592 (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))))))

(assert (=> b!117315 (= lt!179603 (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)))))

(declare-fun b!117316 () Bool)

(declare-fun res!97035 () Bool)

(assert (=> b!117316 (=> (not res!97035) (not e!76906))))

(assert (=> b!117316 (= res!97035 (isPrefixOf!0 thiss!1305 (_2!5155 lt!179595)))))

(declare-fun b!117317 () Bool)

(declare-fun array_inv!2198 (array!5281) Bool)

(assert (=> b!117317 (= e!76905 (array_inv!2198 (buf!2809 thiss!1305)))))

(declare-fun b!117318 () Bool)

(assert (=> b!117318 (= e!76909 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!179602))) (currentByte!5452 (_1!5156 lt!179602)) (currentBit!5447 (_1!5156 lt!179602))) lt!179592))))

(declare-fun b!117319 () Bool)

(assert (=> b!117319 (= e!76904 e!76910)))

(declare-fun res!97043 () Bool)

(assert (=> b!117319 (=> (not res!97043) (not e!76910))))

(assert (=> b!117319 (= res!97043 (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 thiss!1305))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305)) lt!179596))))

(assert (=> b!117319 (= lt!179596 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!23110 res!97039) b!117319))

(assert (= (and b!117319 res!97043) b!117310))

(assert (= (and b!117310 res!97033) b!117307))

(assert (= (and b!117307 res!97034) b!117311))

(assert (= (and b!117311 res!97036) b!117315))

(assert (= (and b!117315 res!97038) b!117316))

(assert (= (and b!117316 res!97035) b!117309))

(assert (= (and b!117309 res!97037) b!117318))

(assert (= (and b!117311 res!97042) b!117308))

(assert (= (and b!117308 res!97044) b!117314))

(assert (= (and b!117311 res!97040) b!117312))

(assert (= (and b!117311 (not res!97041)) b!117313))

(assert (= start!23110 b!117317))

(declare-fun m!175839 () Bool)

(assert (=> b!117311 m!175839))

(declare-fun m!175841 () Bool)

(assert (=> b!117311 m!175841))

(declare-fun m!175843 () Bool)

(assert (=> b!117311 m!175843))

(declare-fun m!175845 () Bool)

(assert (=> b!117311 m!175845))

(declare-fun m!175847 () Bool)

(assert (=> b!117311 m!175847))

(declare-fun m!175849 () Bool)

(assert (=> b!117311 m!175849))

(declare-fun m!175851 () Bool)

(assert (=> b!117311 m!175851))

(declare-fun m!175853 () Bool)

(assert (=> b!117311 m!175853))

(declare-fun m!175855 () Bool)

(assert (=> b!117311 m!175855))

(declare-fun m!175857 () Bool)

(assert (=> b!117311 m!175857))

(declare-fun m!175859 () Bool)

(assert (=> b!117311 m!175859))

(declare-fun m!175861 () Bool)

(assert (=> b!117311 m!175861))

(declare-fun m!175863 () Bool)

(assert (=> b!117311 m!175863))

(declare-fun m!175865 () Bool)

(assert (=> b!117311 m!175865))

(declare-fun m!175867 () Bool)

(assert (=> b!117311 m!175867))

(declare-fun m!175869 () Bool)

(assert (=> b!117311 m!175869))

(declare-fun m!175871 () Bool)

(assert (=> b!117309 m!175871))

(assert (=> b!117309 m!175871))

(declare-fun m!175873 () Bool)

(assert (=> b!117309 m!175873))

(declare-fun m!175875 () Bool)

(assert (=> b!117317 m!175875))

(declare-fun m!175877 () Bool)

(assert (=> start!23110 m!175877))

(declare-fun m!175879 () Bool)

(assert (=> b!117310 m!175879))

(declare-fun m!175881 () Bool)

(assert (=> b!117318 m!175881))

(declare-fun m!175883 () Bool)

(assert (=> b!117308 m!175883))

(declare-fun m!175885 () Bool)

(assert (=> b!117313 m!175885))

(declare-fun m!175887 () Bool)

(assert (=> b!117316 m!175887))

(declare-fun m!175889 () Bool)

(assert (=> b!117314 m!175889))

(declare-fun m!175891 () Bool)

(assert (=> b!117315 m!175891))

(declare-fun m!175893 () Bool)

(assert (=> b!117315 m!175893))

(declare-fun m!175895 () Bool)

(assert (=> b!117319 m!175895))

(check-sat (not b!117314) (not b!117319) (not b!117309) (not b!117313) (not b!117308) (not b!117311) (not b!117318) (not b!117315) (not b!117316) (not b!117310) (not start!23110) (not b!117317))
(check-sat)
(get-model)

(declare-fun d!37524 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37524 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179595)))) ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!179595))) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!179595))) lt!179590) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179595)))) ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!179595))) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!179595)))) lt!179590))))

(declare-fun bs!9083 () Bool)

(assert (= bs!9083 d!37524))

(declare-fun m!175955 () Bool)

(assert (=> bs!9083 m!175955))

(assert (=> b!117313 d!37524))

(declare-fun d!37526 () Bool)

(assert (=> d!37526 (= (invariant!0 (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179588)))) (and (bvsge (currentBit!5447 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5447 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5452 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179588)))) (and (= (currentBit!5447 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179588))))))))))

(assert (=> b!117314 d!37526))

(declare-fun d!37528 () Bool)

(assert (=> d!37528 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!117310 d!37528))

(declare-fun d!37530 () Bool)

(declare-fun e!76946 () Bool)

(assert (=> d!37530 e!76946))

(declare-fun res!97088 () Bool)

(assert (=> d!37530 (=> (not res!97088) (not e!76946))))

(declare-fun lt!179714 () tuple2!9786)

(assert (=> d!37530 (= res!97088 (isPrefixOf!0 (_1!5158 lt!179714) (_2!5158 lt!179714)))))

(declare-fun lt!179713 () BitStream!4266)

(assert (=> d!37530 (= lt!179714 (tuple2!9787 lt!179713 (_2!5155 lt!179588)))))

(declare-fun lt!179700 () Unit!7215)

(declare-fun lt!179696 () Unit!7215)

(assert (=> d!37530 (= lt!179700 lt!179696)))

(assert (=> d!37530 (isPrefixOf!0 lt!179713 (_2!5155 lt!179588))))

(assert (=> d!37530 (= lt!179696 (lemmaIsPrefixTransitive!0 lt!179713 (_2!5155 lt!179588) (_2!5155 lt!179588)))))

(declare-fun lt!179704 () Unit!7215)

(declare-fun lt!179702 () Unit!7215)

(assert (=> d!37530 (= lt!179704 lt!179702)))

(assert (=> d!37530 (isPrefixOf!0 lt!179713 (_2!5155 lt!179588))))

(assert (=> d!37530 (= lt!179702 (lemmaIsPrefixTransitive!0 lt!179713 thiss!1305 (_2!5155 lt!179588)))))

(declare-fun lt!179706 () Unit!7215)

(declare-fun e!76947 () Unit!7215)

(assert (=> d!37530 (= lt!179706 e!76947)))

(declare-fun c!7063 () Bool)

(assert (=> d!37530 (= c!7063 (not (= (size!2396 (buf!2809 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!179698 () Unit!7215)

(declare-fun lt!179715 () Unit!7215)

(assert (=> d!37530 (= lt!179698 lt!179715)))

(assert (=> d!37530 (isPrefixOf!0 (_2!5155 lt!179588) (_2!5155 lt!179588))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4266) Unit!7215)

(assert (=> d!37530 (= lt!179715 (lemmaIsPrefixRefl!0 (_2!5155 lt!179588)))))

(declare-fun lt!179699 () Unit!7215)

(declare-fun lt!179708 () Unit!7215)

(assert (=> d!37530 (= lt!179699 lt!179708)))

(assert (=> d!37530 (= lt!179708 (lemmaIsPrefixRefl!0 (_2!5155 lt!179588)))))

(declare-fun lt!179711 () Unit!7215)

(declare-fun lt!179701 () Unit!7215)

(assert (=> d!37530 (= lt!179711 lt!179701)))

(assert (=> d!37530 (isPrefixOf!0 lt!179713 lt!179713)))

(assert (=> d!37530 (= lt!179701 (lemmaIsPrefixRefl!0 lt!179713))))

(declare-fun lt!179703 () Unit!7215)

(declare-fun lt!179710 () Unit!7215)

(assert (=> d!37530 (= lt!179703 lt!179710)))

(assert (=> d!37530 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37530 (= lt!179710 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37530 (= lt!179713 (BitStream!4267 (buf!2809 (_2!5155 lt!179588)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)))))

(assert (=> d!37530 (isPrefixOf!0 thiss!1305 (_2!5155 lt!179588))))

(assert (=> d!37530 (= (reader!0 thiss!1305 (_2!5155 lt!179588)) lt!179714)))

(declare-fun b!117369 () Bool)

(declare-fun res!97089 () Bool)

(assert (=> b!117369 (=> (not res!97089) (not e!76946))))

(assert (=> b!117369 (= res!97089 (isPrefixOf!0 (_2!5158 lt!179714) (_2!5155 lt!179588)))))

(declare-fun b!117370 () Bool)

(declare-fun lt!179697 () Unit!7215)

(assert (=> b!117370 (= e!76947 lt!179697)))

(declare-fun lt!179709 () (_ BitVec 64))

(assert (=> b!117370 (= lt!179709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!179712 () (_ BitVec 64))

(assert (=> b!117370 (= lt!179712 (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5281 array!5281 (_ BitVec 64) (_ BitVec 64)) Unit!7215)

(assert (=> b!117370 (= lt!179697 (arrayBitRangesEqSymmetric!0 (buf!2809 thiss!1305) (buf!2809 (_2!5155 lt!179588)) lt!179709 lt!179712))))

(declare-fun arrayBitRangesEq!0 (array!5281 array!5281 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117370 (arrayBitRangesEq!0 (buf!2809 (_2!5155 lt!179588)) (buf!2809 thiss!1305) lt!179709 lt!179712)))

(declare-fun lt!179705 () (_ BitVec 64))

(declare-fun lt!179707 () (_ BitVec 64))

(declare-fun b!117371 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4266 (_ BitVec 64)) BitStream!4266)

(assert (=> b!117371 (= e!76946 (= (_1!5158 lt!179714) (withMovedBitIndex!0 (_2!5158 lt!179714) (bvsub lt!179707 lt!179705))))))

(assert (=> b!117371 (or (= (bvand lt!179707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179707 lt!179705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117371 (= lt!179705 (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179588))) (currentByte!5452 (_2!5155 lt!179588)) (currentBit!5447 (_2!5155 lt!179588))))))

(assert (=> b!117371 (= lt!179707 (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)))))

(declare-fun b!117372 () Bool)

(declare-fun Unit!7219 () Unit!7215)

(assert (=> b!117372 (= e!76947 Unit!7219)))

(declare-fun b!117373 () Bool)

(declare-fun res!97087 () Bool)

(assert (=> b!117373 (=> (not res!97087) (not e!76946))))

(assert (=> b!117373 (= res!97087 (isPrefixOf!0 (_1!5158 lt!179714) thiss!1305))))

(assert (= (and d!37530 c!7063) b!117370))

(assert (= (and d!37530 (not c!7063)) b!117372))

(assert (= (and d!37530 res!97088) b!117373))

(assert (= (and b!117373 res!97087) b!117369))

(assert (= (and b!117369 res!97089) b!117371))

(declare-fun m!175957 () Bool)

(assert (=> b!117369 m!175957))

(declare-fun m!175959 () Bool)

(assert (=> b!117371 m!175959))

(declare-fun m!175961 () Bool)

(assert (=> b!117371 m!175961))

(assert (=> b!117371 m!175893))

(declare-fun m!175963 () Bool)

(assert (=> b!117373 m!175963))

(declare-fun m!175965 () Bool)

(assert (=> d!37530 m!175965))

(declare-fun m!175967 () Bool)

(assert (=> d!37530 m!175967))

(declare-fun m!175969 () Bool)

(assert (=> d!37530 m!175969))

(declare-fun m!175971 () Bool)

(assert (=> d!37530 m!175971))

(assert (=> d!37530 m!175849))

(declare-fun m!175973 () Bool)

(assert (=> d!37530 m!175973))

(declare-fun m!175975 () Bool)

(assert (=> d!37530 m!175975))

(declare-fun m!175977 () Bool)

(assert (=> d!37530 m!175977))

(declare-fun m!175979 () Bool)

(assert (=> d!37530 m!175979))

(declare-fun m!175981 () Bool)

(assert (=> d!37530 m!175981))

(declare-fun m!175983 () Bool)

(assert (=> d!37530 m!175983))

(assert (=> b!117370 m!175893))

(declare-fun m!175985 () Bool)

(assert (=> b!117370 m!175985))

(declare-fun m!175987 () Bool)

(assert (=> b!117370 m!175987))

(assert (=> b!117311 d!37530))

(declare-fun d!37532 () Bool)

(declare-fun e!76950 () Bool)

(assert (=> d!37532 e!76950))

(declare-fun res!97095 () Bool)

(assert (=> d!37532 (=> (not res!97095) (not e!76950))))

(declare-fun lt!179730 () (_ BitVec 64))

(declare-fun lt!179733 () (_ BitVec 64))

(declare-fun lt!179731 () (_ BitVec 64))

(assert (=> d!37532 (= res!97095 (= lt!179731 (bvsub lt!179733 lt!179730)))))

(assert (=> d!37532 (or (= (bvand lt!179733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179733 lt!179730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37532 (= lt!179730 (remainingBits!0 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179594)))) ((_ sign_extend 32) (currentByte!5452 (_1!5156 lt!179594))) ((_ sign_extend 32) (currentBit!5447 (_1!5156 lt!179594)))))))

(declare-fun lt!179729 () (_ BitVec 64))

(declare-fun lt!179732 () (_ BitVec 64))

(assert (=> d!37532 (= lt!179733 (bvmul lt!179729 lt!179732))))

(assert (=> d!37532 (or (= lt!179729 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179732 (bvsdiv (bvmul lt!179729 lt!179732) lt!179729)))))

(assert (=> d!37532 (= lt!179732 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37532 (= lt!179729 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179594)))))))

(assert (=> d!37532 (= lt!179731 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5452 (_1!5156 lt!179594))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5447 (_1!5156 lt!179594)))))))

(assert (=> d!37532 (invariant!0 (currentBit!5447 (_1!5156 lt!179594)) (currentByte!5452 (_1!5156 lt!179594)) (size!2396 (buf!2809 (_1!5156 lt!179594))))))

(assert (=> d!37532 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!179594))) (currentByte!5452 (_1!5156 lt!179594)) (currentBit!5447 (_1!5156 lt!179594))) lt!179731)))

(declare-fun b!117378 () Bool)

(declare-fun res!97094 () Bool)

(assert (=> b!117378 (=> (not res!97094) (not e!76950))))

(assert (=> b!117378 (= res!97094 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179731))))

(declare-fun b!117379 () Bool)

(declare-fun lt!179728 () (_ BitVec 64))

(assert (=> b!117379 (= e!76950 (bvsle lt!179731 (bvmul lt!179728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117379 (or (= lt!179728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179728)))))

(assert (=> b!117379 (= lt!179728 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179594)))))))

(assert (= (and d!37532 res!97095) b!117378))

(assert (= (and b!117378 res!97094) b!117379))

(declare-fun m!175989 () Bool)

(assert (=> d!37532 m!175989))

(declare-fun m!175991 () Bool)

(assert (=> d!37532 m!175991))

(assert (=> b!117311 d!37532))

(declare-fun b!117390 () Bool)

(declare-fun res!97105 () Bool)

(declare-fun e!76955 () Bool)

(assert (=> b!117390 (=> (not res!97105) (not e!76955))))

(declare-fun lt!179743 () tuple2!9780)

(assert (=> b!117390 (= res!97105 (isPrefixOf!0 thiss!1305 (_2!5155 lt!179743)))))

(declare-fun b!117391 () Bool)

(declare-fun e!76956 () Bool)

(assert (=> b!117391 (= e!76955 e!76956)))

(declare-fun res!97104 () Bool)

(assert (=> b!117391 (=> (not res!97104) (not e!76956))))

(declare-fun lt!179745 () tuple2!9782)

(assert (=> b!117391 (= res!97104 (and (= (_2!5156 lt!179745) lt!179601) (= (_1!5156 lt!179745) (_2!5155 lt!179743))))))

(assert (=> b!117391 (= lt!179745 (readBitPure!0 (readerFrom!0 (_2!5155 lt!179743) (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305))))))

(declare-fun b!117392 () Bool)

(assert (=> b!117392 (= e!76956 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!179745))) (currentByte!5452 (_1!5156 lt!179745)) (currentBit!5447 (_1!5156 lt!179745))) (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179743))) (currentByte!5452 (_2!5155 lt!179743)) (currentBit!5447 (_2!5155 lt!179743)))))))

(declare-fun b!117389 () Bool)

(declare-fun res!97106 () Bool)

(assert (=> b!117389 (=> (not res!97106) (not e!76955))))

(declare-fun lt!179744 () (_ BitVec 64))

(declare-fun lt!179742 () (_ BitVec 64))

(assert (=> b!117389 (= res!97106 (= (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179743))) (currentByte!5452 (_2!5155 lt!179743)) (currentBit!5447 (_2!5155 lt!179743))) (bvadd lt!179742 lt!179744)))))

(assert (=> b!117389 (or (not (= (bvand lt!179742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179744 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!179742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!179742 lt!179744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117389 (= lt!179744 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!117389 (= lt!179742 (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)))))

(declare-fun d!37534 () Bool)

(assert (=> d!37534 e!76955))

(declare-fun res!97107 () Bool)

(assert (=> d!37534 (=> (not res!97107) (not e!76955))))

(assert (=> d!37534 (= res!97107 (= (size!2396 (buf!2809 thiss!1305)) (size!2396 (buf!2809 (_2!5155 lt!179743)))))))

(declare-fun choose!16 (BitStream!4266 Bool) tuple2!9780)

(assert (=> d!37534 (= lt!179743 (choose!16 thiss!1305 lt!179601))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37534 (validate_offset_bit!0 ((_ sign_extend 32) (size!2396 (buf!2809 thiss!1305))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305)))))

(assert (=> d!37534 (= (appendBit!0 thiss!1305 lt!179601) lt!179743)))

(assert (= (and d!37534 res!97107) b!117389))

(assert (= (and b!117389 res!97106) b!117390))

(assert (= (and b!117390 res!97105) b!117391))

(assert (= (and b!117391 res!97104) b!117392))

(declare-fun m!175993 () Bool)

(assert (=> b!117389 m!175993))

(assert (=> b!117389 m!175893))

(declare-fun m!175995 () Bool)

(assert (=> d!37534 m!175995))

(declare-fun m!175997 () Bool)

(assert (=> d!37534 m!175997))

(declare-fun m!175999 () Bool)

(assert (=> b!117391 m!175999))

(assert (=> b!117391 m!175999))

(declare-fun m!176001 () Bool)

(assert (=> b!117391 m!176001))

(declare-fun m!176003 () Bool)

(assert (=> b!117392 m!176003))

(assert (=> b!117392 m!175993))

(declare-fun m!176005 () Bool)

(assert (=> b!117390 m!176005))

(assert (=> b!117311 d!37534))

(declare-fun d!37536 () Bool)

(declare-datatypes ((tuple2!9796 0))(
  ( (tuple2!9797 (_1!5163 Bool) (_2!5163 BitStream!4266)) )
))
(declare-fun lt!179748 () tuple2!9796)

(declare-fun readBit!0 (BitStream!4266) tuple2!9796)

(assert (=> d!37536 (= lt!179748 (readBit!0 lt!179598))))

(assert (=> d!37536 (= (readBitPure!0 lt!179598) (tuple2!9783 (_2!5163 lt!179748) (_1!5163 lt!179748)))))

(declare-fun bs!9084 () Bool)

(assert (= bs!9084 d!37536))

(declare-fun m!176007 () Bool)

(assert (=> bs!9084 m!176007))

(assert (=> b!117311 d!37536))

(declare-fun d!37538 () Bool)

(declare-fun e!76957 () Bool)

(assert (=> d!37538 e!76957))

(declare-fun res!97109 () Bool)

(assert (=> d!37538 (=> (not res!97109) (not e!76957))))

(declare-fun lt!179751 () (_ BitVec 64))

(declare-fun lt!179754 () (_ BitVec 64))

(declare-fun lt!179752 () (_ BitVec 64))

(assert (=> d!37538 (= res!97109 (= lt!179752 (bvsub lt!179754 lt!179751)))))

(assert (=> d!37538 (or (= (bvand lt!179754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179751 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179754 lt!179751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37538 (= lt!179751 (remainingBits!0 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179604)))) ((_ sign_extend 32) (currentByte!5452 (_1!5156 lt!179604))) ((_ sign_extend 32) (currentBit!5447 (_1!5156 lt!179604)))))))

(declare-fun lt!179750 () (_ BitVec 64))

(declare-fun lt!179753 () (_ BitVec 64))

(assert (=> d!37538 (= lt!179754 (bvmul lt!179750 lt!179753))))

(assert (=> d!37538 (or (= lt!179750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179753 (bvsdiv (bvmul lt!179750 lt!179753) lt!179750)))))

(assert (=> d!37538 (= lt!179753 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37538 (= lt!179750 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179604)))))))

(assert (=> d!37538 (= lt!179752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5452 (_1!5156 lt!179604))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5447 (_1!5156 lt!179604)))))))

(assert (=> d!37538 (invariant!0 (currentBit!5447 (_1!5156 lt!179604)) (currentByte!5452 (_1!5156 lt!179604)) (size!2396 (buf!2809 (_1!5156 lt!179604))))))

(assert (=> d!37538 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!179604))) (currentByte!5452 (_1!5156 lt!179604)) (currentBit!5447 (_1!5156 lt!179604))) lt!179752)))

(declare-fun b!117393 () Bool)

(declare-fun res!97108 () Bool)

(assert (=> b!117393 (=> (not res!97108) (not e!76957))))

(assert (=> b!117393 (= res!97108 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179752))))

(declare-fun b!117394 () Bool)

(declare-fun lt!179749 () (_ BitVec 64))

(assert (=> b!117394 (= e!76957 (bvsle lt!179752 (bvmul lt!179749 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117394 (or (= lt!179749 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179749 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179749)))))

(assert (=> b!117394 (= lt!179749 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179604)))))))

(assert (= (and d!37538 res!97109) b!117393))

(assert (= (and b!117393 res!97108) b!117394))

(declare-fun m!176009 () Bool)

(assert (=> d!37538 m!176009))

(declare-fun m!176011 () Bool)

(assert (=> d!37538 m!176011))

(assert (=> b!117311 d!37538))

(declare-fun b!117511 () Bool)

(declare-fun e!77021 () (_ BitVec 64))

(assert (=> b!117511 (= e!77021 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!117512 () Bool)

(declare-fun res!97205 () Bool)

(declare-fun e!77022 () Bool)

(assert (=> b!117512 (=> (not res!97205) (not e!77022))))

(declare-fun lt!180118 () tuple2!9780)

(assert (=> b!117512 (= res!97205 (isPrefixOf!0 (_2!5155 lt!179595) (_2!5155 lt!180118)))))

(declare-fun b!117513 () Bool)

(declare-fun e!77024 () tuple2!9780)

(declare-fun lt!180125 () tuple2!9780)

(declare-fun Unit!7220 () Unit!7215)

(assert (=> b!117513 (= e!77024 (tuple2!9781 Unit!7220 (_2!5155 lt!180125)))))

(declare-fun lt!180138 () Bool)

(assert (=> b!117513 (= lt!180138 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!180145 () tuple2!9780)

(assert (=> b!117513 (= lt!180145 (appendBit!0 (_2!5155 lt!179595) lt!180138))))

(declare-fun res!97208 () Bool)

(assert (=> b!117513 (= res!97208 (= (size!2396 (buf!2809 (_2!5155 lt!179595))) (size!2396 (buf!2809 (_2!5155 lt!180145)))))))

(declare-fun e!77023 () Bool)

(assert (=> b!117513 (=> (not res!97208) (not e!77023))))

(assert (=> b!117513 e!77023))

(declare-fun lt!180132 () tuple2!9780)

(assert (=> b!117513 (= lt!180132 lt!180145)))

(assert (=> b!117513 (= lt!180125 (appendNLeastSignificantBitsLoop!0 (_2!5155 lt!180132) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!180115 () Unit!7215)

(assert (=> b!117513 (= lt!180115 (lemmaIsPrefixTransitive!0 (_2!5155 lt!179595) (_2!5155 lt!180132) (_2!5155 lt!180125)))))

(declare-fun call!1520 () Bool)

(assert (=> b!117513 call!1520))

(declare-fun lt!180116 () Unit!7215)

(assert (=> b!117513 (= lt!180116 lt!180115)))

(assert (=> b!117513 (invariant!0 (currentBit!5447 (_2!5155 lt!179595)) (currentByte!5452 (_2!5155 lt!179595)) (size!2396 (buf!2809 (_2!5155 lt!180132))))))

(declare-fun lt!180157 () BitStream!4266)

(assert (=> b!117513 (= lt!180157 (BitStream!4267 (buf!2809 (_2!5155 lt!180132)) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))))))

(assert (=> b!117513 (invariant!0 (currentBit!5447 lt!180157) (currentByte!5452 lt!180157) (size!2396 (buf!2809 (_2!5155 lt!180125))))))

(declare-fun lt!180143 () BitStream!4266)

(assert (=> b!117513 (= lt!180143 (BitStream!4267 (buf!2809 (_2!5155 lt!180125)) (currentByte!5452 lt!180157) (currentBit!5447 lt!180157)))))

(declare-fun lt!180114 () tuple2!9782)

(assert (=> b!117513 (= lt!180114 (readBitPure!0 lt!180157))))

(declare-fun lt!180141 () tuple2!9782)

(assert (=> b!117513 (= lt!180141 (readBitPure!0 lt!180143))))

(declare-fun lt!180151 () Unit!7215)

(assert (=> b!117513 (= lt!180151 (readBitPrefixLemma!0 lt!180157 (_2!5155 lt!180125)))))

(declare-fun res!97206 () Bool)

(assert (=> b!117513 (= res!97206 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!180114))) (currentByte!5452 (_1!5156 lt!180114)) (currentBit!5447 (_1!5156 lt!180114))) (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!180141))) (currentByte!5452 (_1!5156 lt!180141)) (currentBit!5447 (_1!5156 lt!180141)))))))

(declare-fun e!77025 () Bool)

(assert (=> b!117513 (=> (not res!97206) (not e!77025))))

(assert (=> b!117513 e!77025))

(declare-fun lt!180156 () Unit!7215)

(assert (=> b!117513 (= lt!180156 lt!180151)))

(declare-fun lt!180146 () tuple2!9786)

(assert (=> b!117513 (= lt!180146 (reader!0 (_2!5155 lt!179595) (_2!5155 lt!180125)))))

(declare-fun lt!180144 () tuple2!9786)

(assert (=> b!117513 (= lt!180144 (reader!0 (_2!5155 lt!180132) (_2!5155 lt!180125)))))

(declare-fun lt!180135 () tuple2!9782)

(assert (=> b!117513 (= lt!180135 (readBitPure!0 (_1!5158 lt!180146)))))

(assert (=> b!117513 (= (_2!5156 lt!180135) lt!180138)))

(declare-fun lt!180121 () Unit!7215)

(declare-fun Unit!7221 () Unit!7215)

(assert (=> b!117513 (= lt!180121 Unit!7221)))

(declare-fun lt!180137 () (_ BitVec 64))

(assert (=> b!117513 (= lt!180137 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!180148 () (_ BitVec 64))

(assert (=> b!117513 (= lt!180148 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!180153 () Unit!7215)

(assert (=> b!117513 (= lt!180153 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5155 lt!179595) (buf!2809 (_2!5155 lt!180125)) lt!180148))))

(assert (=> b!117513 (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!180125)))) ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!179595))) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!179595))) lt!180148)))

(declare-fun lt!180158 () Unit!7215)

(assert (=> b!117513 (= lt!180158 lt!180153)))

(declare-fun lt!180131 () tuple2!9784)

(assert (=> b!117513 (= lt!180131 (readNLeastSignificantBitsLoopPure!0 (_1!5158 lt!180146) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180137))))

(declare-fun lt!180142 () (_ BitVec 64))

(assert (=> b!117513 (= lt!180142 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!180154 () Unit!7215)

(assert (=> b!117513 (= lt!180154 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5155 lt!180132) (buf!2809 (_2!5155 lt!180125)) lt!180142))))

(assert (=> b!117513 (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!180125)))) ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!180132))) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!180132))) lt!180142)))

(declare-fun lt!180127 () Unit!7215)

(assert (=> b!117513 (= lt!180127 lt!180154)))

(declare-fun lt!180149 () tuple2!9784)

(assert (=> b!117513 (= lt!180149 (readNLeastSignificantBitsLoopPure!0 (_1!5158 lt!180144) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!180137 (ite (_2!5156 lt!180135) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!180150 () tuple2!9784)

(assert (=> b!117513 (= lt!180150 (readNLeastSignificantBitsLoopPure!0 (_1!5158 lt!180146) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180137))))

(declare-fun c!7075 () Bool)

(assert (=> b!117513 (= c!7075 (_2!5156 (readBitPure!0 (_1!5158 lt!180146))))))

(declare-fun lt!180130 () tuple2!9784)

(assert (=> b!117513 (= lt!180130 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5158 lt!180146) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!180137 e!77021)))))

(declare-fun lt!180126 () Unit!7215)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7215)

(assert (=> b!117513 (= lt!180126 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5158 lt!180146) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180137))))

(assert (=> b!117513 (and (= (_2!5157 lt!180150) (_2!5157 lt!180130)) (= (_1!5157 lt!180150) (_1!5157 lt!180130)))))

(declare-fun lt!180123 () Unit!7215)

(assert (=> b!117513 (= lt!180123 lt!180126)))

(assert (=> b!117513 (= (_1!5158 lt!180146) (withMovedBitIndex!0 (_2!5158 lt!180146) (bvsub (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))) (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!180125))) (currentByte!5452 (_2!5155 lt!180125)) (currentBit!5447 (_2!5155 lt!180125))))))))

(declare-fun lt!180119 () Unit!7215)

(declare-fun Unit!7222 () Unit!7215)

(assert (=> b!117513 (= lt!180119 Unit!7222)))

(assert (=> b!117513 (= (_1!5158 lt!180144) (withMovedBitIndex!0 (_2!5158 lt!180144) (bvsub (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!180132))) (currentByte!5452 (_2!5155 lt!180132)) (currentBit!5447 (_2!5155 lt!180132))) (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!180125))) (currentByte!5452 (_2!5155 lt!180125)) (currentBit!5447 (_2!5155 lt!180125))))))))

(declare-fun lt!180133 () Unit!7215)

(declare-fun Unit!7223 () Unit!7215)

(assert (=> b!117513 (= lt!180133 Unit!7223)))

(assert (=> b!117513 (= (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))) (bvsub (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!180132))) (currentByte!5452 (_2!5155 lt!180132)) (currentBit!5447 (_2!5155 lt!180132))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!180147 () Unit!7215)

(declare-fun Unit!7224 () Unit!7215)

(assert (=> b!117513 (= lt!180147 Unit!7224)))

(assert (=> b!117513 (= (_2!5157 lt!180131) (_2!5157 lt!180149))))

(declare-fun lt!180122 () Unit!7215)

(declare-fun Unit!7225 () Unit!7215)

(assert (=> b!117513 (= lt!180122 Unit!7225)))

(assert (=> b!117513 (= (_1!5157 lt!180131) (_2!5158 lt!180146))))

(declare-fun b!117514 () Bool)

(declare-fun e!77020 () Bool)

(declare-fun lt!180134 () (_ BitVec 64))

(assert (=> b!117514 (= e!77020 (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179595)))) ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!179595))) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!179595))) lt!180134))))

(declare-fun b!117515 () Bool)

(assert (=> b!117515 (= e!77021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!117516 () Bool)

(declare-fun res!97204 () Bool)

(assert (=> b!117516 (= res!97204 (isPrefixOf!0 (_2!5155 lt!179595) (_2!5155 lt!180145)))))

(assert (=> b!117516 (=> (not res!97204) (not e!77023))))

(declare-fun b!117517 () Bool)

(declare-fun res!97210 () Bool)

(assert (=> b!117517 (=> (not res!97210) (not e!77022))))

(declare-fun lt!180129 () (_ BitVec 64))

(declare-fun lt!180152 () (_ BitVec 64))

(assert (=> b!117517 (= res!97210 (= (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!180118))) (currentByte!5452 (_2!5155 lt!180118)) (currentBit!5447 (_2!5155 lt!180118))) (bvadd lt!180129 lt!180152)))))

(assert (=> b!117517 (or (not (= (bvand lt!180129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180152 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!180129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!180129 lt!180152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117517 (= lt!180152 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117517 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117517 (= lt!180129 (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))))))

(declare-fun lt!180136 () tuple2!9784)

(declare-fun b!117518 () Bool)

(declare-fun lt!180128 () tuple2!9786)

(assert (=> b!117518 (= e!77022 (and (= (_2!5157 lt!180136) v!199) (= (_1!5157 lt!180136) (_2!5158 lt!180128))))))

(declare-fun lt!180155 () (_ BitVec 64))

(assert (=> b!117518 (= lt!180136 (readNLeastSignificantBitsLoopPure!0 (_1!5158 lt!180128) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180155))))

(declare-fun lt!180124 () Unit!7215)

(declare-fun lt!180117 () Unit!7215)

(assert (=> b!117518 (= lt!180124 lt!180117)))

(assert (=> b!117518 (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!180118)))) ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!179595))) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!179595))) lt!180134)))

(assert (=> b!117518 (= lt!180117 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5155 lt!179595) (buf!2809 (_2!5155 lt!180118)) lt!180134))))

(assert (=> b!117518 e!77020))

(declare-fun res!97207 () Bool)

(assert (=> b!117518 (=> (not res!97207) (not e!77020))))

(assert (=> b!117518 (= res!97207 (and (= (size!2396 (buf!2809 (_2!5155 lt!179595))) (size!2396 (buf!2809 (_2!5155 lt!180118)))) (bvsge lt!180134 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117518 (= lt!180134 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117518 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117518 (= lt!180155 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!117518 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117518 (= lt!180128 (reader!0 (_2!5155 lt!179595) (_2!5155 lt!180118)))))

(declare-fun b!117519 () Bool)

(declare-fun res!97209 () Bool)

(assert (=> b!117519 (= res!97209 (= (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!180145))) (currentByte!5452 (_2!5155 lt!180145)) (currentBit!5447 (_2!5155 lt!180145))) (bvadd (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!117519 (=> (not res!97209) (not e!77023))))

(declare-fun b!117520 () Bool)

(declare-fun e!77019 () Bool)

(declare-fun lt!180139 () tuple2!9782)

(assert (=> b!117520 (= e!77019 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!180139))) (currentByte!5452 (_1!5156 lt!180139)) (currentBit!5447 (_1!5156 lt!180139))) (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!180145))) (currentByte!5452 (_2!5155 lt!180145)) (currentBit!5447 (_2!5155 lt!180145)))))))

(declare-fun d!37540 () Bool)

(assert (=> d!37540 e!77022))

(declare-fun res!97211 () Bool)

(assert (=> d!37540 (=> (not res!97211) (not e!77022))))

(assert (=> d!37540 (= res!97211 (= (size!2396 (buf!2809 (_2!5155 lt!179595))) (size!2396 (buf!2809 (_2!5155 lt!180118)))))))

(assert (=> d!37540 (= lt!180118 e!77024)))

(declare-fun c!7076 () Bool)

(assert (=> d!37540 (= c!7076 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37540 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37540 (= (appendNLeastSignificantBitsLoop!0 (_2!5155 lt!179595) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!180118)))

(declare-fun lt!180140 () BitStream!4266)

(declare-fun bm!1517 () Bool)

(assert (=> bm!1517 (= call!1520 (isPrefixOf!0 (ite c!7076 (_2!5155 lt!179595) lt!180140) (ite c!7076 (_2!5155 lt!180125) lt!180140)))))

(declare-fun b!117521 () Bool)

(declare-fun lt!180120 () Unit!7215)

(assert (=> b!117521 (= e!77024 (tuple2!9781 lt!180120 (_2!5155 lt!179595)))))

(assert (=> b!117521 (= lt!180140 (_2!5155 lt!179595))))

(assert (=> b!117521 (= lt!180120 (lemmaIsPrefixRefl!0 lt!180140))))

(assert (=> b!117521 call!1520))

(declare-fun b!117522 () Bool)

(assert (=> b!117522 (= lt!180139 (readBitPure!0 (readerFrom!0 (_2!5155 lt!180145) (currentBit!5447 (_2!5155 lt!179595)) (currentByte!5452 (_2!5155 lt!179595)))))))

(declare-fun res!97212 () Bool)

(assert (=> b!117522 (= res!97212 (and (= (_2!5156 lt!180139) lt!180138) (= (_1!5156 lt!180139) (_2!5155 lt!180145))))))

(assert (=> b!117522 (=> (not res!97212) (not e!77019))))

(assert (=> b!117522 (= e!77023 e!77019)))

(declare-fun b!117523 () Bool)

(assert (=> b!117523 (= e!77025 (= (_2!5156 lt!180114) (_2!5156 lt!180141)))))

(assert (= (and d!37540 c!7076) b!117513))

(assert (= (and d!37540 (not c!7076)) b!117521))

(assert (= (and b!117513 res!97208) b!117519))

(assert (= (and b!117519 res!97209) b!117516))

(assert (= (and b!117516 res!97204) b!117522))

(assert (= (and b!117522 res!97212) b!117520))

(assert (= (and b!117513 res!97206) b!117523))

(assert (= (and b!117513 c!7075) b!117511))

(assert (= (and b!117513 (not c!7075)) b!117515))

(assert (= (or b!117513 b!117521) bm!1517))

(assert (= (and d!37540 res!97211) b!117517))

(assert (= (and b!117517 res!97210) b!117512))

(assert (= (and b!117512 res!97205) b!117518))

(assert (= (and b!117518 res!97207) b!117514))

(declare-fun m!176195 () Bool)

(assert (=> b!117519 m!176195))

(assert (=> b!117519 m!175891))

(declare-fun m!176197 () Bool)

(assert (=> b!117517 m!176197))

(assert (=> b!117517 m!175891))

(declare-fun m!176199 () Bool)

(assert (=> b!117512 m!176199))

(declare-fun m!176201 () Bool)

(assert (=> b!117513 m!176201))

(declare-fun m!176203 () Bool)

(assert (=> b!117513 m!176203))

(declare-fun m!176205 () Bool)

(assert (=> b!117513 m!176205))

(declare-fun m!176207 () Bool)

(assert (=> b!117513 m!176207))

(declare-fun m!176209 () Bool)

(assert (=> b!117513 m!176209))

(declare-fun m!176211 () Bool)

(assert (=> b!117513 m!176211))

(declare-fun m!176213 () Bool)

(assert (=> b!117513 m!176213))

(declare-fun m!176215 () Bool)

(assert (=> b!117513 m!176215))

(declare-fun m!176217 () Bool)

(assert (=> b!117513 m!176217))

(declare-fun m!176219 () Bool)

(assert (=> b!117513 m!176219))

(declare-fun m!176221 () Bool)

(assert (=> b!117513 m!176221))

(declare-fun m!176223 () Bool)

(assert (=> b!117513 m!176223))

(declare-fun m!176225 () Bool)

(assert (=> b!117513 m!176225))

(declare-fun m!176227 () Bool)

(assert (=> b!117513 m!176227))

(assert (=> b!117513 m!175891))

(declare-fun m!176229 () Bool)

(assert (=> b!117513 m!176229))

(declare-fun m!176231 () Bool)

(assert (=> b!117513 m!176231))

(declare-fun m!176233 () Bool)

(assert (=> b!117513 m!176233))

(declare-fun m!176235 () Bool)

(assert (=> b!117513 m!176235))

(declare-fun m!176237 () Bool)

(assert (=> b!117513 m!176237))

(declare-fun m!176239 () Bool)

(assert (=> b!117513 m!176239))

(declare-fun m!176241 () Bool)

(assert (=> b!117513 m!176241))

(declare-fun m!176243 () Bool)

(assert (=> b!117513 m!176243))

(declare-fun m!176245 () Bool)

(assert (=> b!117513 m!176245))

(declare-fun m!176247 () Bool)

(assert (=> b!117513 m!176247))

(assert (=> b!117513 m!176245))

(declare-fun m!176249 () Bool)

(assert (=> b!117513 m!176249))

(declare-fun m!176251 () Bool)

(assert (=> b!117513 m!176251))

(declare-fun m!176253 () Bool)

(assert (=> b!117513 m!176253))

(declare-fun m!176255 () Bool)

(assert (=> b!117518 m!176255))

(declare-fun m!176257 () Bool)

(assert (=> b!117518 m!176257))

(declare-fun m!176259 () Bool)

(assert (=> b!117518 m!176259))

(declare-fun m!176261 () Bool)

(assert (=> b!117518 m!176261))

(assert (=> b!117518 m!176223))

(declare-fun m!176263 () Bool)

(assert (=> b!117522 m!176263))

(assert (=> b!117522 m!176263))

(declare-fun m!176265 () Bool)

(assert (=> b!117522 m!176265))

(declare-fun m!176267 () Bool)

(assert (=> b!117516 m!176267))

(declare-fun m!176269 () Bool)

(assert (=> b!117520 m!176269))

(assert (=> b!117520 m!176195))

(declare-fun m!176271 () Bool)

(assert (=> bm!1517 m!176271))

(declare-fun m!176273 () Bool)

(assert (=> b!117514 m!176273))

(declare-fun m!176275 () Bool)

(assert (=> b!117521 m!176275))

(assert (=> b!117311 d!37540))

(declare-fun d!37618 () Bool)

(declare-fun lt!180159 () tuple2!9796)

(assert (=> d!37618 (= lt!180159 (readBit!0 (BitStream!4267 (buf!2809 (_2!5155 lt!179588)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305))))))

(assert (=> d!37618 (= (readBitPure!0 (BitStream!4267 (buf!2809 (_2!5155 lt!179588)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305))) (tuple2!9783 (_2!5163 lt!180159) (_1!5163 lt!180159)))))

(declare-fun bs!9099 () Bool)

(assert (= bs!9099 d!37618))

(declare-fun m!176277 () Bool)

(assert (=> bs!9099 m!176277))

(assert (=> b!117311 d!37618))

(declare-fun d!37620 () Bool)

(declare-fun e!77028 () Bool)

(assert (=> d!37620 e!77028))

(declare-fun res!97215 () Bool)

(assert (=> d!37620 (=> (not res!97215) (not e!77028))))

(declare-fun lt!180170 () tuple2!9782)

(declare-fun lt!180168 () tuple2!9782)

(assert (=> d!37620 (= res!97215 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!180170))) (currentByte!5452 (_1!5156 lt!180170)) (currentBit!5447 (_1!5156 lt!180170))) (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!180168))) (currentByte!5452 (_1!5156 lt!180168)) (currentBit!5447 (_1!5156 lt!180168)))))))

(declare-fun lt!180169 () Unit!7215)

(declare-fun lt!180171 () BitStream!4266)

(declare-fun choose!50 (BitStream!4266 BitStream!4266 BitStream!4266 tuple2!9782 tuple2!9782 BitStream!4266 Bool tuple2!9782 tuple2!9782 BitStream!4266 Bool) Unit!7215)

(assert (=> d!37620 (= lt!180169 (choose!50 lt!179598 (_2!5155 lt!179588) lt!180171 lt!180170 (tuple2!9783 (_1!5156 lt!180170) (_2!5156 lt!180170)) (_1!5156 lt!180170) (_2!5156 lt!180170) lt!180168 (tuple2!9783 (_1!5156 lt!180168) (_2!5156 lt!180168)) (_1!5156 lt!180168) (_2!5156 lt!180168)))))

(assert (=> d!37620 (= lt!180168 (readBitPure!0 lt!180171))))

(assert (=> d!37620 (= lt!180170 (readBitPure!0 lt!179598))))

(assert (=> d!37620 (= lt!180171 (BitStream!4267 (buf!2809 (_2!5155 lt!179588)) (currentByte!5452 lt!179598) (currentBit!5447 lt!179598)))))

(assert (=> d!37620 (invariant!0 (currentBit!5447 lt!179598) (currentByte!5452 lt!179598) (size!2396 (buf!2809 (_2!5155 lt!179588))))))

(assert (=> d!37620 (= (readBitPrefixLemma!0 lt!179598 (_2!5155 lt!179588)) lt!180169)))

(declare-fun b!117526 () Bool)

(assert (=> b!117526 (= e!77028 (= (_2!5156 lt!180170) (_2!5156 lt!180168)))))

(assert (= (and d!37620 res!97215) b!117526))

(assert (=> d!37620 m!175841))

(declare-fun m!176279 () Bool)

(assert (=> d!37620 m!176279))

(declare-fun m!176281 () Bool)

(assert (=> d!37620 m!176281))

(declare-fun m!176283 () Bool)

(assert (=> d!37620 m!176283))

(declare-fun m!176285 () Bool)

(assert (=> d!37620 m!176285))

(declare-fun m!176287 () Bool)

(assert (=> d!37620 m!176287))

(assert (=> b!117311 d!37620))

(declare-fun d!37622 () Bool)

(assert (=> d!37622 (isPrefixOf!0 thiss!1305 (_2!5155 lt!179588))))

(declare-fun lt!180174 () Unit!7215)

(declare-fun choose!30 (BitStream!4266 BitStream!4266 BitStream!4266) Unit!7215)

(assert (=> d!37622 (= lt!180174 (choose!30 thiss!1305 (_2!5155 lt!179595) (_2!5155 lt!179588)))))

(assert (=> d!37622 (isPrefixOf!0 thiss!1305 (_2!5155 lt!179595))))

(assert (=> d!37622 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5155 lt!179595) (_2!5155 lt!179588)) lt!180174)))

(declare-fun bs!9100 () Bool)

(assert (= bs!9100 d!37622))

(assert (=> bs!9100 m!175849))

(declare-fun m!176289 () Bool)

(assert (=> bs!9100 m!176289))

(assert (=> bs!9100 m!175887))

(assert (=> b!117311 d!37622))

(declare-fun d!37624 () Bool)

(assert (=> d!37624 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!117311 d!37624))

(declare-fun d!37626 () Bool)

(declare-fun e!77029 () Bool)

(assert (=> d!37626 e!77029))

(declare-fun res!97217 () Bool)

(assert (=> d!37626 (=> (not res!97217) (not e!77029))))

(declare-fun lt!180193 () tuple2!9786)

(assert (=> d!37626 (= res!97217 (isPrefixOf!0 (_1!5158 lt!180193) (_2!5158 lt!180193)))))

(declare-fun lt!180192 () BitStream!4266)

(assert (=> d!37626 (= lt!180193 (tuple2!9787 lt!180192 (_2!5155 lt!179588)))))

(declare-fun lt!180179 () Unit!7215)

(declare-fun lt!180175 () Unit!7215)

(assert (=> d!37626 (= lt!180179 lt!180175)))

(assert (=> d!37626 (isPrefixOf!0 lt!180192 (_2!5155 lt!179588))))

(assert (=> d!37626 (= lt!180175 (lemmaIsPrefixTransitive!0 lt!180192 (_2!5155 lt!179588) (_2!5155 lt!179588)))))

(declare-fun lt!180183 () Unit!7215)

(declare-fun lt!180181 () Unit!7215)

(assert (=> d!37626 (= lt!180183 lt!180181)))

(assert (=> d!37626 (isPrefixOf!0 lt!180192 (_2!5155 lt!179588))))

(assert (=> d!37626 (= lt!180181 (lemmaIsPrefixTransitive!0 lt!180192 (_2!5155 lt!179595) (_2!5155 lt!179588)))))

(declare-fun lt!180185 () Unit!7215)

(declare-fun e!77030 () Unit!7215)

(assert (=> d!37626 (= lt!180185 e!77030)))

(declare-fun c!7077 () Bool)

(assert (=> d!37626 (= c!7077 (not (= (size!2396 (buf!2809 (_2!5155 lt!179595))) #b00000000000000000000000000000000)))))

(declare-fun lt!180177 () Unit!7215)

(declare-fun lt!180194 () Unit!7215)

(assert (=> d!37626 (= lt!180177 lt!180194)))

(assert (=> d!37626 (isPrefixOf!0 (_2!5155 lt!179588) (_2!5155 lt!179588))))

(assert (=> d!37626 (= lt!180194 (lemmaIsPrefixRefl!0 (_2!5155 lt!179588)))))

(declare-fun lt!180178 () Unit!7215)

(declare-fun lt!180187 () Unit!7215)

(assert (=> d!37626 (= lt!180178 lt!180187)))

(assert (=> d!37626 (= lt!180187 (lemmaIsPrefixRefl!0 (_2!5155 lt!179588)))))

(declare-fun lt!180190 () Unit!7215)

(declare-fun lt!180180 () Unit!7215)

(assert (=> d!37626 (= lt!180190 lt!180180)))

(assert (=> d!37626 (isPrefixOf!0 lt!180192 lt!180192)))

(assert (=> d!37626 (= lt!180180 (lemmaIsPrefixRefl!0 lt!180192))))

(declare-fun lt!180182 () Unit!7215)

(declare-fun lt!180189 () Unit!7215)

(assert (=> d!37626 (= lt!180182 lt!180189)))

(assert (=> d!37626 (isPrefixOf!0 (_2!5155 lt!179595) (_2!5155 lt!179595))))

(assert (=> d!37626 (= lt!180189 (lemmaIsPrefixRefl!0 (_2!5155 lt!179595)))))

(assert (=> d!37626 (= lt!180192 (BitStream!4267 (buf!2809 (_2!5155 lt!179588)) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))))))

(assert (=> d!37626 (isPrefixOf!0 (_2!5155 lt!179595) (_2!5155 lt!179588))))

(assert (=> d!37626 (= (reader!0 (_2!5155 lt!179595) (_2!5155 lt!179588)) lt!180193)))

(declare-fun b!117527 () Bool)

(declare-fun res!97218 () Bool)

(assert (=> b!117527 (=> (not res!97218) (not e!77029))))

(assert (=> b!117527 (= res!97218 (isPrefixOf!0 (_2!5158 lt!180193) (_2!5155 lt!179588)))))

(declare-fun b!117528 () Bool)

(declare-fun lt!180176 () Unit!7215)

(assert (=> b!117528 (= e!77030 lt!180176)))

(declare-fun lt!180188 () (_ BitVec 64))

(assert (=> b!117528 (= lt!180188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!180191 () (_ BitVec 64))

(assert (=> b!117528 (= lt!180191 (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))))))

(assert (=> b!117528 (= lt!180176 (arrayBitRangesEqSymmetric!0 (buf!2809 (_2!5155 lt!179595)) (buf!2809 (_2!5155 lt!179588)) lt!180188 lt!180191))))

(assert (=> b!117528 (arrayBitRangesEq!0 (buf!2809 (_2!5155 lt!179588)) (buf!2809 (_2!5155 lt!179595)) lt!180188 lt!180191)))

(declare-fun lt!180186 () (_ BitVec 64))

(declare-fun b!117529 () Bool)

(declare-fun lt!180184 () (_ BitVec 64))

(assert (=> b!117529 (= e!77029 (= (_1!5158 lt!180193) (withMovedBitIndex!0 (_2!5158 lt!180193) (bvsub lt!180186 lt!180184))))))

(assert (=> b!117529 (or (= (bvand lt!180186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!180186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!180186 lt!180184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117529 (= lt!180184 (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179588))) (currentByte!5452 (_2!5155 lt!179588)) (currentBit!5447 (_2!5155 lt!179588))))))

(assert (=> b!117529 (= lt!180186 (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))))))

(declare-fun b!117530 () Bool)

(declare-fun Unit!7226 () Unit!7215)

(assert (=> b!117530 (= e!77030 Unit!7226)))

(declare-fun b!117531 () Bool)

(declare-fun res!97216 () Bool)

(assert (=> b!117531 (=> (not res!97216) (not e!77029))))

(assert (=> b!117531 (= res!97216 (isPrefixOf!0 (_1!5158 lt!180193) (_2!5155 lt!179595)))))

(assert (= (and d!37626 c!7077) b!117528))

(assert (= (and d!37626 (not c!7077)) b!117530))

(assert (= (and d!37626 res!97217) b!117531))

(assert (= (and b!117531 res!97216) b!117527))

(assert (= (and b!117527 res!97218) b!117529))

(declare-fun m!176291 () Bool)

(assert (=> b!117527 m!176291))

(declare-fun m!176293 () Bool)

(assert (=> b!117529 m!176293))

(assert (=> b!117529 m!175961))

(assert (=> b!117529 m!175891))

(declare-fun m!176295 () Bool)

(assert (=> b!117531 m!176295))

(declare-fun m!176297 () Bool)

(assert (=> d!37626 m!176297))

(declare-fun m!176299 () Bool)

(assert (=> d!37626 m!176299))

(declare-fun m!176301 () Bool)

(assert (=> d!37626 m!176301))

(declare-fun m!176303 () Bool)

(assert (=> d!37626 m!176303))

(declare-fun m!176305 () Bool)

(assert (=> d!37626 m!176305))

(assert (=> d!37626 m!175973))

(declare-fun m!176307 () Bool)

(assert (=> d!37626 m!176307))

(declare-fun m!176309 () Bool)

(assert (=> d!37626 m!176309))

(declare-fun m!176311 () Bool)

(assert (=> d!37626 m!176311))

(declare-fun m!176313 () Bool)

(assert (=> d!37626 m!176313))

(assert (=> d!37626 m!175983))

(assert (=> b!117528 m!175891))

(declare-fun m!176315 () Bool)

(assert (=> b!117528 m!176315))

(declare-fun m!176317 () Bool)

(assert (=> b!117528 m!176317))

(assert (=> b!117311 d!37626))

(declare-fun d!37628 () Bool)

(declare-fun res!97227 () Bool)

(declare-fun e!77036 () Bool)

(assert (=> d!37628 (=> (not res!97227) (not e!77036))))

(assert (=> d!37628 (= res!97227 (= (size!2396 (buf!2809 thiss!1305)) (size!2396 (buf!2809 (_2!5155 lt!179588)))))))

(assert (=> d!37628 (= (isPrefixOf!0 thiss!1305 (_2!5155 lt!179588)) e!77036)))

(declare-fun b!117538 () Bool)

(declare-fun res!97226 () Bool)

(assert (=> b!117538 (=> (not res!97226) (not e!77036))))

(assert (=> b!117538 (= res!97226 (bvsle (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)) (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179588))) (currentByte!5452 (_2!5155 lt!179588)) (currentBit!5447 (_2!5155 lt!179588)))))))

(declare-fun b!117539 () Bool)

(declare-fun e!77035 () Bool)

(assert (=> b!117539 (= e!77036 e!77035)))

(declare-fun res!97225 () Bool)

(assert (=> b!117539 (=> res!97225 e!77035)))

(assert (=> b!117539 (= res!97225 (= (size!2396 (buf!2809 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!117540 () Bool)

(assert (=> b!117540 (= e!77035 (arrayBitRangesEq!0 (buf!2809 thiss!1305) (buf!2809 (_2!5155 lt!179588)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305))))))

(assert (= (and d!37628 res!97227) b!117538))

(assert (= (and b!117538 res!97226) b!117539))

(assert (= (and b!117539 (not res!97225)) b!117540))

(assert (=> b!117538 m!175893))

(assert (=> b!117538 m!175961))

(assert (=> b!117540 m!175893))

(assert (=> b!117540 m!175893))

(declare-fun m!176319 () Bool)

(assert (=> b!117540 m!176319))

(assert (=> b!117311 d!37628))

(declare-fun d!37630 () Bool)

(assert (=> d!37630 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179588)))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305)) lt!179596) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179588)))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305))) lt!179596))))

(declare-fun bs!9101 () Bool)

(assert (= bs!9101 d!37630))

(declare-fun m!176321 () Bool)

(assert (=> bs!9101 m!176321))

(assert (=> b!117311 d!37630))

(declare-fun d!37632 () Bool)

(declare-datatypes ((tuple2!9798 0))(
  ( (tuple2!9799 (_1!5164 (_ BitVec 64)) (_2!5164 BitStream!4266)) )
))
(declare-fun lt!180197 () tuple2!9798)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9798)

(assert (=> d!37632 (= lt!180197 (readNLeastSignificantBitsLoop!0 (_1!5158 lt!179593) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!37632 (= (readNLeastSignificantBitsLoopPure!0 (_1!5158 lt!179593) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!9785 (_2!5164 lt!180197) (_1!5164 lt!180197)))))

(declare-fun bs!9102 () Bool)

(assert (= bs!9102 d!37632))

(declare-fun m!176323 () Bool)

(assert (=> bs!9102 m!176323))

(assert (=> b!117311 d!37632))

(declare-fun d!37634 () Bool)

(declare-fun lt!180198 () tuple2!9796)

(assert (=> d!37634 (= lt!180198 (readBit!0 (_1!5158 lt!179593)))))

(assert (=> d!37634 (= (readBitPure!0 (_1!5158 lt!179593)) (tuple2!9783 (_2!5163 lt!180198) (_1!5163 lt!180198)))))

(declare-fun bs!9103 () Bool)

(assert (= bs!9103 d!37634))

(declare-fun m!176325 () Bool)

(assert (=> bs!9103 m!176325))

(assert (=> b!117311 d!37634))

(declare-fun d!37636 () Bool)

(assert (=> d!37636 (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179588)))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305)) lt!179596)))

(declare-fun lt!180201 () Unit!7215)

(declare-fun choose!9 (BitStream!4266 array!5281 (_ BitVec 64) BitStream!4266) Unit!7215)

(assert (=> d!37636 (= lt!180201 (choose!9 thiss!1305 (buf!2809 (_2!5155 lt!179588)) lt!179596 (BitStream!4267 (buf!2809 (_2!5155 lt!179588)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305))))))

(assert (=> d!37636 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2809 (_2!5155 lt!179588)) lt!179596) lt!180201)))

(declare-fun bs!9104 () Bool)

(assert (= bs!9104 d!37636))

(assert (=> bs!9104 m!175867))

(declare-fun m!176327 () Bool)

(assert (=> bs!9104 m!176327))

(assert (=> b!117311 d!37636))

(declare-fun d!37638 () Bool)

(assert (=> d!37638 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305) (size!2396 (buf!2809 thiss!1305))))))

(declare-fun bs!9105 () Bool)

(assert (= bs!9105 d!37638))

(declare-fun m!176329 () Bool)

(assert (=> bs!9105 m!176329))

(assert (=> start!23110 d!37638))

(declare-fun d!37640 () Bool)

(declare-fun e!77037 () Bool)

(assert (=> d!37640 e!77037))

(declare-fun res!97229 () Bool)

(assert (=> d!37640 (=> (not res!97229) (not e!77037))))

(declare-fun lt!180204 () (_ BitVec 64))

(declare-fun lt!180205 () (_ BitVec 64))

(declare-fun lt!180207 () (_ BitVec 64))

(assert (=> d!37640 (= res!97229 (= lt!180205 (bvsub lt!180207 lt!180204)))))

(assert (=> d!37640 (or (= (bvand lt!180207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180204 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!180207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!180207 lt!180204) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37640 (= lt!180204 (remainingBits!0 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179602)))) ((_ sign_extend 32) (currentByte!5452 (_1!5156 lt!179602))) ((_ sign_extend 32) (currentBit!5447 (_1!5156 lt!179602)))))))

(declare-fun lt!180203 () (_ BitVec 64))

(declare-fun lt!180206 () (_ BitVec 64))

(assert (=> d!37640 (= lt!180207 (bvmul lt!180203 lt!180206))))

(assert (=> d!37640 (or (= lt!180203 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!180206 (bvsdiv (bvmul lt!180203 lt!180206) lt!180203)))))

(assert (=> d!37640 (= lt!180206 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37640 (= lt!180203 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179602)))))))

(assert (=> d!37640 (= lt!180205 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5452 (_1!5156 lt!179602))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5447 (_1!5156 lt!179602)))))))

(assert (=> d!37640 (invariant!0 (currentBit!5447 (_1!5156 lt!179602)) (currentByte!5452 (_1!5156 lt!179602)) (size!2396 (buf!2809 (_1!5156 lt!179602))))))

(assert (=> d!37640 (= (bitIndex!0 (size!2396 (buf!2809 (_1!5156 lt!179602))) (currentByte!5452 (_1!5156 lt!179602)) (currentBit!5447 (_1!5156 lt!179602))) lt!180205)))

(declare-fun b!117541 () Bool)

(declare-fun res!97228 () Bool)

(assert (=> b!117541 (=> (not res!97228) (not e!77037))))

(assert (=> b!117541 (= res!97228 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!180205))))

(declare-fun b!117542 () Bool)

(declare-fun lt!180202 () (_ BitVec 64))

(assert (=> b!117542 (= e!77037 (bvsle lt!180205 (bvmul lt!180202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117542 (or (= lt!180202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!180202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!180202)))))

(assert (=> b!117542 (= lt!180202 ((_ sign_extend 32) (size!2396 (buf!2809 (_1!5156 lt!179602)))))))

(assert (= (and d!37640 res!97229) b!117541))

(assert (= (and b!117541 res!97228) b!117542))

(declare-fun m!176331 () Bool)

(assert (=> d!37640 m!176331))

(declare-fun m!176333 () Bool)

(assert (=> d!37640 m!176333))

(assert (=> b!117318 d!37640))

(declare-fun d!37642 () Bool)

(assert (=> d!37642 (= (invariant!0 (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179595)))) (and (bvsge (currentBit!5447 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5447 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5452 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179595)))) (and (= (currentBit!5447 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179595))))))))))

(assert (=> b!117308 d!37642))

(declare-fun d!37644 () Bool)

(assert (=> d!37644 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2396 (buf!2809 thiss!1305))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305)) lt!179596) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2396 (buf!2809 thiss!1305))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305))) lt!179596))))

(declare-fun bs!9106 () Bool)

(assert (= bs!9106 d!37644))

(declare-fun m!176335 () Bool)

(assert (=> bs!9106 m!176335))

(assert (=> b!117319 d!37644))

(declare-fun d!37646 () Bool)

(declare-fun lt!180208 () tuple2!9796)

(assert (=> d!37646 (= lt!180208 (readBit!0 (readerFrom!0 (_2!5155 lt!179595) (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305))))))

(assert (=> d!37646 (= (readBitPure!0 (readerFrom!0 (_2!5155 lt!179595) (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305))) (tuple2!9783 (_2!5163 lt!180208) (_1!5163 lt!180208)))))

(declare-fun bs!9107 () Bool)

(assert (= bs!9107 d!37646))

(assert (=> bs!9107 m!175871))

(declare-fun m!176337 () Bool)

(assert (=> bs!9107 m!176337))

(assert (=> b!117309 d!37646))

(declare-fun d!37648 () Bool)

(declare-fun e!77040 () Bool)

(assert (=> d!37648 e!77040))

(declare-fun res!97233 () Bool)

(assert (=> d!37648 (=> (not res!97233) (not e!77040))))

(assert (=> d!37648 (= res!97233 (invariant!0 (currentBit!5447 (_2!5155 lt!179595)) (currentByte!5452 (_2!5155 lt!179595)) (size!2396 (buf!2809 (_2!5155 lt!179595)))))))

(assert (=> d!37648 (= (readerFrom!0 (_2!5155 lt!179595) (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305)) (BitStream!4267 (buf!2809 (_2!5155 lt!179595)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)))))

(declare-fun b!117545 () Bool)

(assert (=> b!117545 (= e!77040 (invariant!0 (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305) (size!2396 (buf!2809 (_2!5155 lt!179595)))))))

(assert (= (and d!37648 res!97233) b!117545))

(declare-fun m!176339 () Bool)

(assert (=> d!37648 m!176339))

(assert (=> b!117545 m!175883))

(assert (=> b!117309 d!37648))

(declare-fun d!37650 () Bool)

(declare-fun e!77041 () Bool)

(assert (=> d!37650 e!77041))

(declare-fun res!97235 () Bool)

(assert (=> d!37650 (=> (not res!97235) (not e!77041))))

(declare-fun lt!180212 () (_ BitVec 64))

(declare-fun lt!180214 () (_ BitVec 64))

(declare-fun lt!180211 () (_ BitVec 64))

(assert (=> d!37650 (= res!97235 (= lt!180212 (bvsub lt!180214 lt!180211)))))

(assert (=> d!37650 (or (= (bvand lt!180214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!180214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!180214 lt!180211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37650 (= lt!180211 (remainingBits!0 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179595)))) ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!179595))) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!179595)))))))

(declare-fun lt!180210 () (_ BitVec 64))

(declare-fun lt!180213 () (_ BitVec 64))

(assert (=> d!37650 (= lt!180214 (bvmul lt!180210 lt!180213))))

(assert (=> d!37650 (or (= lt!180210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!180213 (bvsdiv (bvmul lt!180210 lt!180213) lt!180210)))))

(assert (=> d!37650 (= lt!180213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37650 (= lt!180210 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179595)))))))

(assert (=> d!37650 (= lt!180212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5452 (_2!5155 lt!179595))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5447 (_2!5155 lt!179595)))))))

(assert (=> d!37650 (invariant!0 (currentBit!5447 (_2!5155 lt!179595)) (currentByte!5452 (_2!5155 lt!179595)) (size!2396 (buf!2809 (_2!5155 lt!179595))))))

(assert (=> d!37650 (= (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595))) lt!180212)))

(declare-fun b!117546 () Bool)

(declare-fun res!97234 () Bool)

(assert (=> b!117546 (=> (not res!97234) (not e!77041))))

(assert (=> b!117546 (= res!97234 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!180212))))

(declare-fun b!117547 () Bool)

(declare-fun lt!180209 () (_ BitVec 64))

(assert (=> b!117547 (= e!77041 (bvsle lt!180212 (bvmul lt!180209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117547 (or (= lt!180209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!180209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!180209)))))

(assert (=> b!117547 (= lt!180209 ((_ sign_extend 32) (size!2396 (buf!2809 (_2!5155 lt!179595)))))))

(assert (= (and d!37650 res!97235) b!117546))

(assert (= (and b!117546 res!97234) b!117547))

(assert (=> d!37650 m!175955))

(assert (=> d!37650 m!176339))

(assert (=> b!117315 d!37650))

(declare-fun d!37652 () Bool)

(declare-fun e!77042 () Bool)

(assert (=> d!37652 e!77042))

(declare-fun res!97237 () Bool)

(assert (=> d!37652 (=> (not res!97237) (not e!77042))))

(declare-fun lt!180217 () (_ BitVec 64))

(declare-fun lt!180220 () (_ BitVec 64))

(declare-fun lt!180218 () (_ BitVec 64))

(assert (=> d!37652 (= res!97237 (= lt!180218 (bvsub lt!180220 lt!180217)))))

(assert (=> d!37652 (or (= (bvand lt!180220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180217 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!180220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!180220 lt!180217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37652 (= lt!180217 (remainingBits!0 ((_ sign_extend 32) (size!2396 (buf!2809 thiss!1305))) ((_ sign_extend 32) (currentByte!5452 thiss!1305)) ((_ sign_extend 32) (currentBit!5447 thiss!1305))))))

(declare-fun lt!180216 () (_ BitVec 64))

(declare-fun lt!180219 () (_ BitVec 64))

(assert (=> d!37652 (= lt!180220 (bvmul lt!180216 lt!180219))))

(assert (=> d!37652 (or (= lt!180216 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!180219 (bvsdiv (bvmul lt!180216 lt!180219) lt!180216)))))

(assert (=> d!37652 (= lt!180219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37652 (= lt!180216 ((_ sign_extend 32) (size!2396 (buf!2809 thiss!1305))))))

(assert (=> d!37652 (= lt!180218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5452 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5447 thiss!1305))))))

(assert (=> d!37652 (invariant!0 (currentBit!5447 thiss!1305) (currentByte!5452 thiss!1305) (size!2396 (buf!2809 thiss!1305)))))

(assert (=> d!37652 (= (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)) lt!180218)))

(declare-fun b!117548 () Bool)

(declare-fun res!97236 () Bool)

(assert (=> b!117548 (=> (not res!97236) (not e!77042))))

(assert (=> b!117548 (= res!97236 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!180218))))

(declare-fun b!117549 () Bool)

(declare-fun lt!180215 () (_ BitVec 64))

(assert (=> b!117549 (= e!77042 (bvsle lt!180218 (bvmul lt!180215 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117549 (or (= lt!180215 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!180215 #b0000000000000000000000000000000000000000000000000000000000001000) lt!180215)))))

(assert (=> b!117549 (= lt!180215 ((_ sign_extend 32) (size!2396 (buf!2809 thiss!1305))))))

(assert (= (and d!37652 res!97237) b!117548))

(assert (= (and b!117548 res!97236) b!117549))

(assert (=> d!37652 m!176335))

(assert (=> d!37652 m!176329))

(assert (=> b!117315 d!37652))

(declare-fun d!37654 () Bool)

(declare-fun res!97240 () Bool)

(declare-fun e!77044 () Bool)

(assert (=> d!37654 (=> (not res!97240) (not e!77044))))

(assert (=> d!37654 (= res!97240 (= (size!2396 (buf!2809 thiss!1305)) (size!2396 (buf!2809 (_2!5155 lt!179595)))))))

(assert (=> d!37654 (= (isPrefixOf!0 thiss!1305 (_2!5155 lt!179595)) e!77044)))

(declare-fun b!117550 () Bool)

(declare-fun res!97239 () Bool)

(assert (=> b!117550 (=> (not res!97239) (not e!77044))))

(assert (=> b!117550 (= res!97239 (bvsle (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305)) (bitIndex!0 (size!2396 (buf!2809 (_2!5155 lt!179595))) (currentByte!5452 (_2!5155 lt!179595)) (currentBit!5447 (_2!5155 lt!179595)))))))

(declare-fun b!117551 () Bool)

(declare-fun e!77043 () Bool)

(assert (=> b!117551 (= e!77044 e!77043)))

(declare-fun res!97238 () Bool)

(assert (=> b!117551 (=> res!97238 e!77043)))

(assert (=> b!117551 (= res!97238 (= (size!2396 (buf!2809 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!117552 () Bool)

(assert (=> b!117552 (= e!77043 (arrayBitRangesEq!0 (buf!2809 thiss!1305) (buf!2809 (_2!5155 lt!179595)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2396 (buf!2809 thiss!1305)) (currentByte!5452 thiss!1305) (currentBit!5447 thiss!1305))))))

(assert (= (and d!37654 res!97240) b!117550))

(assert (= (and b!117550 res!97239) b!117551))

(assert (= (and b!117551 (not res!97238)) b!117552))

(assert (=> b!117550 m!175893))

(assert (=> b!117550 m!175891))

(assert (=> b!117552 m!175893))

(assert (=> b!117552 m!175893))

(declare-fun m!176341 () Bool)

(assert (=> b!117552 m!176341))

(assert (=> b!117316 d!37654))

(declare-fun d!37656 () Bool)

(assert (=> d!37656 (= (array_inv!2198 (buf!2809 thiss!1305)) (bvsge (size!2396 (buf!2809 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!117317 d!37656))

(check-sat (not b!117512) (not b!117516) (not b!117517) (not b!117529) (not d!37532) (not b!117519) (not b!117369) (not d!37618) (not b!117520) (not b!117371) (not b!117531) (not d!37630) (not b!117522) (not b!117521) (not b!117527) (not d!37530) (not b!117518) (not b!117389) (not d!37634) (not b!117390) (not b!117540) (not b!117552) (not d!37538) (not d!37648) (not b!117370) (not d!37638) (not d!37622) (not d!37536) (not b!117391) (not d!37626) (not d!37650) (not b!117373) (not b!117545) (not b!117514) (not d!37524) (not b!117392) (not b!117550) (not d!37646) (not d!37632) (not d!37620) (not d!37636) (not d!37534) (not d!37644) (not d!37640) (not b!117538) (not b!117513) (not d!37652) (not bm!1517) (not b!117528))
(check-sat)
