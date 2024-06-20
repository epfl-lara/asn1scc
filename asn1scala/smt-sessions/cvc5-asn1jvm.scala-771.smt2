; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22132 () Bool)

(assert start!22132)

(declare-fun b!111828 () Bool)

(declare-fun e!73385 () Bool)

(declare-datatypes ((array!5090 0))(
  ( (array!5091 (arr!2907 (Array (_ BitVec 32) (_ BitVec 8))) (size!2314 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4102 0))(
  ( (BitStream!4103 (buf!2717 array!5090) (currentByte!5283 (_ BitVec 32)) (currentBit!5278 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4102)

(declare-datatypes ((Unit!6847 0))(
  ( (Unit!6848) )
))
(declare-datatypes ((tuple2!9252 0))(
  ( (tuple2!9253 (_1!4886 Unit!6847) (_2!4886 BitStream!4102)) )
))
(declare-fun lt!169807 () tuple2!9252)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!111828 (= e!73385 (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(declare-fun b!111829 () Bool)

(declare-fun res!92334 () Bool)

(declare-fun e!73377 () Bool)

(assert (=> b!111829 (=> (not res!92334) (not e!73377))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!111829 (= res!92334 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!111830 () Bool)

(declare-fun e!73380 () Bool)

(assert (=> b!111830 (= e!73380 e!73377)))

(declare-fun res!92344 () Bool)

(assert (=> b!111830 (=> (not res!92344) (not e!73377))))

(declare-fun lt!169790 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!111830 (= res!92344 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305)) lt!169790))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!111830 (= lt!169790 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!111832 () Bool)

(declare-fun e!73381 () Bool)

(declare-datatypes ((tuple2!9254 0))(
  ( (tuple2!9255 (_1!4887 BitStream!4102) (_2!4887 Bool)) )
))
(declare-fun lt!169809 () tuple2!9254)

(declare-fun lt!169803 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!111832 (= e!73381 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!169809))) (currentByte!5283 (_1!4887 lt!169809)) (currentBit!5278 (_1!4887 lt!169809))) lt!169803))))

(declare-fun b!111833 () Bool)

(declare-fun e!73382 () Bool)

(assert (=> b!111833 (= e!73382 e!73381)))

(declare-fun res!92341 () Bool)

(assert (=> b!111833 (=> (not res!92341) (not e!73381))))

(declare-fun lt!169810 () tuple2!9252)

(declare-fun lt!169787 () Bool)

(assert (=> b!111833 (= res!92341 (and (= (_2!4887 lt!169809) lt!169787) (= (_1!4887 lt!169809) (_2!4886 lt!169810))))))

(declare-fun readBitPure!0 (BitStream!4102) tuple2!9254)

(declare-fun readerFrom!0 (BitStream!4102 (_ BitVec 32) (_ BitVec 32)) BitStream!4102)

(assert (=> b!111833 (= lt!169809 (readBitPure!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))))

(declare-fun b!111834 () Bool)

(declare-fun e!73379 () Bool)

(declare-fun lt!169802 () (_ BitVec 64))

(declare-fun lt!169799 () (_ BitVec 64))

(assert (=> b!111834 (= e!73379 (= lt!169802 (bvsub lt!169799 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!111835 () Bool)

(declare-fun e!73384 () Bool)

(assert (=> b!111835 (= e!73377 (not e!73384))))

(declare-fun res!92332 () Bool)

(assert (=> b!111835 (=> res!92332 e!73384)))

(declare-datatypes ((tuple2!9256 0))(
  ( (tuple2!9257 (_1!4888 BitStream!4102) (_2!4888 BitStream!4102)) )
))
(declare-fun lt!169806 () tuple2!9256)

(declare-fun lt!169808 () (_ BitVec 64))

(declare-datatypes ((tuple2!9258 0))(
  ( (tuple2!9259 (_1!4889 BitStream!4102) (_2!4889 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9258)

(assert (=> b!111835 (= res!92332 (not (= (_1!4889 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!169806) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169808)) (_2!4888 lt!169806))))))

(declare-fun lt!169805 () (_ BitVec 64))

(assert (=> b!111835 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!169805)))

(declare-fun lt!169800 () Unit!6847)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4102 array!5090 (_ BitVec 64)) Unit!6847)

(assert (=> b!111835 (= lt!169800 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!169807)) lt!169805))))

(assert (=> b!111835 (= lt!169805 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!169796 () tuple2!9254)

(declare-fun lt!169791 () (_ BitVec 64))

(declare-fun lt!169798 () (_ BitVec 64))

(assert (=> b!111835 (= lt!169808 (bvor lt!169798 (ite (_2!4887 lt!169796) lt!169791 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!169797 () tuple2!9256)

(declare-fun lt!169813 () tuple2!9258)

(assert (=> b!111835 (= lt!169813 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!169797) nBits!396 i!615 lt!169798))))

(assert (=> b!111835 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305)) lt!169790)))

(declare-fun lt!169793 () Unit!6847)

(assert (=> b!111835 (= lt!169793 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2717 (_2!4886 lt!169807)) lt!169790))))

(assert (=> b!111835 (= lt!169798 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!111835 (= (_2!4887 lt!169796) lt!169787)))

(assert (=> b!111835 (= lt!169796 (readBitPure!0 (_1!4888 lt!169797)))))

(declare-fun reader!0 (BitStream!4102 BitStream!4102) tuple2!9256)

(assert (=> b!111835 (= lt!169806 (reader!0 (_2!4886 lt!169810) (_2!4886 lt!169807)))))

(assert (=> b!111835 (= lt!169797 (reader!0 thiss!1305 (_2!4886 lt!169807)))))

(declare-fun e!73383 () Bool)

(assert (=> b!111835 e!73383))

(declare-fun res!92337 () Bool)

(assert (=> b!111835 (=> (not res!92337) (not e!73383))))

(declare-fun lt!169792 () tuple2!9254)

(declare-fun lt!169801 () tuple2!9254)

(assert (=> b!111835 (= res!92337 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!169792))) (currentByte!5283 (_1!4887 lt!169792)) (currentBit!5278 (_1!4887 lt!169792))) (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!169801))) (currentByte!5283 (_1!4887 lt!169801)) (currentBit!5278 (_1!4887 lt!169801)))))))

(declare-fun lt!169795 () Unit!6847)

(declare-fun lt!169794 () BitStream!4102)

(declare-fun readBitPrefixLemma!0 (BitStream!4102 BitStream!4102) Unit!6847)

(assert (=> b!111835 (= lt!169795 (readBitPrefixLemma!0 lt!169794 (_2!4886 lt!169807)))))

(assert (=> b!111835 (= lt!169801 (readBitPure!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (=> b!111835 (= lt!169792 (readBitPure!0 lt!169794))))

(assert (=> b!111835 (= lt!169794 (BitStream!4103 (buf!2717 (_2!4886 lt!169810)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(assert (=> b!111835 e!73385))

(declare-fun res!92339 () Bool)

(assert (=> b!111835 (=> (not res!92339) (not e!73385))))

(declare-fun isPrefixOf!0 (BitStream!4102 BitStream!4102) Bool)

(assert (=> b!111835 (= res!92339 (isPrefixOf!0 thiss!1305 (_2!4886 lt!169807)))))

(declare-fun lt!169789 () Unit!6847)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4102 BitStream!4102 BitStream!4102) Unit!6847)

(assert (=> b!111835 (= lt!169789 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4886 lt!169810) (_2!4886 lt!169807)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4102 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9252)

(assert (=> b!111835 (= lt!169807 (appendNLeastSignificantBitsLoop!0 (_2!4886 lt!169810) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!73376 () Bool)

(assert (=> b!111835 e!73376))

(declare-fun res!92333 () Bool)

(assert (=> b!111835 (=> (not res!92333) (not e!73376))))

(assert (=> b!111835 (= res!92333 (= (size!2314 (buf!2717 thiss!1305)) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(declare-fun appendBit!0 (BitStream!4102 Bool) tuple2!9252)

(assert (=> b!111835 (= lt!169810 (appendBit!0 thiss!1305 lt!169787))))

(assert (=> b!111835 (= lt!169787 (not (= (bvand v!199 lt!169791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111835 (= lt!169791 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!111836 () Bool)

(declare-fun res!92336 () Bool)

(assert (=> b!111836 (=> (not res!92336) (not e!73385))))

(assert (=> b!111836 (= res!92336 (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(declare-fun b!111837 () Bool)

(assert (=> b!111837 (= e!73376 e!73382)))

(declare-fun res!92343 () Bool)

(assert (=> b!111837 (=> (not res!92343) (not e!73382))))

(declare-fun lt!169814 () (_ BitVec 64))

(assert (=> b!111837 (= res!92343 (= lt!169803 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!169814)))))

(assert (=> b!111837 (= lt!169803 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> b!111837 (= lt!169814 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(declare-fun b!111838 () Bool)

(declare-fun lt!169812 () BitStream!4102)

(assert (=> b!111838 (= e!73384 (= (_1!4888 lt!169806) lt!169812))))

(assert (=> b!111838 e!73379))

(declare-fun res!92340 () Bool)

(assert (=> b!111838 (=> (not res!92340) (not e!73379))))

(declare-fun lt!169788 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4102 (_ BitVec 64)) BitStream!4102)

(assert (=> b!111838 (= res!92340 (= (_1!4888 lt!169806) (withMovedBitIndex!0 (_2!4888 lt!169806) (bvsub lt!169799 lt!169788))))))

(assert (=> b!111838 (= lt!169799 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> b!111838 (= (_1!4888 lt!169797) (withMovedBitIndex!0 (_2!4888 lt!169797) (bvsub lt!169802 lt!169788)))))

(assert (=> b!111838 (= lt!169788 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807))))))

(assert (=> b!111838 (= lt!169802 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(declare-fun lt!169804 () tuple2!9258)

(assert (=> b!111838 (and (= (_2!4889 lt!169813) (_2!4889 lt!169804)) (= (_1!4889 lt!169813) (_1!4889 lt!169804)))))

(declare-fun lt!169811 () Unit!6847)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6847)

(assert (=> b!111838 (= lt!169811 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4888 lt!169797) nBits!396 i!615 lt!169798))))

(assert (=> b!111838 (= lt!169804 (readNLeastSignificantBitsLoopPure!0 lt!169812 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169808))))

(assert (=> b!111838 (= lt!169812 (withMovedBitIndex!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!111839 () Bool)

(declare-fun res!92342 () Bool)

(assert (=> b!111839 (=> (not res!92342) (not e!73377))))

(assert (=> b!111839 (= res!92342 (bvslt i!615 nBits!396))))

(declare-fun res!92335 () Bool)

(assert (=> start!22132 (=> (not res!92335) (not e!73380))))

(assert (=> start!22132 (= res!92335 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22132 e!73380))

(assert (=> start!22132 true))

(declare-fun e!73378 () Bool)

(declare-fun inv!12 (BitStream!4102) Bool)

(assert (=> start!22132 (and (inv!12 thiss!1305) e!73378)))

(declare-fun b!111831 () Bool)

(assert (=> b!111831 (= e!73383 (= (_2!4887 lt!169792) (_2!4887 lt!169801)))))

(declare-fun b!111840 () Bool)

(declare-fun res!92338 () Bool)

(assert (=> b!111840 (=> (not res!92338) (not e!73382))))

(assert (=> b!111840 (= res!92338 (isPrefixOf!0 thiss!1305 (_2!4886 lt!169810)))))

(declare-fun b!111841 () Bool)

(declare-fun array_inv!2116 (array!5090) Bool)

(assert (=> b!111841 (= e!73378 (array_inv!2116 (buf!2717 thiss!1305)))))

(assert (= (and start!22132 res!92335) b!111830))

(assert (= (and b!111830 res!92344) b!111829))

(assert (= (and b!111829 res!92334) b!111839))

(assert (= (and b!111839 res!92342) b!111835))

(assert (= (and b!111835 res!92333) b!111837))

(assert (= (and b!111837 res!92343) b!111840))

(assert (= (and b!111840 res!92338) b!111833))

(assert (= (and b!111833 res!92341) b!111832))

(assert (= (and b!111835 res!92339) b!111836))

(assert (= (and b!111836 res!92336) b!111828))

(assert (= (and b!111835 res!92337) b!111831))

(assert (= (and b!111835 (not res!92332)) b!111838))

(assert (= (and b!111838 res!92340) b!111834))

(assert (= start!22132 b!111841))

(declare-fun m!166781 () Bool)

(assert (=> b!111828 m!166781))

(declare-fun m!166783 () Bool)

(assert (=> b!111840 m!166783))

(declare-fun m!166785 () Bool)

(assert (=> start!22132 m!166785))

(declare-fun m!166787 () Bool)

(assert (=> b!111835 m!166787))

(declare-fun m!166789 () Bool)

(assert (=> b!111835 m!166789))

(declare-fun m!166791 () Bool)

(assert (=> b!111835 m!166791))

(declare-fun m!166793 () Bool)

(assert (=> b!111835 m!166793))

(declare-fun m!166795 () Bool)

(assert (=> b!111835 m!166795))

(declare-fun m!166797 () Bool)

(assert (=> b!111835 m!166797))

(declare-fun m!166799 () Bool)

(assert (=> b!111835 m!166799))

(declare-fun m!166801 () Bool)

(assert (=> b!111835 m!166801))

(declare-fun m!166803 () Bool)

(assert (=> b!111835 m!166803))

(declare-fun m!166805 () Bool)

(assert (=> b!111835 m!166805))

(declare-fun m!166807 () Bool)

(assert (=> b!111835 m!166807))

(declare-fun m!166809 () Bool)

(assert (=> b!111835 m!166809))

(declare-fun m!166811 () Bool)

(assert (=> b!111835 m!166811))

(declare-fun m!166813 () Bool)

(assert (=> b!111835 m!166813))

(declare-fun m!166815 () Bool)

(assert (=> b!111835 m!166815))

(declare-fun m!166817 () Bool)

(assert (=> b!111835 m!166817))

(declare-fun m!166819 () Bool)

(assert (=> b!111835 m!166819))

(declare-fun m!166821 () Bool)

(assert (=> b!111835 m!166821))

(declare-fun m!166823 () Bool)

(assert (=> b!111835 m!166823))

(declare-fun m!166825 () Bool)

(assert (=> b!111841 m!166825))

(declare-fun m!166827 () Bool)

(assert (=> b!111832 m!166827))

(declare-fun m!166829 () Bool)

(assert (=> b!111836 m!166829))

(declare-fun m!166831 () Bool)

(assert (=> b!111838 m!166831))

(declare-fun m!166833 () Bool)

(assert (=> b!111838 m!166833))

(declare-fun m!166835 () Bool)

(assert (=> b!111838 m!166835))

(declare-fun m!166837 () Bool)

(assert (=> b!111838 m!166837))

(declare-fun m!166839 () Bool)

(assert (=> b!111838 m!166839))

(declare-fun m!166841 () Bool)

(assert (=> b!111838 m!166841))

(declare-fun m!166843 () Bool)

(assert (=> b!111838 m!166843))

(declare-fun m!166845 () Bool)

(assert (=> b!111838 m!166845))

(declare-fun m!166847 () Bool)

(assert (=> b!111829 m!166847))

(declare-fun m!166849 () Bool)

(assert (=> b!111830 m!166849))

(assert (=> b!111837 m!166841))

(assert (=> b!111837 m!166833))

(declare-fun m!166851 () Bool)

(assert (=> b!111833 m!166851))

(assert (=> b!111833 m!166851))

(declare-fun m!166853 () Bool)

(assert (=> b!111833 m!166853))

(push 1)

(assert (not b!111830))

(assert (not b!111836))

(assert (not b!111829))

(assert (not b!111828))

(assert (not start!22132))

(assert (not b!111840))

(assert (not b!111837))

(assert (not b!111835))

(assert (not b!111841))

(assert (not b!111838))

(assert (not b!111832))

(assert (not b!111833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!35736 () Bool)

(assert (=> d!35736 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!111835 d!35736))

(declare-fun d!35738 () Bool)

(declare-fun e!73591 () Bool)

(assert (=> d!35738 e!73591))

(declare-fun res!92629 () Bool)

(assert (=> d!35738 (=> (not res!92629) (not e!73591))))

(declare-fun lt!170766 () tuple2!9252)

(assert (=> d!35738 (= res!92629 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) (size!2314 (buf!2717 (_2!4886 lt!170766)))))))

(declare-fun e!73596 () tuple2!9252)

(assert (=> d!35738 (= lt!170766 e!73596)))

(declare-fun c!6829 () Bool)

(assert (=> d!35738 (= c!6829 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!35738 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35738 (= (appendNLeastSignificantBitsLoop!0 (_2!4886 lt!169810) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!170766)))

(declare-fun b!112174 () Bool)

(declare-fun res!92628 () Bool)

(declare-fun lt!170739 () tuple2!9252)

(assert (=> b!112174 (= res!92628 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170739))) (currentByte!5283 (_2!4886 lt!170739)) (currentBit!5278 (_2!4886 lt!170739))) (bvadd (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!73593 () Bool)

(assert (=> b!112174 (=> (not res!92628) (not e!73593))))

(declare-fun b!112175 () Bool)

(declare-fun e!73594 () Bool)

(declare-fun lt!170765 () tuple2!9254)

(assert (=> b!112175 (= e!73594 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170765))) (currentByte!5283 (_1!4887 lt!170765)) (currentBit!5278 (_1!4887 lt!170765))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170739))) (currentByte!5283 (_2!4886 lt!170739)) (currentBit!5278 (_2!4886 lt!170739)))))))

(declare-fun b!112176 () Bool)

(declare-fun e!73595 () (_ BitVec 64))

(assert (=> b!112176 (= e!73595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!112177 () Bool)

(declare-fun res!92626 () Bool)

(assert (=> b!112177 (=> (not res!92626) (not e!73591))))

(assert (=> b!112177 (= res!92626 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!170766)))))

(declare-fun b!112178 () Bool)

(declare-fun res!92623 () Bool)

(assert (=> b!112178 (=> (not res!92623) (not e!73591))))

(declare-fun lt!170743 () (_ BitVec 64))

(declare-fun lt!170752 () (_ BitVec 64))

(assert (=> b!112178 (= res!92623 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170766))) (currentByte!5283 (_2!4886 lt!170766)) (currentBit!5278 (_2!4886 lt!170766))) (bvadd lt!170752 lt!170743)))))

(assert (=> b!112178 (or (not (= (bvand lt!170752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170743 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170752 lt!170743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112178 (= lt!170743 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112178 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112178 (= lt!170752 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(declare-fun lt!170774 () tuple2!9252)

(declare-fun bm!1422 () Bool)

(declare-fun call!1425 () Bool)

(declare-fun lt!170777 () BitStream!4102)

(assert (=> bm!1422 (= call!1425 (isPrefixOf!0 (ite c!6829 (_2!4886 lt!169810) lt!170777) (ite c!6829 (_2!4886 lt!170774) lt!170777)))))

(declare-fun b!112179 () Bool)

(assert (=> b!112179 (= lt!170765 (readBitPure!0 (readerFrom!0 (_2!4886 lt!170739) (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)))))))

(declare-fun lt!170759 () Bool)

(declare-fun res!92624 () Bool)

(assert (=> b!112179 (= res!92624 (and (= (_2!4887 lt!170765) lt!170759) (= (_1!4887 lt!170765) (_2!4886 lt!170739))))))

(assert (=> b!112179 (=> (not res!92624) (not e!73594))))

(assert (=> b!112179 (= e!73593 e!73594)))

(declare-fun b!112180 () Bool)

(declare-fun res!92630 () Bool)

(assert (=> b!112180 (= res!92630 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!170739)))))

(assert (=> b!112180 (=> (not res!92630) (not e!73593))))

(declare-fun b!112181 () Bool)

(declare-fun e!73590 () Bool)

(declare-fun lt!170776 () (_ BitVec 64))

(assert (=> b!112181 (= e!73590 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!170776))))

(declare-fun b!112182 () Bool)

(declare-fun Unit!6863 () Unit!6847)

(assert (=> b!112182 (= e!73596 (tuple2!9253 Unit!6863 (_2!4886 lt!170774)))))

(assert (=> b!112182 (= lt!170759 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112182 (= lt!170739 (appendBit!0 (_2!4886 lt!169810) lt!170759))))

(declare-fun res!92625 () Bool)

(assert (=> b!112182 (= res!92625 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) (size!2314 (buf!2717 (_2!4886 lt!170739)))))))

(assert (=> b!112182 (=> (not res!92625) (not e!73593))))

(assert (=> b!112182 e!73593))

(declare-fun lt!170782 () tuple2!9252)

(assert (=> b!112182 (= lt!170782 lt!170739)))

(assert (=> b!112182 (= lt!170774 (appendNLeastSignificantBitsLoop!0 (_2!4886 lt!170782) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!170741 () Unit!6847)

(assert (=> b!112182 (= lt!170741 (lemmaIsPrefixTransitive!0 (_2!4886 lt!169810) (_2!4886 lt!170782) (_2!4886 lt!170774)))))

(assert (=> b!112182 call!1425))

(declare-fun lt!170760 () Unit!6847)

(assert (=> b!112182 (= lt!170760 lt!170741)))

(assert (=> b!112182 (invariant!0 (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!170782))))))

(declare-fun lt!170783 () BitStream!4102)

(assert (=> b!112182 (= lt!170783 (BitStream!4103 (buf!2717 (_2!4886 lt!170782)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> b!112182 (invariant!0 (currentBit!5278 lt!170783) (currentByte!5283 lt!170783) (size!2314 (buf!2717 (_2!4886 lt!170774))))))

(declare-fun lt!170757 () BitStream!4102)

(assert (=> b!112182 (= lt!170757 (BitStream!4103 (buf!2717 (_2!4886 lt!170774)) (currentByte!5283 lt!170783) (currentBit!5278 lt!170783)))))

(declare-fun lt!170746 () tuple2!9254)

(assert (=> b!112182 (= lt!170746 (readBitPure!0 lt!170783))))

(declare-fun lt!170747 () tuple2!9254)

(assert (=> b!112182 (= lt!170747 (readBitPure!0 lt!170757))))

(declare-fun lt!170749 () Unit!6847)

(assert (=> b!112182 (= lt!170749 (readBitPrefixLemma!0 lt!170783 (_2!4886 lt!170774)))))

(declare-fun res!92631 () Bool)

(assert (=> b!112182 (= res!92631 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170746))) (currentByte!5283 (_1!4887 lt!170746)) (currentBit!5278 (_1!4887 lt!170746))) (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170747))) (currentByte!5283 (_1!4887 lt!170747)) (currentBit!5278 (_1!4887 lt!170747)))))))

(declare-fun e!73592 () Bool)

(assert (=> b!112182 (=> (not res!92631) (not e!73592))))

(assert (=> b!112182 e!73592))

(declare-fun lt!170762 () Unit!6847)

(assert (=> b!112182 (= lt!170762 lt!170749)))

(declare-fun lt!170756 () tuple2!9256)

(assert (=> b!112182 (= lt!170756 (reader!0 (_2!4886 lt!169810) (_2!4886 lt!170774)))))

(declare-fun lt!170771 () tuple2!9256)

(assert (=> b!112182 (= lt!170771 (reader!0 (_2!4886 lt!170782) (_2!4886 lt!170774)))))

(declare-fun lt!170761 () tuple2!9254)

(assert (=> b!112182 (= lt!170761 (readBitPure!0 (_1!4888 lt!170756)))))

(assert (=> b!112182 (= (_2!4887 lt!170761) lt!170759)))

(declare-fun lt!170764 () Unit!6847)

(declare-fun Unit!6865 () Unit!6847)

(assert (=> b!112182 (= lt!170764 Unit!6865)))

(declare-fun lt!170779 () (_ BitVec 64))

(assert (=> b!112182 (= lt!170779 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!170745 () (_ BitVec 64))

(assert (=> b!112182 (= lt!170745 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!170770 () Unit!6847)

(assert (=> b!112182 (= lt!170770 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!170774)) lt!170745))))

(assert (=> b!112182 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!170745)))

(declare-fun lt!170750 () Unit!6847)

(assert (=> b!112182 (= lt!170750 lt!170770)))

(declare-fun lt!170781 () tuple2!9258)

(assert (=> b!112182 (= lt!170781 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!170756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170779))))

(declare-fun lt!170758 () (_ BitVec 64))

(assert (=> b!112182 (= lt!170758 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!170751 () Unit!6847)

(assert (=> b!112182 (= lt!170751 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!170782) (buf!2717 (_2!4886 lt!170774)) lt!170758))))

(assert (=> b!112182 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782))) lt!170758)))

(declare-fun lt!170744 () Unit!6847)

(assert (=> b!112182 (= lt!170744 lt!170751)))

(declare-fun lt!170773 () tuple2!9258)

(assert (=> b!112182 (= lt!170773 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!170771) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170779 (ite (_2!4887 lt!170761) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!170742 () tuple2!9258)

(assert (=> b!112182 (= lt!170742 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!170756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170779))))

(declare-fun c!6828 () Bool)

(assert (=> b!112182 (= c!6828 (_2!4887 (readBitPure!0 (_1!4888 lt!170756))))))

(declare-fun lt!170778 () tuple2!9258)

(assert (=> b!112182 (= lt!170778 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4888 lt!170756) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170779 e!73595)))))

(declare-fun lt!170775 () Unit!6847)

(assert (=> b!112182 (= lt!170775 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4888 lt!170756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170779))))

(assert (=> b!112182 (and (= (_2!4889 lt!170742) (_2!4889 lt!170778)) (= (_1!4889 lt!170742) (_1!4889 lt!170778)))))

(declare-fun lt!170754 () Unit!6847)

(assert (=> b!112182 (= lt!170754 lt!170775)))

(assert (=> b!112182 (= (_1!4888 lt!170756) (withMovedBitIndex!0 (_2!4888 lt!170756) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))))))

(declare-fun lt!170769 () Unit!6847)

(declare-fun Unit!6870 () Unit!6847)

(assert (=> b!112182 (= lt!170769 Unit!6870)))

(assert (=> b!112182 (= (_1!4888 lt!170771) (withMovedBitIndex!0 (_2!4888 lt!170771) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))))))

(declare-fun lt!170780 () Unit!6847)

(declare-fun Unit!6871 () Unit!6847)

(assert (=> b!112182 (= lt!170780 Unit!6871)))

(assert (=> b!112182 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!170772 () Unit!6847)

(declare-fun Unit!6872 () Unit!6847)

(assert (=> b!112182 (= lt!170772 Unit!6872)))

(assert (=> b!112182 (= (_2!4889 lt!170781) (_2!4889 lt!170773))))

(declare-fun lt!170740 () Unit!6847)

(declare-fun Unit!6873 () Unit!6847)

(assert (=> b!112182 (= lt!170740 Unit!6873)))

(assert (=> b!112182 (= (_1!4889 lt!170781) (_2!4888 lt!170756))))

(declare-fun b!112183 () Bool)

(declare-fun lt!170767 () Unit!6847)

(assert (=> b!112183 (= e!73596 (tuple2!9253 lt!170767 (_2!4886 lt!169810)))))

(assert (=> b!112183 (= lt!170777 (_2!4886 lt!169810))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4102) Unit!6847)

(assert (=> b!112183 (= lt!170767 (lemmaIsPrefixRefl!0 lt!170777))))

(assert (=> b!112183 call!1425))

(declare-fun b!112184 () Bool)

(assert (=> b!112184 (= e!73592 (= (_2!4887 lt!170746) (_2!4887 lt!170747)))))

(declare-fun b!112185 () Bool)

(declare-fun lt!170768 () tuple2!9256)

(declare-fun lt!170755 () tuple2!9258)

(assert (=> b!112185 (= e!73591 (and (= (_2!4889 lt!170755) v!199) (= (_1!4889 lt!170755) (_2!4888 lt!170768))))))

(declare-fun lt!170748 () (_ BitVec 64))

(assert (=> b!112185 (= lt!170755 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!170768) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170748))))

(declare-fun lt!170763 () Unit!6847)

(declare-fun lt!170753 () Unit!6847)

(assert (=> b!112185 (= lt!170763 lt!170753)))

(assert (=> b!112185 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170766)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!170776)))

(assert (=> b!112185 (= lt!170753 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!170766)) lt!170776))))

(assert (=> b!112185 e!73590))

(declare-fun res!92627 () Bool)

(assert (=> b!112185 (=> (not res!92627) (not e!73590))))

(assert (=> b!112185 (= res!92627 (and (= (size!2314 (buf!2717 (_2!4886 lt!169810))) (size!2314 (buf!2717 (_2!4886 lt!170766)))) (bvsge lt!170776 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112185 (= lt!170776 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112185 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112185 (= lt!170748 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!112185 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112185 (= lt!170768 (reader!0 (_2!4886 lt!169810) (_2!4886 lt!170766)))))

(declare-fun b!112186 () Bool)

(assert (=> b!112186 (= e!73595 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(assert (= (and d!35738 c!6829) b!112182))

(assert (= (and d!35738 (not c!6829)) b!112183))

(assert (= (and b!112182 res!92625) b!112174))

(assert (= (and b!112174 res!92628) b!112180))

(assert (= (and b!112180 res!92630) b!112179))

(assert (= (and b!112179 res!92624) b!112175))

(assert (= (and b!112182 res!92631) b!112184))

(assert (= (and b!112182 c!6828) b!112186))

(assert (= (and b!112182 (not c!6828)) b!112176))

(assert (= (or b!112182 b!112183) bm!1422))

(assert (= (and d!35738 res!92629) b!112178))

(assert (= (and b!112178 res!92623) b!112177))

(assert (= (and b!112177 res!92626) b!112185))

(assert (= (and b!112185 res!92627) b!112181))

(declare-fun m!167491 () Bool)

(assert (=> b!112182 m!167491))

(declare-fun m!167493 () Bool)

(assert (=> b!112182 m!167493))

(declare-fun m!167495 () Bool)

(assert (=> b!112182 m!167495))

(declare-fun m!167497 () Bool)

(assert (=> b!112182 m!167497))

(declare-fun m!167499 () Bool)

(assert (=> b!112182 m!167499))

(declare-fun m!167501 () Bool)

(assert (=> b!112182 m!167501))

(declare-fun m!167503 () Bool)

(assert (=> b!112182 m!167503))

(declare-fun m!167505 () Bool)

(assert (=> b!112182 m!167505))

(declare-fun m!167507 () Bool)

(assert (=> b!112182 m!167507))

(declare-fun m!167509 () Bool)

(assert (=> b!112182 m!167509))

(declare-fun m!167511 () Bool)

(assert (=> b!112182 m!167511))

(declare-fun m!167513 () Bool)

(assert (=> b!112182 m!167513))

(assert (=> b!112182 m!166841))

(declare-fun m!167515 () Bool)

(assert (=> b!112182 m!167515))

(declare-fun m!167517 () Bool)

(assert (=> b!112182 m!167517))

(declare-fun m!167519 () Bool)

(assert (=> b!112182 m!167519))

(declare-fun m!167521 () Bool)

(assert (=> b!112182 m!167521))

(declare-fun m!167523 () Bool)

(assert (=> b!112182 m!167523))

(declare-fun m!167525 () Bool)

(assert (=> b!112182 m!167525))

(declare-fun m!167527 () Bool)

(assert (=> b!112182 m!167527))

(declare-fun m!167529 () Bool)

(assert (=> b!112182 m!167529))

(declare-fun m!167531 () Bool)

(assert (=> b!112182 m!167531))

(assert (=> b!112182 m!167493))

(declare-fun m!167533 () Bool)

(assert (=> b!112182 m!167533))

(declare-fun m!167535 () Bool)

(assert (=> b!112182 m!167535))

(declare-fun m!167537 () Bool)

(assert (=> b!112182 m!167537))

(declare-fun m!167539 () Bool)

(assert (=> b!112182 m!167539))

(declare-fun m!167541 () Bool)

(assert (=> b!112182 m!167541))

(declare-fun m!167543 () Bool)

(assert (=> b!112182 m!167543))

(declare-fun m!167545 () Bool)

(assert (=> b!112179 m!167545))

(assert (=> b!112179 m!167545))

(declare-fun m!167547 () Bool)

(assert (=> b!112179 m!167547))

(declare-fun m!167549 () Bool)

(assert (=> b!112175 m!167549))

(declare-fun m!167551 () Bool)

(assert (=> b!112175 m!167551))

(declare-fun m!167553 () Bool)

(assert (=> b!112180 m!167553))

(declare-fun m!167555 () Bool)

(assert (=> b!112185 m!167555))

(declare-fun m!167557 () Bool)

(assert (=> b!112185 m!167557))

(assert (=> b!112185 m!167497))

(declare-fun m!167559 () Bool)

(assert (=> b!112185 m!167559))

(declare-fun m!167561 () Bool)

(assert (=> b!112185 m!167561))

(declare-fun m!167563 () Bool)

(assert (=> bm!1422 m!167563))

(declare-fun m!167565 () Bool)

(assert (=> b!112177 m!167565))

(assert (=> b!112174 m!167551))

(assert (=> b!112174 m!166841))

(declare-fun m!167567 () Bool)

(assert (=> b!112178 m!167567))

(assert (=> b!112178 m!166841))

(declare-fun m!167569 () Bool)

(assert (=> b!112181 m!167569))

(declare-fun m!167571 () Bool)

(assert (=> b!112183 m!167571))

(assert (=> b!111835 d!35738))

(declare-fun b!112197 () Bool)

(declare-fun res!92640 () Bool)

(declare-fun e!73602 () Bool)

(assert (=> b!112197 (=> (not res!92640) (not e!73602))))

(declare-fun lt!170838 () tuple2!9256)

(assert (=> b!112197 (= res!92640 (isPrefixOf!0 (_1!4888 lt!170838) (_2!4886 lt!169810)))))

(declare-fun lt!170839 () (_ BitVec 64))

(declare-fun lt!170832 () (_ BitVec 64))

(declare-fun b!112198 () Bool)

(assert (=> b!112198 (= e!73602 (= (_1!4888 lt!170838) (withMovedBitIndex!0 (_2!4888 lt!170838) (bvsub lt!170832 lt!170839))))))

(assert (=> b!112198 (or (= (bvand lt!170832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170832 lt!170839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112198 (= lt!170839 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807))))))

(assert (=> b!112198 (= lt!170832 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(declare-fun b!112199 () Bool)

(declare-fun e!73601 () Unit!6847)

(declare-fun Unit!6874 () Unit!6847)

(assert (=> b!112199 (= e!73601 Unit!6874)))

(declare-fun d!35792 () Bool)

(assert (=> d!35792 e!73602))

(declare-fun res!92638 () Bool)

(assert (=> d!35792 (=> (not res!92638) (not e!73602))))

(assert (=> d!35792 (= res!92638 (isPrefixOf!0 (_1!4888 lt!170838) (_2!4888 lt!170838)))))

(declare-fun lt!170834 () BitStream!4102)

(assert (=> d!35792 (= lt!170838 (tuple2!9257 lt!170834 (_2!4886 lt!169807)))))

(declare-fun lt!170828 () Unit!6847)

(declare-fun lt!170833 () Unit!6847)

(assert (=> d!35792 (= lt!170828 lt!170833)))

(assert (=> d!35792 (isPrefixOf!0 lt!170834 (_2!4886 lt!169807))))

(assert (=> d!35792 (= lt!170833 (lemmaIsPrefixTransitive!0 lt!170834 (_2!4886 lt!169807) (_2!4886 lt!169807)))))

(declare-fun lt!170826 () Unit!6847)

(declare-fun lt!170840 () Unit!6847)

(assert (=> d!35792 (= lt!170826 lt!170840)))

(assert (=> d!35792 (isPrefixOf!0 lt!170834 (_2!4886 lt!169807))))

(assert (=> d!35792 (= lt!170840 (lemmaIsPrefixTransitive!0 lt!170834 (_2!4886 lt!169810) (_2!4886 lt!169807)))))

(declare-fun lt!170843 () Unit!6847)

(assert (=> d!35792 (= lt!170843 e!73601)))

(declare-fun c!6832 () Bool)

(assert (=> d!35792 (= c!6832 (not (= (size!2314 (buf!2717 (_2!4886 lt!169810))) #b00000000000000000000000000000000)))))

(declare-fun lt!170836 () Unit!6847)

(declare-fun lt!170842 () Unit!6847)

(assert (=> d!35792 (= lt!170836 lt!170842)))

(assert (=> d!35792 (isPrefixOf!0 (_2!4886 lt!169807) (_2!4886 lt!169807))))

(assert (=> d!35792 (= lt!170842 (lemmaIsPrefixRefl!0 (_2!4886 lt!169807)))))

(declare-fun lt!170824 () Unit!6847)

(declare-fun lt!170831 () Unit!6847)

(assert (=> d!35792 (= lt!170824 lt!170831)))

(assert (=> d!35792 (= lt!170831 (lemmaIsPrefixRefl!0 (_2!4886 lt!169807)))))

(declare-fun lt!170827 () Unit!6847)

(declare-fun lt!170829 () Unit!6847)

(assert (=> d!35792 (= lt!170827 lt!170829)))

(assert (=> d!35792 (isPrefixOf!0 lt!170834 lt!170834)))

(assert (=> d!35792 (= lt!170829 (lemmaIsPrefixRefl!0 lt!170834))))

(declare-fun lt!170835 () Unit!6847)

(declare-fun lt!170837 () Unit!6847)

(assert (=> d!35792 (= lt!170835 lt!170837)))

(assert (=> d!35792 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!169810))))

(assert (=> d!35792 (= lt!170837 (lemmaIsPrefixRefl!0 (_2!4886 lt!169810)))))

(assert (=> d!35792 (= lt!170834 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> d!35792 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!169807))))

(assert (=> d!35792 (= (reader!0 (_2!4886 lt!169810) (_2!4886 lt!169807)) lt!170838)))

(declare-fun b!112200 () Bool)

(declare-fun lt!170830 () Unit!6847)

(assert (=> b!112200 (= e!73601 lt!170830)))

(declare-fun lt!170841 () (_ BitVec 64))

(assert (=> b!112200 (= lt!170841 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!170825 () (_ BitVec 64))

(assert (=> b!112200 (= lt!170825 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5090 array!5090 (_ BitVec 64) (_ BitVec 64)) Unit!6847)

(assert (=> b!112200 (= lt!170830 (arrayBitRangesEqSymmetric!0 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!169807)) lt!170841 lt!170825))))

(declare-fun arrayBitRangesEq!0 (array!5090 array!5090 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112200 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169807)) (buf!2717 (_2!4886 lt!169810)) lt!170841 lt!170825)))

(declare-fun b!112201 () Bool)

(declare-fun res!92639 () Bool)

(assert (=> b!112201 (=> (not res!92639) (not e!73602))))

(assert (=> b!112201 (= res!92639 (isPrefixOf!0 (_2!4888 lt!170838) (_2!4886 lt!169807)))))

(assert (= (and d!35792 c!6832) b!112200))

(assert (= (and d!35792 (not c!6832)) b!112199))

(assert (= (and d!35792 res!92638) b!112197))

(assert (= (and b!112197 res!92640) b!112201))

(assert (= (and b!112201 res!92639) b!112198))

(assert (=> b!112200 m!166841))

(declare-fun m!167573 () Bool)

(assert (=> b!112200 m!167573))

(declare-fun m!167575 () Bool)

(assert (=> b!112200 m!167575))

(declare-fun m!167577 () Bool)

(assert (=> d!35792 m!167577))

(declare-fun m!167579 () Bool)

(assert (=> d!35792 m!167579))

(declare-fun m!167581 () Bool)

(assert (=> d!35792 m!167581))

(declare-fun m!167583 () Bool)

(assert (=> d!35792 m!167583))

(declare-fun m!167585 () Bool)

(assert (=> d!35792 m!167585))

(declare-fun m!167587 () Bool)

(assert (=> d!35792 m!167587))

(declare-fun m!167589 () Bool)

(assert (=> d!35792 m!167589))

(declare-fun m!167591 () Bool)

(assert (=> d!35792 m!167591))

(declare-fun m!167593 () Bool)

(assert (=> d!35792 m!167593))

(declare-fun m!167595 () Bool)

(assert (=> d!35792 m!167595))

(declare-fun m!167597 () Bool)

(assert (=> d!35792 m!167597))

(declare-fun m!167599 () Bool)

(assert (=> b!112201 m!167599))

(declare-fun m!167601 () Bool)

(assert (=> b!112197 m!167601))

(declare-fun m!167603 () Bool)

(assert (=> b!112198 m!167603))

(assert (=> b!112198 m!166831))

(assert (=> b!112198 m!166841))

(assert (=> b!111835 d!35792))

(declare-fun b!112211 () Bool)

(declare-fun res!92650 () Bool)

(declare-fun e!73608 () Bool)

(assert (=> b!112211 (=> (not res!92650) (not e!73608))))

(declare-fun lt!170852 () (_ BitVec 64))

(declare-fun lt!170854 () tuple2!9252)

(declare-fun lt!170853 () (_ BitVec 64))

(assert (=> b!112211 (= res!92650 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170854))) (currentByte!5283 (_2!4886 lt!170854)) (currentBit!5278 (_2!4886 lt!170854))) (bvadd lt!170853 lt!170852)))))

(assert (=> b!112211 (or (not (= (bvand lt!170853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170852 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170853 lt!170852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112211 (= lt!170852 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112211 (= lt!170853 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(declare-fun b!112212 () Bool)

(declare-fun res!92651 () Bool)

(assert (=> b!112212 (=> (not res!92651) (not e!73608))))

(assert (=> b!112212 (= res!92651 (isPrefixOf!0 thiss!1305 (_2!4886 lt!170854)))))

(declare-fun b!112214 () Bool)

(declare-fun e!73607 () Bool)

(declare-fun lt!170855 () tuple2!9254)

(assert (=> b!112214 (= e!73607 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170855))) (currentByte!5283 (_1!4887 lt!170855)) (currentBit!5278 (_1!4887 lt!170855))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170854))) (currentByte!5283 (_2!4886 lt!170854)) (currentBit!5278 (_2!4886 lt!170854)))))))

(declare-fun b!112213 () Bool)

(assert (=> b!112213 (= e!73608 e!73607)))

(declare-fun res!92649 () Bool)

(assert (=> b!112213 (=> (not res!92649) (not e!73607))))

(assert (=> b!112213 (= res!92649 (and (= (_2!4887 lt!170855) lt!169787) (= (_1!4887 lt!170855) (_2!4886 lt!170854))))))

(assert (=> b!112213 (= lt!170855 (readBitPure!0 (readerFrom!0 (_2!4886 lt!170854) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))))

(declare-fun d!35794 () Bool)

(assert (=> d!35794 e!73608))

(declare-fun res!92652 () Bool)

(assert (=> d!35794 (=> (not res!92652) (not e!73608))))

(assert (=> d!35794 (= res!92652 (= (size!2314 (buf!2717 thiss!1305)) (size!2314 (buf!2717 (_2!4886 lt!170854)))))))

(declare-fun choose!16 (BitStream!4102 Bool) tuple2!9252)

(assert (=> d!35794 (= lt!170854 (choose!16 thiss!1305 lt!169787))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!35794 (validate_offset_bit!0 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305)))))

(assert (=> d!35794 (= (appendBit!0 thiss!1305 lt!169787) lt!170854)))

(assert (= (and d!35794 res!92652) b!112211))

(assert (= (and b!112211 res!92650) b!112212))

(assert (= (and b!112212 res!92651) b!112213))

(assert (= (and b!112213 res!92649) b!112214))

(declare-fun m!167605 () Bool)

(assert (=> b!112212 m!167605))

(declare-fun m!167607 () Bool)

(assert (=> b!112214 m!167607))

(declare-fun m!167609 () Bool)

(assert (=> b!112214 m!167609))

(declare-fun m!167611 () Bool)

(assert (=> b!112213 m!167611))

(assert (=> b!112213 m!167611))

(declare-fun m!167613 () Bool)

(assert (=> b!112213 m!167613))

(declare-fun m!167615 () Bool)

(assert (=> d!35794 m!167615))

(declare-fun m!167617 () Bool)

(assert (=> d!35794 m!167617))

(assert (=> b!112211 m!167609))

(assert (=> b!112211 m!166833))

(assert (=> b!111835 d!35794))

(declare-fun d!35796 () Bool)

(declare-datatypes ((tuple2!9284 0))(
  ( (tuple2!9285 (_1!4902 Bool) (_2!4902 BitStream!4102)) )
))
(declare-fun lt!170858 () tuple2!9284)

(declare-fun readBit!0 (BitStream!4102) tuple2!9284)

(assert (=> d!35796 (= lt!170858 (readBit!0 lt!169794))))

(assert (=> d!35796 (= (readBitPure!0 lt!169794) (tuple2!9255 (_2!4902 lt!170858) (_1!4902 lt!170858)))))

(declare-fun bs!8725 () Bool)

(assert (= bs!8725 d!35796))

(declare-fun m!167619 () Bool)

(assert (=> bs!8725 m!167619))

(assert (=> b!111835 d!35796))

(declare-fun d!35798 () Bool)

(declare-fun lt!170859 () tuple2!9284)

(assert (=> d!35798 (= lt!170859 (readBit!0 (_1!4888 lt!169797)))))

(assert (=> d!35798 (= (readBitPure!0 (_1!4888 lt!169797)) (tuple2!9255 (_2!4902 lt!170859) (_1!4902 lt!170859)))))

(declare-fun bs!8726 () Bool)

(assert (= bs!8726 d!35798))

(declare-fun m!167621 () Bool)

(assert (=> bs!8726 m!167621))

(assert (=> b!111835 d!35798))

(declare-fun d!35800 () Bool)

(declare-fun e!73611 () Bool)

(assert (=> d!35800 e!73611))

(declare-fun res!92655 () Bool)

(assert (=> d!35800 (=> (not res!92655) (not e!73611))))

(declare-fun lt!170870 () tuple2!9254)

(declare-fun lt!170869 () tuple2!9254)

(assert (=> d!35800 (= res!92655 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170870))) (currentByte!5283 (_1!4887 lt!170870)) (currentBit!5278 (_1!4887 lt!170870))) (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170869))) (currentByte!5283 (_1!4887 lt!170869)) (currentBit!5278 (_1!4887 lt!170869)))))))

(declare-fun lt!170868 () BitStream!4102)

(declare-fun lt!170871 () Unit!6847)

(declare-fun choose!50 (BitStream!4102 BitStream!4102 BitStream!4102 tuple2!9254 tuple2!9254 BitStream!4102 Bool tuple2!9254 tuple2!9254 BitStream!4102 Bool) Unit!6847)

(assert (=> d!35800 (= lt!170871 (choose!50 lt!169794 (_2!4886 lt!169807) lt!170868 lt!170870 (tuple2!9255 (_1!4887 lt!170870) (_2!4887 lt!170870)) (_1!4887 lt!170870) (_2!4887 lt!170870) lt!170869 (tuple2!9255 (_1!4887 lt!170869) (_2!4887 lt!170869)) (_1!4887 lt!170869) (_2!4887 lt!170869)))))

(assert (=> d!35800 (= lt!170869 (readBitPure!0 lt!170868))))

(assert (=> d!35800 (= lt!170870 (readBitPure!0 lt!169794))))

(assert (=> d!35800 (= lt!170868 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 lt!169794) (currentBit!5278 lt!169794)))))

(assert (=> d!35800 (invariant!0 (currentBit!5278 lt!169794) (currentByte!5283 lt!169794) (size!2314 (buf!2717 (_2!4886 lt!169807))))))

(assert (=> d!35800 (= (readBitPrefixLemma!0 lt!169794 (_2!4886 lt!169807)) lt!170871)))

(declare-fun b!112217 () Bool)

(assert (=> b!112217 (= e!73611 (= (_2!4887 lt!170870) (_2!4887 lt!170869)))))

(assert (= (and d!35800 res!92655) b!112217))

(declare-fun m!167623 () Bool)

(assert (=> d!35800 m!167623))

(declare-fun m!167625 () Bool)

(assert (=> d!35800 m!167625))

(declare-fun m!167627 () Bool)

(assert (=> d!35800 m!167627))

(declare-fun m!167629 () Bool)

(assert (=> d!35800 m!167629))

(assert (=> d!35800 m!166819))

(declare-fun m!167631 () Bool)

(assert (=> d!35800 m!167631))

(assert (=> b!111835 d!35800))

(declare-fun d!35802 () Bool)

(declare-fun lt!170872 () tuple2!9284)

(assert (=> d!35802 (= lt!170872 (readBit!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (=> d!35802 (= (readBitPure!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))) (tuple2!9255 (_2!4902 lt!170872) (_1!4902 lt!170872)))))

(declare-fun bs!8727 () Bool)

(assert (= bs!8727 d!35802))

(declare-fun m!167633 () Bool)

(assert (=> bs!8727 m!167633))

(assert (=> b!111835 d!35802))

(declare-fun d!35804 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!35804 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305)) lt!169790) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305))) lt!169790))))

(declare-fun bs!8728 () Bool)

(assert (= bs!8728 d!35804))

(declare-fun m!167635 () Bool)

(assert (=> bs!8728 m!167635))

(assert (=> b!111835 d!35804))

(declare-fun d!35806 () Bool)

(declare-fun res!92664 () Bool)

(declare-fun e!73617 () Bool)

(assert (=> d!35806 (=> (not res!92664) (not e!73617))))

(assert (=> d!35806 (= res!92664 (= (size!2314 (buf!2717 thiss!1305)) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (=> d!35806 (= (isPrefixOf!0 thiss!1305 (_2!4886 lt!169807)) e!73617)))

(declare-fun b!112224 () Bool)

(declare-fun res!92662 () Bool)

(assert (=> b!112224 (=> (not res!92662) (not e!73617))))

(assert (=> b!112224 (= res!92662 (bvsle (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807)))))))

(declare-fun b!112225 () Bool)

(declare-fun e!73616 () Bool)

(assert (=> b!112225 (= e!73617 e!73616)))

(declare-fun res!92663 () Bool)

(assert (=> b!112225 (=> res!92663 e!73616)))

(assert (=> b!112225 (= res!92663 (= (size!2314 (buf!2717 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112226 () Bool)

(assert (=> b!112226 (= e!73616 (arrayBitRangesEq!0 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (= (and d!35806 res!92664) b!112224))

(assert (= (and b!112224 res!92662) b!112225))

(assert (= (and b!112225 (not res!92663)) b!112226))

(assert (=> b!112224 m!166833))

(assert (=> b!112224 m!166831))

(assert (=> b!112226 m!166833))

(assert (=> b!112226 m!166833))

(declare-fun m!167637 () Bool)

(assert (=> b!112226 m!167637))

(assert (=> b!111835 d!35806))

(declare-fun d!35808 () Bool)

(assert (=> d!35808 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305)) lt!169790)))

(declare-fun lt!170875 () Unit!6847)

(declare-fun choose!9 (BitStream!4102 array!5090 (_ BitVec 64) BitStream!4102) Unit!6847)

(assert (=> d!35808 (= lt!170875 (choose!9 thiss!1305 (buf!2717 (_2!4886 lt!169807)) lt!169790 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (=> d!35808 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2717 (_2!4886 lt!169807)) lt!169790) lt!170875)))

(declare-fun bs!8729 () Bool)

(assert (= bs!8729 d!35808))

(assert (=> bs!8729 m!166803))

(declare-fun m!167639 () Bool)

(assert (=> bs!8729 m!167639))

(assert (=> b!111835 d!35808))

(declare-fun d!35810 () Bool)

(assert (=> d!35810 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!169805)))

(declare-fun lt!170876 () Unit!6847)

(assert (=> d!35810 (= lt!170876 (choose!9 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!169807)) lt!169805 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(assert (=> d!35810 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!169807)) lt!169805) lt!170876)))

(declare-fun bs!8730 () Bool)

(assert (= bs!8730 d!35810))

(assert (=> bs!8730 m!166795))

(declare-fun m!167641 () Bool)

(assert (=> bs!8730 m!167641))

(assert (=> b!111835 d!35810))

(declare-fun d!35812 () Bool)

(assert (=> d!35812 (isPrefixOf!0 thiss!1305 (_2!4886 lt!169807))))

(declare-fun lt!170879 () Unit!6847)

(declare-fun choose!30 (BitStream!4102 BitStream!4102 BitStream!4102) Unit!6847)

(assert (=> d!35812 (= lt!170879 (choose!30 thiss!1305 (_2!4886 lt!169810) (_2!4886 lt!169807)))))

(assert (=> d!35812 (isPrefixOf!0 thiss!1305 (_2!4886 lt!169810))))

(assert (=> d!35812 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4886 lt!169810) (_2!4886 lt!169807)) lt!170879)))

(declare-fun bs!8731 () Bool)

(assert (= bs!8731 d!35812))

(assert (=> bs!8731 m!166817))

(declare-fun m!167643 () Bool)

(assert (=> bs!8731 m!167643))

(assert (=> bs!8731 m!166783))

(assert (=> b!111835 d!35812))

(declare-fun d!35814 () Bool)

(declare-fun e!73620 () Bool)

(assert (=> d!35814 e!73620))

(declare-fun res!92669 () Bool)

(assert (=> d!35814 (=> (not res!92669) (not e!73620))))

(declare-fun lt!170897 () (_ BitVec 64))

(declare-fun lt!170895 () (_ BitVec 64))

(declare-fun lt!170892 () (_ BitVec 64))

(assert (=> d!35814 (= res!92669 (= lt!170895 (bvsub lt!170897 lt!170892)))))

(assert (=> d!35814 (or (= (bvand lt!170897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170897 lt!170892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35814 (= lt!170892 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169792)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169792))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169792)))))))

(declare-fun lt!170896 () (_ BitVec 64))

(declare-fun lt!170894 () (_ BitVec 64))

(assert (=> d!35814 (= lt!170897 (bvmul lt!170896 lt!170894))))

(assert (=> d!35814 (or (= lt!170896 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170894 (bvsdiv (bvmul lt!170896 lt!170894) lt!170896)))))

(assert (=> d!35814 (= lt!170894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35814 (= lt!170896 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169792)))))))

(assert (=> d!35814 (= lt!170895 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169792))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169792)))))))

(assert (=> d!35814 (invariant!0 (currentBit!5278 (_1!4887 lt!169792)) (currentByte!5283 (_1!4887 lt!169792)) (size!2314 (buf!2717 (_1!4887 lt!169792))))))

(assert (=> d!35814 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!169792))) (currentByte!5283 (_1!4887 lt!169792)) (currentBit!5278 (_1!4887 lt!169792))) lt!170895)))

(declare-fun b!112231 () Bool)

(declare-fun res!92670 () Bool)

(assert (=> b!112231 (=> (not res!92670) (not e!73620))))

(assert (=> b!112231 (= res!92670 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170895))))

(declare-fun b!112232 () Bool)

(declare-fun lt!170893 () (_ BitVec 64))

(assert (=> b!112232 (= e!73620 (bvsle lt!170895 (bvmul lt!170893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112232 (or (= lt!170893 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170893 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170893)))))

(assert (=> b!112232 (= lt!170893 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169792)))))))

(assert (= (and d!35814 res!92669) b!112231))

(assert (= (and b!112231 res!92670) b!112232))

(declare-fun m!167645 () Bool)

(assert (=> d!35814 m!167645))

(declare-fun m!167647 () Bool)

(assert (=> d!35814 m!167647))

(assert (=> b!111835 d!35814))

(declare-fun d!35816 () Bool)

(declare-fun e!73621 () Bool)

(assert (=> d!35816 e!73621))

(declare-fun res!92671 () Bool)

(assert (=> d!35816 (=> (not res!92671) (not e!73621))))

(declare-fun lt!170903 () (_ BitVec 64))

(declare-fun lt!170901 () (_ BitVec 64))

(declare-fun lt!170898 () (_ BitVec 64))

(assert (=> d!35816 (= res!92671 (= lt!170901 (bvsub lt!170903 lt!170898)))))

(assert (=> d!35816 (or (= (bvand lt!170903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170903 lt!170898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35816 (= lt!170898 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169801)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169801))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169801)))))))

(declare-fun lt!170902 () (_ BitVec 64))

(declare-fun lt!170900 () (_ BitVec 64))

(assert (=> d!35816 (= lt!170903 (bvmul lt!170902 lt!170900))))

(assert (=> d!35816 (or (= lt!170902 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170900 (bvsdiv (bvmul lt!170902 lt!170900) lt!170902)))))

(assert (=> d!35816 (= lt!170900 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35816 (= lt!170902 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169801)))))))

(assert (=> d!35816 (= lt!170901 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169801))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169801)))))))

(assert (=> d!35816 (invariant!0 (currentBit!5278 (_1!4887 lt!169801)) (currentByte!5283 (_1!4887 lt!169801)) (size!2314 (buf!2717 (_1!4887 lt!169801))))))

(assert (=> d!35816 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!169801))) (currentByte!5283 (_1!4887 lt!169801)) (currentBit!5278 (_1!4887 lt!169801))) lt!170901)))

(declare-fun b!112233 () Bool)

(declare-fun res!92672 () Bool)

(assert (=> b!112233 (=> (not res!92672) (not e!73621))))

(assert (=> b!112233 (= res!92672 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170901))))

(declare-fun b!112234 () Bool)

(declare-fun lt!170899 () (_ BitVec 64))

(assert (=> b!112234 (= e!73621 (bvsle lt!170901 (bvmul lt!170899 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112234 (or (= lt!170899 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170899 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170899)))))

(assert (=> b!112234 (= lt!170899 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169801)))))))

(assert (= (and d!35816 res!92671) b!112233))

(assert (= (and b!112233 res!92672) b!112234))

(declare-fun m!167649 () Bool)

(assert (=> d!35816 m!167649))

(declare-fun m!167651 () Bool)

(assert (=> d!35816 m!167651))

(assert (=> b!111835 d!35816))

(declare-fun d!35818 () Bool)

(declare-datatypes ((tuple2!9286 0))(
  ( (tuple2!9287 (_1!4903 (_ BitVec 64)) (_2!4903 BitStream!4102)) )
))
(declare-fun lt!170906 () tuple2!9286)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9286)

(assert (=> d!35818 (= lt!170906 (readNLeastSignificantBitsLoop!0 (_1!4888 lt!169806) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169808))))

(assert (=> d!35818 (= (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!169806) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169808) (tuple2!9259 (_2!4903 lt!170906) (_1!4903 lt!170906)))))

(declare-fun bs!8732 () Bool)

(assert (= bs!8732 d!35818))

(declare-fun m!167653 () Bool)

(assert (=> bs!8732 m!167653))

(assert (=> b!111835 d!35818))

(declare-fun d!35820 () Bool)

(assert (=> d!35820 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!169805) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810)))) lt!169805))))

(declare-fun bs!8733 () Bool)

(assert (= bs!8733 d!35820))

(declare-fun m!167655 () Bool)

(assert (=> bs!8733 m!167655))

(assert (=> b!111835 d!35820))

(declare-fun b!112235 () Bool)

(declare-fun res!92675 () Bool)

(declare-fun e!73623 () Bool)

(assert (=> b!112235 (=> (not res!92675) (not e!73623))))

(declare-fun lt!170921 () tuple2!9256)

(assert (=> b!112235 (= res!92675 (isPrefixOf!0 (_1!4888 lt!170921) thiss!1305))))

(declare-fun b!112236 () Bool)

(declare-fun lt!170922 () (_ BitVec 64))

(declare-fun lt!170915 () (_ BitVec 64))

(assert (=> b!112236 (= e!73623 (= (_1!4888 lt!170921) (withMovedBitIndex!0 (_2!4888 lt!170921) (bvsub lt!170915 lt!170922))))))

(assert (=> b!112236 (or (= (bvand lt!170915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170922 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170915 lt!170922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112236 (= lt!170922 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807))))))

(assert (=> b!112236 (= lt!170915 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(declare-fun b!112237 () Bool)

(declare-fun e!73622 () Unit!6847)

(declare-fun Unit!6876 () Unit!6847)

(assert (=> b!112237 (= e!73622 Unit!6876)))

(declare-fun d!35822 () Bool)

(assert (=> d!35822 e!73623))

(declare-fun res!92673 () Bool)

(assert (=> d!35822 (=> (not res!92673) (not e!73623))))

(assert (=> d!35822 (= res!92673 (isPrefixOf!0 (_1!4888 lt!170921) (_2!4888 lt!170921)))))

(declare-fun lt!170917 () BitStream!4102)

(assert (=> d!35822 (= lt!170921 (tuple2!9257 lt!170917 (_2!4886 lt!169807)))))

(declare-fun lt!170911 () Unit!6847)

(declare-fun lt!170916 () Unit!6847)

(assert (=> d!35822 (= lt!170911 lt!170916)))

(assert (=> d!35822 (isPrefixOf!0 lt!170917 (_2!4886 lt!169807))))

(assert (=> d!35822 (= lt!170916 (lemmaIsPrefixTransitive!0 lt!170917 (_2!4886 lt!169807) (_2!4886 lt!169807)))))

(declare-fun lt!170909 () Unit!6847)

(declare-fun lt!170923 () Unit!6847)

(assert (=> d!35822 (= lt!170909 lt!170923)))

(assert (=> d!35822 (isPrefixOf!0 lt!170917 (_2!4886 lt!169807))))

(assert (=> d!35822 (= lt!170923 (lemmaIsPrefixTransitive!0 lt!170917 thiss!1305 (_2!4886 lt!169807)))))

(declare-fun lt!170926 () Unit!6847)

(assert (=> d!35822 (= lt!170926 e!73622)))

(declare-fun c!6833 () Bool)

(assert (=> d!35822 (= c!6833 (not (= (size!2314 (buf!2717 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!170919 () Unit!6847)

(declare-fun lt!170925 () Unit!6847)

(assert (=> d!35822 (= lt!170919 lt!170925)))

(assert (=> d!35822 (isPrefixOf!0 (_2!4886 lt!169807) (_2!4886 lt!169807))))

(assert (=> d!35822 (= lt!170925 (lemmaIsPrefixRefl!0 (_2!4886 lt!169807)))))

(declare-fun lt!170907 () Unit!6847)

(declare-fun lt!170914 () Unit!6847)

(assert (=> d!35822 (= lt!170907 lt!170914)))

(assert (=> d!35822 (= lt!170914 (lemmaIsPrefixRefl!0 (_2!4886 lt!169807)))))

(declare-fun lt!170910 () Unit!6847)

(declare-fun lt!170912 () Unit!6847)

(assert (=> d!35822 (= lt!170910 lt!170912)))

(assert (=> d!35822 (isPrefixOf!0 lt!170917 lt!170917)))

(assert (=> d!35822 (= lt!170912 (lemmaIsPrefixRefl!0 lt!170917))))

(declare-fun lt!170918 () Unit!6847)

(declare-fun lt!170920 () Unit!6847)

(assert (=> d!35822 (= lt!170918 lt!170920)))

(assert (=> d!35822 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!35822 (= lt!170920 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!35822 (= lt!170917 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(assert (=> d!35822 (isPrefixOf!0 thiss!1305 (_2!4886 lt!169807))))

(assert (=> d!35822 (= (reader!0 thiss!1305 (_2!4886 lt!169807)) lt!170921)))

(declare-fun b!112238 () Bool)

(declare-fun lt!170913 () Unit!6847)

(assert (=> b!112238 (= e!73622 lt!170913)))

(declare-fun lt!170924 () (_ BitVec 64))

(assert (=> b!112238 (= lt!170924 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!170908 () (_ BitVec 64))

(assert (=> b!112238 (= lt!170908 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(assert (=> b!112238 (= lt!170913 (arrayBitRangesEqSymmetric!0 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169807)) lt!170924 lt!170908))))

(assert (=> b!112238 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169807)) (buf!2717 thiss!1305) lt!170924 lt!170908)))

(declare-fun b!112239 () Bool)

(declare-fun res!92674 () Bool)

(assert (=> b!112239 (=> (not res!92674) (not e!73623))))

(assert (=> b!112239 (= res!92674 (isPrefixOf!0 (_2!4888 lt!170921) (_2!4886 lt!169807)))))

(assert (= (and d!35822 c!6833) b!112238))

(assert (= (and d!35822 (not c!6833)) b!112237))

(assert (= (and d!35822 res!92673) b!112235))

(assert (= (and b!112235 res!92675) b!112239))

(assert (= (and b!112239 res!92674) b!112236))

(assert (=> b!112238 m!166833))

(declare-fun m!167657 () Bool)

(assert (=> b!112238 m!167657))

(declare-fun m!167659 () Bool)

(assert (=> b!112238 m!167659))

(declare-fun m!167661 () Bool)

(assert (=> d!35822 m!167661))

(declare-fun m!167663 () Bool)

(assert (=> d!35822 m!167663))

(assert (=> d!35822 m!166817))

(assert (=> d!35822 m!167583))

(declare-fun m!167665 () Bool)

(assert (=> d!35822 m!167665))

(declare-fun m!167667 () Bool)

(assert (=> d!35822 m!167667))

(declare-fun m!167669 () Bool)

(assert (=> d!35822 m!167669))

(declare-fun m!167671 () Bool)

(assert (=> d!35822 m!167671))

(declare-fun m!167673 () Bool)

(assert (=> d!35822 m!167673))

(declare-fun m!167675 () Bool)

(assert (=> d!35822 m!167675))

(assert (=> d!35822 m!167597))

(declare-fun m!167677 () Bool)

(assert (=> b!112239 m!167677))

(declare-fun m!167679 () Bool)

(assert (=> b!112235 m!167679))

(declare-fun m!167681 () Bool)

(assert (=> b!112236 m!167681))

(assert (=> b!112236 m!166831))

(assert (=> b!112236 m!166833))

(assert (=> b!111835 d!35822))

(declare-fun lt!170927 () tuple2!9286)

(declare-fun d!35824 () Bool)

(assert (=> d!35824 (= lt!170927 (readNLeastSignificantBitsLoop!0 (_1!4888 lt!169797) nBits!396 i!615 lt!169798))))

(assert (=> d!35824 (= (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!169797) nBits!396 i!615 lt!169798) (tuple2!9259 (_2!4903 lt!170927) (_1!4903 lt!170927)))))

(declare-fun bs!8734 () Bool)

(assert (= bs!8734 d!35824))

(declare-fun m!167683 () Bool)

(assert (=> bs!8734 m!167683))

(assert (=> b!111835 d!35824))

(declare-fun d!35826 () Bool)

(assert (=> d!35826 (= (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169810)))) (and (bvsge (currentBit!5278 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5278 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5283 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169810)))) (and (= (currentBit!5278 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169810))))))))))

(assert (=> b!111836 d!35826))

(declare-fun d!35828 () Bool)

(declare-fun e!73624 () Bool)

(assert (=> d!35828 e!73624))

(declare-fun res!92676 () Bool)

(assert (=> d!35828 (=> (not res!92676) (not e!73624))))

(declare-fun lt!170931 () (_ BitVec 64))

(declare-fun lt!170928 () (_ BitVec 64))

(declare-fun lt!170933 () (_ BitVec 64))

(assert (=> d!35828 (= res!92676 (= lt!170931 (bvsub lt!170933 lt!170928)))))

(assert (=> d!35828 (or (= (bvand lt!170933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170928 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170933 lt!170928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35828 (= lt!170928 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810)))))))

(declare-fun lt!170932 () (_ BitVec 64))

(declare-fun lt!170930 () (_ BitVec 64))

(assert (=> d!35828 (= lt!170933 (bvmul lt!170932 lt!170930))))

(assert (=> d!35828 (or (= lt!170932 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170930 (bvsdiv (bvmul lt!170932 lt!170930) lt!170932)))))

(assert (=> d!35828 (= lt!170930 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35828 (= lt!170932 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(assert (=> d!35828 (= lt!170931 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810)))))))

(assert (=> d!35828 (invariant!0 (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!169810))))))

(assert (=> d!35828 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) lt!170931)))

(declare-fun b!112240 () Bool)

(declare-fun res!92677 () Bool)

(assert (=> b!112240 (=> (not res!92677) (not e!73624))))

(assert (=> b!112240 (= res!92677 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170931))))

(declare-fun b!112241 () Bool)

(declare-fun lt!170929 () (_ BitVec 64))

(assert (=> b!112241 (= e!73624 (bvsle lt!170931 (bvmul lt!170929 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112241 (or (= lt!170929 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170929 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170929)))))

(assert (=> b!112241 (= lt!170929 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(assert (= (and d!35828 res!92676) b!112240))

(assert (= (and b!112240 res!92677) b!112241))

(declare-fun m!167685 () Bool)

(assert (=> d!35828 m!167685))

(declare-fun m!167687 () Bool)

(assert (=> d!35828 m!167687))

(assert (=> b!111837 d!35828))

(declare-fun d!35830 () Bool)

(declare-fun e!73625 () Bool)

(assert (=> d!35830 e!73625))

(declare-fun res!92678 () Bool)

(assert (=> d!35830 (=> (not res!92678) (not e!73625))))

(declare-fun lt!170939 () (_ BitVec 64))

(declare-fun lt!170937 () (_ BitVec 64))

(declare-fun lt!170934 () (_ BitVec 64))

(assert (=> d!35830 (= res!92678 (= lt!170937 (bvsub lt!170939 lt!170934)))))

(assert (=> d!35830 (or (= (bvand lt!170939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170934 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170939 lt!170934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35830 (= lt!170934 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305))))))

(declare-fun lt!170938 () (_ BitVec 64))

(declare-fun lt!170936 () (_ BitVec 64))

(assert (=> d!35830 (= lt!170939 (bvmul lt!170938 lt!170936))))

(assert (=> d!35830 (or (= lt!170938 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170936 (bvsdiv (bvmul lt!170938 lt!170936) lt!170938)))))

(assert (=> d!35830 (= lt!170936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35830 (= lt!170938 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))))))

(assert (=> d!35830 (= lt!170937 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 thiss!1305))))))

(assert (=> d!35830 (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 thiss!1305)))))

(assert (=> d!35830 (= (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)) lt!170937)))

(declare-fun b!112242 () Bool)

(declare-fun res!92679 () Bool)

(assert (=> b!112242 (=> (not res!92679) (not e!73625))))

(assert (=> b!112242 (= res!92679 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170937))))

(declare-fun b!112243 () Bool)

(declare-fun lt!170935 () (_ BitVec 64))

(assert (=> b!112243 (= e!73625 (bvsle lt!170937 (bvmul lt!170935 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112243 (or (= lt!170935 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170935 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170935)))))

(assert (=> b!112243 (= lt!170935 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))))))

(assert (= (and d!35830 res!92678) b!112242))

(assert (= (and b!112242 res!92679) b!112243))

(declare-fun m!167689 () Bool)

(assert (=> d!35830 m!167689))

(declare-fun m!167691 () Bool)

(assert (=> d!35830 m!167691))

(assert (=> b!111837 d!35830))

(declare-fun d!35832 () Bool)

(declare-fun e!73628 () Bool)

(assert (=> d!35832 e!73628))

(declare-fun res!92682 () Bool)

(assert (=> d!35832 (=> (not res!92682) (not e!73628))))

(declare-fun lt!170944 () BitStream!4102)

(declare-fun lt!170945 () (_ BitVec 64))

(assert (=> d!35832 (= res!92682 (= (bvadd lt!170945 (bvsub lt!169802 lt!169788)) (bitIndex!0 (size!2314 (buf!2717 lt!170944)) (currentByte!5283 lt!170944) (currentBit!5278 lt!170944))))))

(assert (=> d!35832 (or (not (= (bvand lt!170945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169802 lt!169788) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170945 (bvsub lt!169802 lt!169788)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35832 (= lt!170945 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!169797))) (currentByte!5283 (_2!4888 lt!169797)) (currentBit!5278 (_2!4888 lt!169797))))))

(declare-fun moveBitIndex!0 (BitStream!4102 (_ BitVec 64)) tuple2!9252)

(assert (=> d!35832 (= lt!170944 (_2!4886 (moveBitIndex!0 (_2!4888 lt!169797) (bvsub lt!169802 lt!169788))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4102 (_ BitVec 64)) Bool)

(assert (=> d!35832 (moveBitIndexPrecond!0 (_2!4888 lt!169797) (bvsub lt!169802 lt!169788))))

(assert (=> d!35832 (= (withMovedBitIndex!0 (_2!4888 lt!169797) (bvsub lt!169802 lt!169788)) lt!170944)))

(declare-fun b!112246 () Bool)

(assert (=> b!112246 (= e!73628 (= (size!2314 (buf!2717 (_2!4888 lt!169797))) (size!2314 (buf!2717 lt!170944))))))

(assert (= (and d!35832 res!92682) b!112246))

(declare-fun m!167693 () Bool)

(assert (=> d!35832 m!167693))

(declare-fun m!167695 () Bool)

(assert (=> d!35832 m!167695))

(declare-fun m!167697 () Bool)

(assert (=> d!35832 m!167697))

(declare-fun m!167699 () Bool)

(assert (=> d!35832 m!167699))

(assert (=> b!111838 d!35832))

(declare-fun d!35834 () Bool)

(declare-fun e!73629 () Bool)

(assert (=> d!35834 e!73629))

(declare-fun res!92683 () Bool)

(assert (=> d!35834 (=> (not res!92683) (not e!73629))))

(declare-fun lt!170947 () (_ BitVec 64))

(declare-fun lt!170946 () BitStream!4102)

(assert (=> d!35834 (= res!92683 (= (bvadd lt!170947 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2314 (buf!2717 lt!170946)) (currentByte!5283 lt!170946) (currentBit!5278 lt!170946))))))

(assert (=> d!35834 (or (not (= (bvand lt!170947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170947 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35834 (= lt!170947 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)) (currentBit!5278 (_1!4888 lt!169797))))))

(assert (=> d!35834 (= lt!170946 (_2!4886 (moveBitIndex!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!35834 (moveBitIndexPrecond!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!35834 (= (withMovedBitIndex!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001) lt!170946)))

(declare-fun b!112247 () Bool)

(assert (=> b!112247 (= e!73629 (= (size!2314 (buf!2717 (_1!4888 lt!169797))) (size!2314 (buf!2717 lt!170946))))))

(assert (= (and d!35834 res!92683) b!112247))

(declare-fun m!167701 () Bool)

(assert (=> d!35834 m!167701))

(declare-fun m!167703 () Bool)

(assert (=> d!35834 m!167703))

(declare-fun m!167705 () Bool)

(assert (=> d!35834 m!167705))

(declare-fun m!167707 () Bool)

(assert (=> d!35834 m!167707))

(assert (=> b!111838 d!35834))

(declare-fun d!35836 () Bool)

(declare-fun e!73630 () Bool)

(assert (=> d!35836 e!73630))

(declare-fun res!92684 () Bool)

(assert (=> d!35836 (=> (not res!92684) (not e!73630))))

(declare-fun lt!170953 () (_ BitVec 64))

(declare-fun lt!170951 () (_ BitVec 64))

(declare-fun lt!170948 () (_ BitVec 64))

(assert (=> d!35836 (= res!92684 (= lt!170951 (bvsub lt!170953 lt!170948)))))

(assert (=> d!35836 (or (= (bvand lt!170953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170953 lt!170948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35836 (= lt!170948 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169807))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169807)))))))

(declare-fun lt!170952 () (_ BitVec 64))

(declare-fun lt!170950 () (_ BitVec 64))

(assert (=> d!35836 (= lt!170953 (bvmul lt!170952 lt!170950))))

(assert (=> d!35836 (or (= lt!170952 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170950 (bvsdiv (bvmul lt!170952 lt!170950) lt!170952)))))

(assert (=> d!35836 (= lt!170950 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35836 (= lt!170952 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (=> d!35836 (= lt!170951 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169807))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169807)))))))

(assert (=> d!35836 (invariant!0 (currentBit!5278 (_2!4886 lt!169807)) (currentByte!5283 (_2!4886 lt!169807)) (size!2314 (buf!2717 (_2!4886 lt!169807))))))

(assert (=> d!35836 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807))) lt!170951)))

(declare-fun b!112248 () Bool)

(declare-fun res!92685 () Bool)

(assert (=> b!112248 (=> (not res!92685) (not e!73630))))

(assert (=> b!112248 (= res!92685 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170951))))

(declare-fun b!112249 () Bool)

(declare-fun lt!170949 () (_ BitVec 64))

(assert (=> b!112249 (= e!73630 (bvsle lt!170951 (bvmul lt!170949 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112249 (or (= lt!170949 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170949 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170949)))))

(assert (=> b!112249 (= lt!170949 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (= (and d!35836 res!92684) b!112248))

(assert (= (and b!112248 res!92685) b!112249))

(declare-fun m!167709 () Bool)

(assert (=> d!35836 m!167709))

(declare-fun m!167711 () Bool)

(assert (=> d!35836 m!167711))

(assert (=> b!111838 d!35836))

(declare-fun d!35838 () Bool)

(declare-fun e!73631 () Bool)

(assert (=> d!35838 e!73631))

(declare-fun res!92686 () Bool)

(assert (=> d!35838 (=> (not res!92686) (not e!73631))))

(declare-fun lt!170955 () (_ BitVec 64))

(declare-fun lt!170954 () BitStream!4102)

(assert (=> d!35838 (= res!92686 (= (bvadd lt!170955 (bvsub lt!169799 lt!169788)) (bitIndex!0 (size!2314 (buf!2717 lt!170954)) (currentByte!5283 lt!170954) (currentBit!5278 lt!170954))))))

(assert (=> d!35838 (or (not (= (bvand lt!170955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169799 lt!169788) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170955 (bvsub lt!169799 lt!169788)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35838 (= lt!170955 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!169806))) (currentByte!5283 (_2!4888 lt!169806)) (currentBit!5278 (_2!4888 lt!169806))))))

(assert (=> d!35838 (= lt!170954 (_2!4886 (moveBitIndex!0 (_2!4888 lt!169806) (bvsub lt!169799 lt!169788))))))

(assert (=> d!35838 (moveBitIndexPrecond!0 (_2!4888 lt!169806) (bvsub lt!169799 lt!169788))))

(assert (=> d!35838 (= (withMovedBitIndex!0 (_2!4888 lt!169806) (bvsub lt!169799 lt!169788)) lt!170954)))

(declare-fun b!112250 () Bool)

(assert (=> b!112250 (= e!73631 (= (size!2314 (buf!2717 (_2!4888 lt!169806))) (size!2314 (buf!2717 lt!170954))))))

(assert (= (and d!35838 res!92686) b!112250))

(declare-fun m!167713 () Bool)

(assert (=> d!35838 m!167713))

(declare-fun m!167715 () Bool)

(assert (=> d!35838 m!167715))

(declare-fun m!167717 () Bool)

(assert (=> d!35838 m!167717))

(declare-fun m!167719 () Bool)

(assert (=> d!35838 m!167719))

(assert (=> b!111838 d!35838))

(declare-fun lt!170956 () tuple2!9286)

(declare-fun d!35840 () Bool)

(assert (=> d!35840 (= lt!170956 (readNLeastSignificantBitsLoop!0 lt!169812 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169808))))

(assert (=> d!35840 (= (readNLeastSignificantBitsLoopPure!0 lt!169812 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169808) (tuple2!9259 (_2!4903 lt!170956) (_1!4903 lt!170956)))))

(declare-fun bs!8735 () Bool)

(assert (= bs!8735 d!35840))

(declare-fun m!167721 () Bool)

(assert (=> bs!8735 m!167721))

(assert (=> b!111838 d!35840))

(assert (=> b!111838 d!35828))

(declare-fun d!35842 () Bool)

(declare-fun lt!170973 () tuple2!9258)

(declare-fun lt!170972 () tuple2!9258)

(assert (=> d!35842 (and (= (_2!4889 lt!170973) (_2!4889 lt!170972)) (= (_1!4889 lt!170973) (_1!4889 lt!170972)))))

(declare-fun lt!170974 () (_ BitVec 64))

(declare-fun lt!170969 () Unit!6847)

(declare-fun lt!170971 () Bool)

(declare-fun lt!170970 () BitStream!4102)

(declare-fun choose!45 (BitStream!4102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9258 tuple2!9258 BitStream!4102 (_ BitVec 64) Bool BitStream!4102 (_ BitVec 64) tuple2!9258 tuple2!9258 BitStream!4102 (_ BitVec 64)) Unit!6847)

(assert (=> d!35842 (= lt!170969 (choose!45 (_1!4888 lt!169797) nBits!396 i!615 lt!169798 lt!170973 (tuple2!9259 (_1!4889 lt!170973) (_2!4889 lt!170973)) (_1!4889 lt!170973) (_2!4889 lt!170973) lt!170971 lt!170970 lt!170974 lt!170972 (tuple2!9259 (_1!4889 lt!170972) (_2!4889 lt!170972)) (_1!4889 lt!170972) (_2!4889 lt!170972)))))

(assert (=> d!35842 (= lt!170972 (readNLeastSignificantBitsLoopPure!0 lt!170970 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!170974))))

(assert (=> d!35842 (= lt!170974 (bvor lt!169798 (ite lt!170971 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35842 (= lt!170970 (withMovedBitIndex!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!35842 (= lt!170971 (_2!4887 (readBitPure!0 (_1!4888 lt!169797))))))

(assert (=> d!35842 (= lt!170973 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!169797) nBits!396 i!615 lt!169798))))

(assert (=> d!35842 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4888 lt!169797) nBits!396 i!615 lt!169798) lt!170969)))

(declare-fun bs!8737 () Bool)

(assert (= bs!8737 d!35842))

(declare-fun m!167723 () Bool)

(assert (=> bs!8737 m!167723))

(assert (=> bs!8737 m!166811))

(assert (=> bs!8737 m!166823))

(assert (=> bs!8737 m!166837))

(declare-fun m!167725 () Bool)

(assert (=> bs!8737 m!167725))

(assert (=> b!111838 d!35842))

(assert (=> b!111838 d!35830))

(declare-fun d!35844 () Bool)

(assert (=> d!35844 (= (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169807)))) (and (bvsge (currentBit!5278 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5278 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5283 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169807)))) (and (= (currentBit!5278 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169807))))))))))

(assert (=> b!111828 d!35844))

(declare-fun d!35846 () Bool)

(declare-fun res!92689 () Bool)

(declare-fun e!73633 () Bool)

(assert (=> d!35846 (=> (not res!92689) (not e!73633))))

(assert (=> d!35846 (= res!92689 (= (size!2314 (buf!2717 thiss!1305)) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(assert (=> d!35846 (= (isPrefixOf!0 thiss!1305 (_2!4886 lt!169810)) e!73633)))

(declare-fun b!112251 () Bool)

(declare-fun res!92687 () Bool)

(assert (=> b!112251 (=> (not res!92687) (not e!73633))))

(assert (=> b!112251 (= res!92687 (bvsle (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(declare-fun b!112252 () Bool)

(declare-fun e!73632 () Bool)

(assert (=> b!112252 (= e!73633 e!73632)))

(declare-fun res!92688 () Bool)

(assert (=> b!112252 (=> res!92688 e!73632)))

(assert (=> b!112252 (= res!92688 (= (size!2314 (buf!2717 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112253 () Bool)

(assert (=> b!112253 (= e!73632 (arrayBitRangesEq!0 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169810)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (= (and d!35846 res!92689) b!112251))

(assert (= (and b!112251 res!92687) b!112252))

(assert (= (and b!112252 (not res!92688)) b!112253))

(assert (=> b!112251 m!166833))

(assert (=> b!112251 m!166841))

(assert (=> b!112253 m!166833))

(assert (=> b!112253 m!166833))

(declare-fun m!167727 () Bool)

(assert (=> b!112253 m!167727))

(assert (=> b!111840 d!35846))

(declare-fun d!35848 () Bool)

(assert (=> d!35848 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!111829 d!35848))

(declare-fun d!35850 () Bool)

(assert (=> d!35850 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305)) lt!169790) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305))) lt!169790))))

(declare-fun bs!8738 () Bool)

(assert (= bs!8738 d!35850))

(assert (=> bs!8738 m!167689))

(assert (=> b!111830 d!35850))

(declare-fun d!35852 () Bool)

(assert (=> d!35852 (= (array_inv!2116 (buf!2717 thiss!1305)) (bvsge (size!2314 (buf!2717 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!111841 d!35852))

(declare-fun d!35854 () Bool)

(declare-fun e!73634 () Bool)

(assert (=> d!35854 e!73634))

(declare-fun res!92690 () Bool)

(assert (=> d!35854 (=> (not res!92690) (not e!73634))))

(declare-fun lt!170980 () (_ BitVec 64))

(declare-fun lt!170975 () (_ BitVec 64))

(declare-fun lt!170978 () (_ BitVec 64))

(assert (=> d!35854 (= res!92690 (= lt!170978 (bvsub lt!170980 lt!170975)))))

(assert (=> d!35854 (or (= (bvand lt!170980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170980 lt!170975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35854 (= lt!170975 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169809)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169809))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169809)))))))

(declare-fun lt!170979 () (_ BitVec 64))

(declare-fun lt!170977 () (_ BitVec 64))

(assert (=> d!35854 (= lt!170980 (bvmul lt!170979 lt!170977))))

(assert (=> d!35854 (or (= lt!170979 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170977 (bvsdiv (bvmul lt!170979 lt!170977) lt!170979)))))

(assert (=> d!35854 (= lt!170977 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35854 (= lt!170979 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169809)))))))

(assert (=> d!35854 (= lt!170978 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169809))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169809)))))))

(assert (=> d!35854 (invariant!0 (currentBit!5278 (_1!4887 lt!169809)) (currentByte!5283 (_1!4887 lt!169809)) (size!2314 (buf!2717 (_1!4887 lt!169809))))))

(assert (=> d!35854 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!169809))) (currentByte!5283 (_1!4887 lt!169809)) (currentBit!5278 (_1!4887 lt!169809))) lt!170978)))

(declare-fun b!112254 () Bool)

(declare-fun res!92691 () Bool)

(assert (=> b!112254 (=> (not res!92691) (not e!73634))))

(assert (=> b!112254 (= res!92691 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170978))))

(declare-fun b!112255 () Bool)

(declare-fun lt!170976 () (_ BitVec 64))

(assert (=> b!112255 (= e!73634 (bvsle lt!170978 (bvmul lt!170976 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112255 (or (= lt!170976 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170976 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170976)))))

(assert (=> b!112255 (= lt!170976 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169809)))))))

(assert (= (and d!35854 res!92690) b!112254))

(assert (= (and b!112254 res!92691) b!112255))

(declare-fun m!167729 () Bool)

(assert (=> d!35854 m!167729))

(declare-fun m!167731 () Bool)

(assert (=> d!35854 m!167731))

(assert (=> b!111832 d!35854))

(declare-fun d!35856 () Bool)

(declare-fun lt!170981 () tuple2!9284)

(assert (=> d!35856 (= lt!170981 (readBit!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))))

(assert (=> d!35856 (= (readBitPure!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))) (tuple2!9255 (_2!4902 lt!170981) (_1!4902 lt!170981)))))

(declare-fun bs!8739 () Bool)

(assert (= bs!8739 d!35856))

(assert (=> bs!8739 m!166851))

(declare-fun m!167733 () Bool)

(assert (=> bs!8739 m!167733))

(assert (=> b!111833 d!35856))

(declare-fun d!35858 () Bool)

(declare-fun e!73637 () Bool)

(assert (=> d!35858 e!73637))

(declare-fun res!92695 () Bool)

(assert (=> d!35858 (=> (not res!92695) (not e!73637))))

(assert (=> d!35858 (= res!92695 (invariant!0 (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(assert (=> d!35858 (= (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)) (BitStream!4103 (buf!2717 (_2!4886 lt!169810)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(declare-fun b!112258 () Bool)

(assert (=> b!112258 (= e!73637 (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(assert (= (and d!35858 res!92695) b!112258))

(assert (=> d!35858 m!167687))

(assert (=> b!112258 m!166829))

(assert (=> b!111833 d!35858))

(declare-fun d!35860 () Bool)

(assert (=> d!35860 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 thiss!1305))))))

(declare-fun bs!8740 () Bool)

(assert (= bs!8740 d!35860))

(assert (=> bs!8740 m!167691))

(assert (=> start!22132 d!35860))

(push 1)

(assert (not b!112178))

(assert (not b!112197))

(assert (not b!112212))

(assert (not b!112200))

(assert (not b!112175))

(assert (not d!35794))

(assert (not b!112198))

(assert (not d!35832))

(assert (not b!112235))

(assert (not d!35854))

(assert (not d!35836))

(assert (not d!35860))

(assert (not b!112238))

(assert (not b!112179))

(assert (not d!35812))

(assert (not b!112253))

(assert (not b!112177))

(assert (not d!35822))

(assert (not bm!1422))

(assert (not b!112211))

(assert (not d!35802))

(assert (not b!112251))

(assert (not d!35850))

(assert (not b!112180))

(assert (not d!35808))

(assert (not b!112258))

(assert (not d!35820))

(assert (not d!35838))

(assert (not d!35840))

(assert (not d!35800))

(assert (not b!112183))

(assert (not d!35824))

(assert (not b!112174))

(assert (not d!35830))

(assert (not d!35856))

(assert (not d!35858))

(assert (not b!112213))

(assert (not d!35792))

(assert (not d!35804))

(assert (not b!112201))

(assert (not d!35796))

(assert (not b!112214))

(assert (not d!35828))

(assert (not d!35798))

(assert (not d!35814))

(assert (not d!35810))

(assert (not b!112181))

(assert (not b!112239))

(assert (not b!112226))

(assert (not b!112224))

(assert (not d!35818))

(assert (not b!112182))

(assert (not b!112236))

(assert (not d!35834))

(assert (not d!35842))

(assert (not b!112185))

(assert (not d!35816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36108 () Bool)

(assert (=> d!36108 (= (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810)))) (bvsub (bvmul ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))))))))

(assert (=> d!35820 d!36108))

(declare-fun d!36110 () Bool)

(declare-fun lt!171407 () tuple2!9258)

(declare-fun lt!171406 () tuple2!9258)

(assert (=> d!36110 (and (= (_2!4889 lt!171407) (_2!4889 lt!171406)) (= (_1!4889 lt!171407) (_1!4889 lt!171406)))))

(declare-fun e!73810 () (_ BitVec 64))

(assert (=> d!36110 (= lt!171406 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!169798 e!73810)))))

(declare-fun c!6855 () Bool)

(assert (=> d!36110 (= c!6855 (_2!4887 (readBitPure!0 (_1!4888 lt!169797))))))

(assert (=> d!36110 (= lt!171407 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!169797) nBits!396 i!615 lt!169798))))

(assert (=> d!36110 true))

(declare-fun _$11!44 () Unit!6847)

(assert (=> d!36110 (= (choose!45 (_1!4888 lt!169797) nBits!396 i!615 lt!169798 lt!170973 (tuple2!9259 (_1!4889 lt!170973) (_2!4889 lt!170973)) (_1!4889 lt!170973) (_2!4889 lt!170973) lt!170971 lt!170970 lt!170974 lt!170972 (tuple2!9259 (_1!4889 lt!170972) (_2!4889 lt!170972)) (_1!4889 lt!170972) (_2!4889 lt!170972)) _$11!44)))

(declare-fun b!112515 () Bool)

(assert (=> b!112515 (= e!73810 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!112516 () Bool)

(assert (=> b!112516 (= e!73810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!36110 c!6855) b!112515))

(assert (= (and d!36110 (not c!6855)) b!112516))

(assert (=> d!36110 m!166837))

(assert (=> d!36110 m!166837))

(declare-fun m!168311 () Bool)

(assert (=> d!36110 m!168311))

(assert (=> d!36110 m!166811))

(assert (=> d!36110 m!166823))

(assert (=> d!35842 d!36110))

(assert (=> d!35842 d!35834))

(assert (=> d!35842 d!35798))

(declare-fun d!36112 () Bool)

(declare-fun lt!171408 () tuple2!9286)

(assert (=> d!36112 (= lt!171408 (readNLeastSignificantBitsLoop!0 lt!170970 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!170974))))

(assert (=> d!36112 (= (readNLeastSignificantBitsLoopPure!0 lt!170970 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!170974) (tuple2!9259 (_2!4903 lt!171408) (_1!4903 lt!171408)))))

(declare-fun bs!8780 () Bool)

(assert (= bs!8780 d!36112))

(declare-fun m!168313 () Bool)

(assert (=> bs!8780 m!168313))

(assert (=> d!35842 d!36112))

(assert (=> d!35842 d!35824))

(declare-fun b!112529 () Bool)

(declare-fun e!73819 () Bool)

(declare-fun e!73822 () Bool)

(assert (=> b!112529 (= e!73819 e!73822)))

(declare-fun res!92916 () Bool)

(assert (=> b!112529 (=> (not res!92916) (not e!73822))))

(declare-fun lt!171411 () tuple2!9254)

(declare-fun _$19!108 () tuple2!9252)

(assert (=> b!112529 (= res!92916 (and (= (_2!4887 lt!171411) lt!169787) (= (_1!4887 lt!171411) (_2!4886 _$19!108))))))

(assert (=> b!112529 (= lt!171411 (readBitPure!0 (readerFrom!0 (_2!4886 _$19!108) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))))

(declare-fun b!112530 () Bool)

(declare-fun res!92914 () Bool)

(assert (=> b!112530 (=> (not res!92914) (not e!73819))))

(assert (=> b!112530 (= res!92914 (isPrefixOf!0 thiss!1305 (_2!4886 _$19!108)))))

(declare-fun b!112531 () Bool)

(declare-fun e!73821 () Bool)

(assert (=> b!112531 (= e!73821 (array_inv!2116 (buf!2717 (_2!4886 _$19!108))))))

(declare-fun b!112532 () Bool)

(assert (=> b!112532 (= e!73822 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171411))) (currentByte!5283 (_1!4887 lt!171411)) (currentBit!5278 (_1!4887 lt!171411))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 _$19!108))) (currentByte!5283 (_2!4886 _$19!108)) (currentBit!5278 (_2!4886 _$19!108)))))))

(declare-fun d!36114 () Bool)

(assert (=> d!36114 e!73819))

(declare-fun res!92913 () Bool)

(assert (=> d!36114 (=> (not res!92913) (not e!73819))))

(assert (=> d!36114 (= res!92913 (= (size!2314 (buf!2717 thiss!1305)) (size!2314 (buf!2717 (_2!4886 _$19!108)))))))

(assert (=> d!36114 (and (inv!12 (_2!4886 _$19!108)) e!73821)))

(assert (=> d!36114 (= (choose!16 thiss!1305 lt!169787) _$19!108)))

(declare-fun b!112528 () Bool)

(declare-fun res!92915 () Bool)

(assert (=> b!112528 (=> (not res!92915) (not e!73819))))

(assert (=> b!112528 (= res!92915 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 _$19!108))) (currentByte!5283 (_2!4886 _$19!108)) (currentBit!5278 (_2!4886 _$19!108))) (bvadd (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!36114 b!112531))

(assert (= (and d!36114 res!92913) b!112528))

(assert (= (and b!112528 res!92915) b!112530))

(assert (= (and b!112530 res!92914) b!112529))

(assert (= (and b!112529 res!92916) b!112532))

(declare-fun m!168315 () Bool)

(assert (=> b!112529 m!168315))

(assert (=> b!112529 m!168315))

(declare-fun m!168317 () Bool)

(assert (=> b!112529 m!168317))

(declare-fun m!168319 () Bool)

(assert (=> b!112528 m!168319))

(assert (=> b!112528 m!166833))

(declare-fun m!168321 () Bool)

(assert (=> b!112531 m!168321))

(declare-fun m!168323 () Bool)

(assert (=> d!36114 m!168323))

(declare-fun m!168325 () Bool)

(assert (=> b!112532 m!168325))

(assert (=> b!112532 m!168319))

(declare-fun m!168327 () Bool)

(assert (=> b!112530 m!168327))

(assert (=> d!35794 d!36114))

(declare-fun d!36116 () Bool)

(assert (=> d!36116 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8781 () Bool)

(assert (= bs!8781 d!36116))

(assert (=> bs!8781 m!167689))

(assert (=> d!35794 d!36116))

(assert (=> d!35808 d!35804))

(declare-fun d!36118 () Bool)

(assert (=> d!36118 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305)) lt!169790)))

(assert (=> d!36118 true))

(declare-fun _$6!252 () Unit!6847)

(assert (=> d!36118 (= (choose!9 thiss!1305 (buf!2717 (_2!4886 lt!169807)) lt!169790 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))) _$6!252)))

(declare-fun bs!8782 () Bool)

(assert (= bs!8782 d!36118))

(assert (=> bs!8782 m!166803))

(assert (=> d!35808 d!36118))

(declare-fun d!36120 () Bool)

(assert (=> d!36120 (= (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 thiss!1305)))))))

(assert (=> d!35804 d!36120))

(assert (=> d!35812 d!35806))

(declare-fun d!36122 () Bool)

(assert (=> d!36122 (isPrefixOf!0 thiss!1305 (_2!4886 lt!169807))))

(assert (=> d!36122 true))

(declare-fun _$15!183 () Unit!6847)

(assert (=> d!36122 (= (choose!30 thiss!1305 (_2!4886 lt!169810) (_2!4886 lt!169807)) _$15!183)))

(declare-fun bs!8783 () Bool)

(assert (= bs!8783 d!36122))

(assert (=> bs!8783 m!166817))

(assert (=> d!35812 d!36122))

(assert (=> d!35812 d!35846))

(declare-fun b!112533 () Bool)

(declare-fun res!92919 () Bool)

(declare-fun e!73824 () Bool)

(assert (=> b!112533 (=> (not res!92919) (not e!73824))))

(declare-fun lt!171426 () tuple2!9256)

(assert (=> b!112533 (= res!92919 (isPrefixOf!0 (_1!4888 lt!171426) (_2!4886 lt!169810)))))

(declare-fun b!112534 () Bool)

(declare-fun lt!171420 () (_ BitVec 64))

(declare-fun lt!171427 () (_ BitVec 64))

(assert (=> b!112534 (= e!73824 (= (_1!4888 lt!171426) (withMovedBitIndex!0 (_2!4888 lt!171426) (bvsub lt!171420 lt!171427))))))

(assert (=> b!112534 (or (= (bvand lt!171420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171420 lt!171427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112534 (= lt!171427 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170766))) (currentByte!5283 (_2!4886 lt!170766)) (currentBit!5278 (_2!4886 lt!170766))))))

(assert (=> b!112534 (= lt!171420 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(declare-fun b!112535 () Bool)

(declare-fun e!73823 () Unit!6847)

(declare-fun Unit!6904 () Unit!6847)

(assert (=> b!112535 (= e!73823 Unit!6904)))

(declare-fun d!36124 () Bool)

(assert (=> d!36124 e!73824))

(declare-fun res!92917 () Bool)

(assert (=> d!36124 (=> (not res!92917) (not e!73824))))

(assert (=> d!36124 (= res!92917 (isPrefixOf!0 (_1!4888 lt!171426) (_2!4888 lt!171426)))))

(declare-fun lt!171422 () BitStream!4102)

(assert (=> d!36124 (= lt!171426 (tuple2!9257 lt!171422 (_2!4886 lt!170766)))))

(declare-fun lt!171416 () Unit!6847)

(declare-fun lt!171421 () Unit!6847)

(assert (=> d!36124 (= lt!171416 lt!171421)))

(assert (=> d!36124 (isPrefixOf!0 lt!171422 (_2!4886 lt!170766))))

(assert (=> d!36124 (= lt!171421 (lemmaIsPrefixTransitive!0 lt!171422 (_2!4886 lt!170766) (_2!4886 lt!170766)))))

(declare-fun lt!171414 () Unit!6847)

(declare-fun lt!171428 () Unit!6847)

(assert (=> d!36124 (= lt!171414 lt!171428)))

(assert (=> d!36124 (isPrefixOf!0 lt!171422 (_2!4886 lt!170766))))

(assert (=> d!36124 (= lt!171428 (lemmaIsPrefixTransitive!0 lt!171422 (_2!4886 lt!169810) (_2!4886 lt!170766)))))

(declare-fun lt!171431 () Unit!6847)

(assert (=> d!36124 (= lt!171431 e!73823)))

(declare-fun c!6856 () Bool)

(assert (=> d!36124 (= c!6856 (not (= (size!2314 (buf!2717 (_2!4886 lt!169810))) #b00000000000000000000000000000000)))))

(declare-fun lt!171424 () Unit!6847)

(declare-fun lt!171430 () Unit!6847)

(assert (=> d!36124 (= lt!171424 lt!171430)))

(assert (=> d!36124 (isPrefixOf!0 (_2!4886 lt!170766) (_2!4886 lt!170766))))

(assert (=> d!36124 (= lt!171430 (lemmaIsPrefixRefl!0 (_2!4886 lt!170766)))))

(declare-fun lt!171412 () Unit!6847)

(declare-fun lt!171419 () Unit!6847)

(assert (=> d!36124 (= lt!171412 lt!171419)))

(assert (=> d!36124 (= lt!171419 (lemmaIsPrefixRefl!0 (_2!4886 lt!170766)))))

(declare-fun lt!171415 () Unit!6847)

(declare-fun lt!171417 () Unit!6847)

(assert (=> d!36124 (= lt!171415 lt!171417)))

(assert (=> d!36124 (isPrefixOf!0 lt!171422 lt!171422)))

(assert (=> d!36124 (= lt!171417 (lemmaIsPrefixRefl!0 lt!171422))))

(declare-fun lt!171423 () Unit!6847)

(declare-fun lt!171425 () Unit!6847)

(assert (=> d!36124 (= lt!171423 lt!171425)))

(assert (=> d!36124 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!169810))))

(assert (=> d!36124 (= lt!171425 (lemmaIsPrefixRefl!0 (_2!4886 lt!169810)))))

(assert (=> d!36124 (= lt!171422 (BitStream!4103 (buf!2717 (_2!4886 lt!170766)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> d!36124 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!170766))))

(assert (=> d!36124 (= (reader!0 (_2!4886 lt!169810) (_2!4886 lt!170766)) lt!171426)))

(declare-fun b!112536 () Bool)

(declare-fun lt!171418 () Unit!6847)

(assert (=> b!112536 (= e!73823 lt!171418)))

(declare-fun lt!171429 () (_ BitVec 64))

(assert (=> b!112536 (= lt!171429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!171413 () (_ BitVec 64))

(assert (=> b!112536 (= lt!171413 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> b!112536 (= lt!171418 (arrayBitRangesEqSymmetric!0 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!170766)) lt!171429 lt!171413))))

(assert (=> b!112536 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!170766)) (buf!2717 (_2!4886 lt!169810)) lt!171429 lt!171413)))

(declare-fun b!112537 () Bool)

(declare-fun res!92918 () Bool)

(assert (=> b!112537 (=> (not res!92918) (not e!73824))))

(assert (=> b!112537 (= res!92918 (isPrefixOf!0 (_2!4888 lt!171426) (_2!4886 lt!170766)))))

(assert (= (and d!36124 c!6856) b!112536))

(assert (= (and d!36124 (not c!6856)) b!112535))

(assert (= (and d!36124 res!92917) b!112533))

(assert (= (and b!112533 res!92919) b!112537))

(assert (= (and b!112537 res!92918) b!112534))

(assert (=> b!112536 m!166841))

(declare-fun m!168329 () Bool)

(assert (=> b!112536 m!168329))

(declare-fun m!168331 () Bool)

(assert (=> b!112536 m!168331))

(assert (=> d!36124 m!167577))

(assert (=> d!36124 m!167579))

(assert (=> d!36124 m!167565))

(declare-fun m!168333 () Bool)

(assert (=> d!36124 m!168333))

(declare-fun m!168335 () Bool)

(assert (=> d!36124 m!168335))

(declare-fun m!168337 () Bool)

(assert (=> d!36124 m!168337))

(declare-fun m!168339 () Bool)

(assert (=> d!36124 m!168339))

(declare-fun m!168341 () Bool)

(assert (=> d!36124 m!168341))

(declare-fun m!168343 () Bool)

(assert (=> d!36124 m!168343))

(declare-fun m!168345 () Bool)

(assert (=> d!36124 m!168345))

(declare-fun m!168347 () Bool)

(assert (=> d!36124 m!168347))

(declare-fun m!168349 () Bool)

(assert (=> b!112537 m!168349))

(declare-fun m!168351 () Bool)

(assert (=> b!112533 m!168351))

(declare-fun m!168353 () Bool)

(assert (=> b!112534 m!168353))

(assert (=> b!112534 m!167567))

(assert (=> b!112534 m!166841))

(assert (=> b!112185 d!36124))

(declare-fun d!36126 () Bool)

(declare-fun lt!171432 () tuple2!9286)

(assert (=> d!36126 (= lt!171432 (readNLeastSignificantBitsLoop!0 (_1!4888 lt!170768) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170748))))

(assert (=> d!36126 (= (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!170768) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170748) (tuple2!9259 (_2!4903 lt!171432) (_1!4903 lt!171432)))))

(declare-fun bs!8784 () Bool)

(assert (= bs!8784 d!36126))

(declare-fun m!168355 () Bool)

(assert (=> bs!8784 m!168355))

(assert (=> b!112185 d!36126))

(declare-fun d!36128 () Bool)

(assert (=> d!36128 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170766)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!170776)))

(declare-fun lt!171433 () Unit!6847)

(assert (=> d!36128 (= lt!171433 (choose!9 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!170766)) lt!170776 (BitStream!4103 (buf!2717 (_2!4886 lt!170766)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(assert (=> d!36128 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!170766)) lt!170776) lt!171433)))

(declare-fun bs!8785 () Bool)

(assert (= bs!8785 d!36128))

(assert (=> bs!8785 m!167561))

(declare-fun m!168357 () Bool)

(assert (=> bs!8785 m!168357))

(assert (=> b!112185 d!36128))

(declare-fun d!36130 () Bool)

(assert (=> d!36130 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170766)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!170776) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170766)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810)))) lt!170776))))

(declare-fun bs!8786 () Bool)

(assert (= bs!8786 d!36130))

(declare-fun m!168359 () Bool)

(assert (=> bs!8786 m!168359))

(assert (=> b!112185 d!36130))

(declare-fun d!36132 () Bool)

(assert (=> d!36132 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!112185 d!36132))

(declare-fun d!36134 () Bool)

(assert (=> d!36134 (= (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169807))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169807)))) (bvsub (bvmul ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169807))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169807))))))))

(assert (=> d!35836 d!36134))

(declare-fun d!36136 () Bool)

(assert (=> d!36136 (= (invariant!0 (currentBit!5278 (_2!4886 lt!169807)) (currentByte!5283 (_2!4886 lt!169807)) (size!2314 (buf!2717 (_2!4886 lt!169807)))) (and (bvsge (currentBit!5278 (_2!4886 lt!169807)) #b00000000000000000000000000000000) (bvslt (currentBit!5278 (_2!4886 lt!169807)) #b00000000000000000000000000001000) (bvsge (currentByte!5283 (_2!4886 lt!169807)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 (_2!4886 lt!169807)) (size!2314 (buf!2717 (_2!4886 lt!169807)))) (and (= (currentBit!5278 (_2!4886 lt!169807)) #b00000000000000000000000000000000) (= (currentByte!5283 (_2!4886 lt!169807)) (size!2314 (buf!2717 (_2!4886 lt!169807))))))))))

(assert (=> d!35836 d!36136))

(declare-fun d!36138 () Bool)

(declare-fun res!92922 () Bool)

(declare-fun e!73826 () Bool)

(assert (=> d!36138 (=> (not res!92922) (not e!73826))))

(assert (=> d!36138 (= res!92922 (= (size!2314 (buf!2717 thiss!1305)) (size!2314 (buf!2717 (_2!4886 lt!170854)))))))

(assert (=> d!36138 (= (isPrefixOf!0 thiss!1305 (_2!4886 lt!170854)) e!73826)))

(declare-fun b!112538 () Bool)

(declare-fun res!92920 () Bool)

(assert (=> b!112538 (=> (not res!92920) (not e!73826))))

(assert (=> b!112538 (= res!92920 (bvsle (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170854))) (currentByte!5283 (_2!4886 lt!170854)) (currentBit!5278 (_2!4886 lt!170854)))))))

(declare-fun b!112539 () Bool)

(declare-fun e!73825 () Bool)

(assert (=> b!112539 (= e!73826 e!73825)))

(declare-fun res!92921 () Bool)

(assert (=> b!112539 (=> res!92921 e!73825)))

(assert (=> b!112539 (= res!92921 (= (size!2314 (buf!2717 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112540 () Bool)

(assert (=> b!112540 (= e!73825 (arrayBitRangesEq!0 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!170854)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (= (and d!36138 res!92922) b!112538))

(assert (= (and b!112538 res!92920) b!112539))

(assert (= (and b!112539 (not res!92921)) b!112540))

(assert (=> b!112538 m!166833))

(assert (=> b!112538 m!167609))

(assert (=> b!112540 m!166833))

(assert (=> b!112540 m!166833))

(declare-fun m!168361 () Bool)

(assert (=> b!112540 m!168361))

(assert (=> b!112212 d!36138))

(declare-fun d!36140 () Bool)

(declare-fun res!92925 () Bool)

(declare-fun e!73828 () Bool)

(assert (=> d!36140 (=> (not res!92925) (not e!73828))))

(assert (=> d!36140 (= res!92925 (= (size!2314 (buf!2717 (_1!4888 lt!170838))) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(assert (=> d!36140 (= (isPrefixOf!0 (_1!4888 lt!170838) (_2!4886 lt!169810)) e!73828)))

(declare-fun b!112541 () Bool)

(declare-fun res!92923 () Bool)

(assert (=> b!112541 (=> (not res!92923) (not e!73828))))

(assert (=> b!112541 (= res!92923 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170838))) (currentByte!5283 (_1!4888 lt!170838)) (currentBit!5278 (_1!4888 lt!170838))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(declare-fun b!112542 () Bool)

(declare-fun e!73827 () Bool)

(assert (=> b!112542 (= e!73828 e!73827)))

(declare-fun res!92924 () Bool)

(assert (=> b!112542 (=> res!92924 e!73827)))

(assert (=> b!112542 (= res!92924 (= (size!2314 (buf!2717 (_1!4888 lt!170838))) #b00000000000000000000000000000000))))

(declare-fun b!112543 () Bool)

(assert (=> b!112543 (= e!73827 (arrayBitRangesEq!0 (buf!2717 (_1!4888 lt!170838)) (buf!2717 (_2!4886 lt!169810)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170838))) (currentByte!5283 (_1!4888 lt!170838)) (currentBit!5278 (_1!4888 lt!170838)))))))

(assert (= (and d!36140 res!92925) b!112541))

(assert (= (and b!112541 res!92923) b!112542))

(assert (= (and b!112542 (not res!92924)) b!112543))

(declare-fun m!168363 () Bool)

(assert (=> b!112541 m!168363))

(assert (=> b!112541 m!166841))

(assert (=> b!112543 m!168363))

(assert (=> b!112543 m!168363))

(declare-fun m!168365 () Bool)

(assert (=> b!112543 m!168365))

(assert (=> b!112197 d!36140))

(declare-fun d!36142 () Bool)

(declare-fun e!73829 () Bool)

(assert (=> d!36142 e!73829))

(declare-fun res!92926 () Bool)

(assert (=> d!36142 (=> (not res!92926) (not e!73829))))

(declare-fun lt!171434 () (_ BitVec 64))

(declare-fun lt!171437 () (_ BitVec 64))

(declare-fun lt!171439 () (_ BitVec 64))

(assert (=> d!36142 (= res!92926 (= lt!171437 (bvsub lt!171439 lt!171434)))))

(assert (=> d!36142 (or (= (bvand lt!171439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171434 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171439 lt!171434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36142 (= lt!171434 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170944))) ((_ sign_extend 32) (currentByte!5283 lt!170944)) ((_ sign_extend 32) (currentBit!5278 lt!170944))))))

(declare-fun lt!171438 () (_ BitVec 64))

(declare-fun lt!171436 () (_ BitVec 64))

(assert (=> d!36142 (= lt!171439 (bvmul lt!171438 lt!171436))))

(assert (=> d!36142 (or (= lt!171438 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171436 (bvsdiv (bvmul lt!171438 lt!171436) lt!171438)))))

(assert (=> d!36142 (= lt!171436 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36142 (= lt!171438 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170944))))))

(assert (=> d!36142 (= lt!171437 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 lt!170944)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 lt!170944))))))

(assert (=> d!36142 (invariant!0 (currentBit!5278 lt!170944) (currentByte!5283 lt!170944) (size!2314 (buf!2717 lt!170944)))))

(assert (=> d!36142 (= (bitIndex!0 (size!2314 (buf!2717 lt!170944)) (currentByte!5283 lt!170944) (currentBit!5278 lt!170944)) lt!171437)))

(declare-fun b!112544 () Bool)

(declare-fun res!92927 () Bool)

(assert (=> b!112544 (=> (not res!92927) (not e!73829))))

(assert (=> b!112544 (= res!92927 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171437))))

(declare-fun b!112545 () Bool)

(declare-fun lt!171435 () (_ BitVec 64))

(assert (=> b!112545 (= e!73829 (bvsle lt!171437 (bvmul lt!171435 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112545 (or (= lt!171435 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171435 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171435)))))

(assert (=> b!112545 (= lt!171435 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170944))))))

(assert (= (and d!36142 res!92926) b!112544))

(assert (= (and b!112544 res!92927) b!112545))

(declare-fun m!168367 () Bool)

(assert (=> d!36142 m!168367))

(declare-fun m!168369 () Bool)

(assert (=> d!36142 m!168369))

(assert (=> d!35832 d!36142))

(declare-fun d!36144 () Bool)

(declare-fun e!73830 () Bool)

(assert (=> d!36144 e!73830))

(declare-fun res!92928 () Bool)

(assert (=> d!36144 (=> (not res!92928) (not e!73830))))

(declare-fun lt!171443 () (_ BitVec 64))

(declare-fun lt!171445 () (_ BitVec 64))

(declare-fun lt!171440 () (_ BitVec 64))

(assert (=> d!36144 (= res!92928 (= lt!171443 (bvsub lt!171445 lt!171440)))))

(assert (=> d!36144 (or (= (bvand lt!171445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171440 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171445 lt!171440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36144 (= lt!171440 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169797)))) ((_ sign_extend 32) (currentByte!5283 (_2!4888 lt!169797))) ((_ sign_extend 32) (currentBit!5278 (_2!4888 lt!169797)))))))

(declare-fun lt!171444 () (_ BitVec 64))

(declare-fun lt!171442 () (_ BitVec 64))

(assert (=> d!36144 (= lt!171445 (bvmul lt!171444 lt!171442))))

(assert (=> d!36144 (or (= lt!171444 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171442 (bvsdiv (bvmul lt!171444 lt!171442) lt!171444)))))

(assert (=> d!36144 (= lt!171442 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36144 (= lt!171444 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169797)))))))

(assert (=> d!36144 (= lt!171443 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4888 lt!169797))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4888 lt!169797)))))))

(assert (=> d!36144 (invariant!0 (currentBit!5278 (_2!4888 lt!169797)) (currentByte!5283 (_2!4888 lt!169797)) (size!2314 (buf!2717 (_2!4888 lt!169797))))))

(assert (=> d!36144 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!169797))) (currentByte!5283 (_2!4888 lt!169797)) (currentBit!5278 (_2!4888 lt!169797))) lt!171443)))

(declare-fun b!112546 () Bool)

(declare-fun res!92929 () Bool)

(assert (=> b!112546 (=> (not res!92929) (not e!73830))))

(assert (=> b!112546 (= res!92929 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171443))))

(declare-fun b!112547 () Bool)

(declare-fun lt!171441 () (_ BitVec 64))

(assert (=> b!112547 (= e!73830 (bvsle lt!171443 (bvmul lt!171441 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112547 (or (= lt!171441 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171441 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171441)))))

(assert (=> b!112547 (= lt!171441 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169797)))))))

(assert (= (and d!36144 res!92928) b!112546))

(assert (= (and b!112546 res!92929) b!112547))

(declare-fun m!168371 () Bool)

(assert (=> d!36144 m!168371))

(declare-fun m!168373 () Bool)

(assert (=> d!36144 m!168373))

(assert (=> d!35832 d!36144))

(declare-fun d!36146 () Bool)

(declare-fun lt!171459 () (_ BitVec 32))

(assert (=> d!36146 (= lt!171459 ((_ extract 31 0) (bvsrem (bvsub lt!169802 lt!169788) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171461 () (_ BitVec 32))

(assert (=> d!36146 (= lt!171461 ((_ extract 31 0) (bvsdiv (bvsub lt!169802 lt!169788) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!73835 () Bool)

(assert (=> d!36146 e!73835))

(declare-fun res!92934 () Bool)

(assert (=> d!36146 (=> (not res!92934) (not e!73835))))

(assert (=> d!36146 (= res!92934 (moveBitIndexPrecond!0 (_2!4888 lt!169797) (bvsub lt!169802 lt!169788)))))

(declare-fun Unit!6905 () Unit!6847)

(declare-fun Unit!6906 () Unit!6847)

(declare-fun Unit!6907 () Unit!6847)

(assert (=> d!36146 (= (moveBitIndex!0 (_2!4888 lt!169797) (bvsub lt!169802 lt!169788)) (ite (bvslt (bvadd (currentBit!5278 (_2!4888 lt!169797)) lt!171459) #b00000000000000000000000000000000) (tuple2!9253 Unit!6905 (BitStream!4103 (buf!2717 (_2!4888 lt!169797)) (bvsub (bvadd (currentByte!5283 (_2!4888 lt!169797)) lt!171461) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171459 (currentBit!5278 (_2!4888 lt!169797))))) (ite (bvsge (bvadd (currentBit!5278 (_2!4888 lt!169797)) lt!171459) #b00000000000000000000000000001000) (tuple2!9253 Unit!6906 (BitStream!4103 (buf!2717 (_2!4888 lt!169797)) (bvadd (currentByte!5283 (_2!4888 lt!169797)) lt!171461 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5278 (_2!4888 lt!169797)) lt!171459) #b00000000000000000000000000001000))) (tuple2!9253 Unit!6907 (BitStream!4103 (buf!2717 (_2!4888 lt!169797)) (bvadd (currentByte!5283 (_2!4888 lt!169797)) lt!171461) (bvadd (currentBit!5278 (_2!4888 lt!169797)) lt!171459))))))))

(declare-fun b!112552 () Bool)

(declare-fun e!73836 () Bool)

(assert (=> b!112552 (= e!73835 e!73836)))

(declare-fun res!92935 () Bool)

(assert (=> b!112552 (=> (not res!92935) (not e!73836))))

(declare-fun lt!171462 () (_ BitVec 64))

(declare-fun lt!171458 () tuple2!9252)

(assert (=> b!112552 (= res!92935 (= (bvadd lt!171462 (bvsub lt!169802 lt!169788)) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171458))) (currentByte!5283 (_2!4886 lt!171458)) (currentBit!5278 (_2!4886 lt!171458)))))))

(assert (=> b!112552 (or (not (= (bvand lt!171462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169802 lt!169788) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171462 (bvsub lt!169802 lt!169788)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112552 (= lt!171462 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!169797))) (currentByte!5283 (_2!4888 lt!169797)) (currentBit!5278 (_2!4888 lt!169797))))))

(declare-fun lt!171460 () (_ BitVec 32))

(declare-fun lt!171463 () (_ BitVec 32))

(declare-fun Unit!6908 () Unit!6847)

(declare-fun Unit!6909 () Unit!6847)

(declare-fun Unit!6910 () Unit!6847)

(assert (=> b!112552 (= lt!171458 (ite (bvslt (bvadd (currentBit!5278 (_2!4888 lt!169797)) lt!171460) #b00000000000000000000000000000000) (tuple2!9253 Unit!6908 (BitStream!4103 (buf!2717 (_2!4888 lt!169797)) (bvsub (bvadd (currentByte!5283 (_2!4888 lt!169797)) lt!171463) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171460 (currentBit!5278 (_2!4888 lt!169797))))) (ite (bvsge (bvadd (currentBit!5278 (_2!4888 lt!169797)) lt!171460) #b00000000000000000000000000001000) (tuple2!9253 Unit!6909 (BitStream!4103 (buf!2717 (_2!4888 lt!169797)) (bvadd (currentByte!5283 (_2!4888 lt!169797)) lt!171463 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5278 (_2!4888 lt!169797)) lt!171460) #b00000000000000000000000000001000))) (tuple2!9253 Unit!6910 (BitStream!4103 (buf!2717 (_2!4888 lt!169797)) (bvadd (currentByte!5283 (_2!4888 lt!169797)) lt!171463) (bvadd (currentBit!5278 (_2!4888 lt!169797)) lt!171460))))))))

(assert (=> b!112552 (= lt!171460 ((_ extract 31 0) (bvsrem (bvsub lt!169802 lt!169788) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112552 (= lt!171463 ((_ extract 31 0) (bvsdiv (bvsub lt!169802 lt!169788) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!112553 () Bool)

(assert (=> b!112553 (= e!73836 (and (= (size!2314 (buf!2717 (_2!4888 lt!169797))) (size!2314 (buf!2717 (_2!4886 lt!171458)))) (= (buf!2717 (_2!4888 lt!169797)) (buf!2717 (_2!4886 lt!171458)))))))

(assert (= (and d!36146 res!92934) b!112552))

(assert (= (and b!112552 res!92935) b!112553))

(assert (=> d!36146 m!167699))

(declare-fun m!168375 () Bool)

(assert (=> b!112552 m!168375))

(assert (=> b!112552 m!167695))

(assert (=> d!35832 d!36146))

(declare-fun d!36150 () Bool)

(declare-fun res!92938 () Bool)

(declare-fun e!73839 () Bool)

(assert (=> d!36150 (=> (not res!92938) (not e!73839))))

(assert (=> d!36150 (= res!92938 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169797))))) (bvsub lt!169802 lt!169788)) (bvsle (bvsub lt!169802 lt!169788) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169797))))))))))

(assert (=> d!36150 (= (moveBitIndexPrecond!0 (_2!4888 lt!169797) (bvsub lt!169802 lt!169788)) e!73839)))

(declare-fun b!112557 () Bool)

(declare-fun lt!171466 () (_ BitVec 64))

(assert (=> b!112557 (= e!73839 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171466) (bvsle lt!171466 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169797))))))))))

(assert (=> b!112557 (= lt!171466 (bvadd (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!169797))) (currentByte!5283 (_2!4888 lt!169797)) (currentBit!5278 (_2!4888 lt!169797))) (bvsub lt!169802 lt!169788)))))

(assert (= (and d!36150 res!92938) b!112557))

(assert (=> b!112557 m!167695))

(assert (=> d!35832 d!36150))

(declare-fun d!36152 () Bool)

(declare-fun e!73840 () Bool)

(assert (=> d!36152 e!73840))

(declare-fun res!92939 () Bool)

(assert (=> d!36152 (=> (not res!92939) (not e!73840))))

(declare-fun lt!171472 () (_ BitVec 64))

(declare-fun lt!171470 () (_ BitVec 64))

(declare-fun lt!171467 () (_ BitVec 64))

(assert (=> d!36152 (= res!92939 (= lt!171470 (bvsub lt!171472 lt!171467)))))

(assert (=> d!36152 (or (= (bvand lt!171472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171472 lt!171467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36152 (= lt!171467 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170954))) ((_ sign_extend 32) (currentByte!5283 lt!170954)) ((_ sign_extend 32) (currentBit!5278 lt!170954))))))

(declare-fun lt!171471 () (_ BitVec 64))

(declare-fun lt!171469 () (_ BitVec 64))

(assert (=> d!36152 (= lt!171472 (bvmul lt!171471 lt!171469))))

(assert (=> d!36152 (or (= lt!171471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171469 (bvsdiv (bvmul lt!171471 lt!171469) lt!171471)))))

(assert (=> d!36152 (= lt!171469 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36152 (= lt!171471 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170954))))))

(assert (=> d!36152 (= lt!171470 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 lt!170954)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 lt!170954))))))

(assert (=> d!36152 (invariant!0 (currentBit!5278 lt!170954) (currentByte!5283 lt!170954) (size!2314 (buf!2717 lt!170954)))))

(assert (=> d!36152 (= (bitIndex!0 (size!2314 (buf!2717 lt!170954)) (currentByte!5283 lt!170954) (currentBit!5278 lt!170954)) lt!171470)))

(declare-fun b!112558 () Bool)

(declare-fun res!92940 () Bool)

(assert (=> b!112558 (=> (not res!92940) (not e!73840))))

(assert (=> b!112558 (= res!92940 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171470))))

(declare-fun b!112559 () Bool)

(declare-fun lt!171468 () (_ BitVec 64))

(assert (=> b!112559 (= e!73840 (bvsle lt!171470 (bvmul lt!171468 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112559 (or (= lt!171468 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171468 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171468)))))

(assert (=> b!112559 (= lt!171468 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170954))))))

(assert (= (and d!36152 res!92939) b!112558))

(assert (= (and b!112558 res!92940) b!112559))

(declare-fun m!168377 () Bool)

(assert (=> d!36152 m!168377))

(declare-fun m!168379 () Bool)

(assert (=> d!36152 m!168379))

(assert (=> d!35838 d!36152))

(declare-fun d!36154 () Bool)

(declare-fun e!73841 () Bool)

(assert (=> d!36154 e!73841))

(declare-fun res!92941 () Bool)

(assert (=> d!36154 (=> (not res!92941) (not e!73841))))

(declare-fun lt!171473 () (_ BitVec 64))

(declare-fun lt!171478 () (_ BitVec 64))

(declare-fun lt!171476 () (_ BitVec 64))

(assert (=> d!36154 (= res!92941 (= lt!171476 (bvsub lt!171478 lt!171473)))))

(assert (=> d!36154 (or (= (bvand lt!171478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171478 lt!171473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36154 (= lt!171473 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169806)))) ((_ sign_extend 32) (currentByte!5283 (_2!4888 lt!169806))) ((_ sign_extend 32) (currentBit!5278 (_2!4888 lt!169806)))))))

(declare-fun lt!171477 () (_ BitVec 64))

(declare-fun lt!171475 () (_ BitVec 64))

(assert (=> d!36154 (= lt!171478 (bvmul lt!171477 lt!171475))))

(assert (=> d!36154 (or (= lt!171477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171475 (bvsdiv (bvmul lt!171477 lt!171475) lt!171477)))))

(assert (=> d!36154 (= lt!171475 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36154 (= lt!171477 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169806)))))))

(assert (=> d!36154 (= lt!171476 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4888 lt!169806))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4888 lt!169806)))))))

(assert (=> d!36154 (invariant!0 (currentBit!5278 (_2!4888 lt!169806)) (currentByte!5283 (_2!4888 lt!169806)) (size!2314 (buf!2717 (_2!4888 lt!169806))))))

(assert (=> d!36154 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!169806))) (currentByte!5283 (_2!4888 lt!169806)) (currentBit!5278 (_2!4888 lt!169806))) lt!171476)))

(declare-fun b!112560 () Bool)

(declare-fun res!92942 () Bool)

(assert (=> b!112560 (=> (not res!92942) (not e!73841))))

(assert (=> b!112560 (= res!92942 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171476))))

(declare-fun b!112561 () Bool)

(declare-fun lt!171474 () (_ BitVec 64))

(assert (=> b!112561 (= e!73841 (bvsle lt!171476 (bvmul lt!171474 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112561 (or (= lt!171474 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171474 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171474)))))

(assert (=> b!112561 (= lt!171474 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169806)))))))

(assert (= (and d!36154 res!92941) b!112560))

(assert (= (and b!112560 res!92942) b!112561))

(declare-fun m!168381 () Bool)

(assert (=> d!36154 m!168381))

(declare-fun m!168383 () Bool)

(assert (=> d!36154 m!168383))

(assert (=> d!35838 d!36154))

(declare-fun d!36156 () Bool)

(declare-fun lt!171480 () (_ BitVec 32))

(assert (=> d!36156 (= lt!171480 ((_ extract 31 0) (bvsrem (bvsub lt!169799 lt!169788) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171482 () (_ BitVec 32))

(assert (=> d!36156 (= lt!171482 ((_ extract 31 0) (bvsdiv (bvsub lt!169799 lt!169788) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!73842 () Bool)

(assert (=> d!36156 e!73842))

(declare-fun res!92943 () Bool)

(assert (=> d!36156 (=> (not res!92943) (not e!73842))))

(assert (=> d!36156 (= res!92943 (moveBitIndexPrecond!0 (_2!4888 lt!169806) (bvsub lt!169799 lt!169788)))))

(declare-fun Unit!6911 () Unit!6847)

(declare-fun Unit!6912 () Unit!6847)

(declare-fun Unit!6913 () Unit!6847)

(assert (=> d!36156 (= (moveBitIndex!0 (_2!4888 lt!169806) (bvsub lt!169799 lt!169788)) (ite (bvslt (bvadd (currentBit!5278 (_2!4888 lt!169806)) lt!171480) #b00000000000000000000000000000000) (tuple2!9253 Unit!6911 (BitStream!4103 (buf!2717 (_2!4888 lt!169806)) (bvsub (bvadd (currentByte!5283 (_2!4888 lt!169806)) lt!171482) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171480 (currentBit!5278 (_2!4888 lt!169806))))) (ite (bvsge (bvadd (currentBit!5278 (_2!4888 lt!169806)) lt!171480) #b00000000000000000000000000001000) (tuple2!9253 Unit!6912 (BitStream!4103 (buf!2717 (_2!4888 lt!169806)) (bvadd (currentByte!5283 (_2!4888 lt!169806)) lt!171482 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5278 (_2!4888 lt!169806)) lt!171480) #b00000000000000000000000000001000))) (tuple2!9253 Unit!6913 (BitStream!4103 (buf!2717 (_2!4888 lt!169806)) (bvadd (currentByte!5283 (_2!4888 lt!169806)) lt!171482) (bvadd (currentBit!5278 (_2!4888 lt!169806)) lt!171480))))))))

(declare-fun b!112562 () Bool)

(declare-fun e!73843 () Bool)

(assert (=> b!112562 (= e!73842 e!73843)))

(declare-fun res!92944 () Bool)

(assert (=> b!112562 (=> (not res!92944) (not e!73843))))

(declare-fun lt!171479 () tuple2!9252)

(declare-fun lt!171483 () (_ BitVec 64))

(assert (=> b!112562 (= res!92944 (= (bvadd lt!171483 (bvsub lt!169799 lt!169788)) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171479))) (currentByte!5283 (_2!4886 lt!171479)) (currentBit!5278 (_2!4886 lt!171479)))))))

(assert (=> b!112562 (or (not (= (bvand lt!171483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169799 lt!169788) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171483 (bvsub lt!169799 lt!169788)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112562 (= lt!171483 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!169806))) (currentByte!5283 (_2!4888 lt!169806)) (currentBit!5278 (_2!4888 lt!169806))))))

(declare-fun lt!171481 () (_ BitVec 32))

(declare-fun lt!171484 () (_ BitVec 32))

(declare-fun Unit!6914 () Unit!6847)

(declare-fun Unit!6915 () Unit!6847)

(declare-fun Unit!6916 () Unit!6847)

(assert (=> b!112562 (= lt!171479 (ite (bvslt (bvadd (currentBit!5278 (_2!4888 lt!169806)) lt!171481) #b00000000000000000000000000000000) (tuple2!9253 Unit!6914 (BitStream!4103 (buf!2717 (_2!4888 lt!169806)) (bvsub (bvadd (currentByte!5283 (_2!4888 lt!169806)) lt!171484) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171481 (currentBit!5278 (_2!4888 lt!169806))))) (ite (bvsge (bvadd (currentBit!5278 (_2!4888 lt!169806)) lt!171481) #b00000000000000000000000000001000) (tuple2!9253 Unit!6915 (BitStream!4103 (buf!2717 (_2!4888 lt!169806)) (bvadd (currentByte!5283 (_2!4888 lt!169806)) lt!171484 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5278 (_2!4888 lt!169806)) lt!171481) #b00000000000000000000000000001000))) (tuple2!9253 Unit!6916 (BitStream!4103 (buf!2717 (_2!4888 lt!169806)) (bvadd (currentByte!5283 (_2!4888 lt!169806)) lt!171484) (bvadd (currentBit!5278 (_2!4888 lt!169806)) lt!171481))))))))

(assert (=> b!112562 (= lt!171481 ((_ extract 31 0) (bvsrem (bvsub lt!169799 lt!169788) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112562 (= lt!171484 ((_ extract 31 0) (bvsdiv (bvsub lt!169799 lt!169788) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!112563 () Bool)

(assert (=> b!112563 (= e!73843 (and (= (size!2314 (buf!2717 (_2!4888 lt!169806))) (size!2314 (buf!2717 (_2!4886 lt!171479)))) (= (buf!2717 (_2!4888 lt!169806)) (buf!2717 (_2!4886 lt!171479)))))))

(assert (= (and d!36156 res!92943) b!112562))

(assert (= (and b!112562 res!92944) b!112563))

(assert (=> d!36156 m!167719))

(declare-fun m!168385 () Bool)

(assert (=> b!112562 m!168385))

(assert (=> b!112562 m!167715))

(assert (=> d!35838 d!36156))

(declare-fun d!36158 () Bool)

(declare-fun res!92945 () Bool)

(declare-fun e!73844 () Bool)

(assert (=> d!36158 (=> (not res!92945) (not e!73844))))

(assert (=> d!36158 (= res!92945 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169806))))) (bvsub lt!169799 lt!169788)) (bvsle (bvsub lt!169799 lt!169788) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169806))))))))))

(assert (=> d!36158 (= (moveBitIndexPrecond!0 (_2!4888 lt!169806) (bvsub lt!169799 lt!169788)) e!73844)))

(declare-fun b!112564 () Bool)

(declare-fun lt!171485 () (_ BitVec 64))

(assert (=> b!112564 (= e!73844 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171485) (bvsle lt!171485 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4888 lt!169806))))))))))

(assert (=> b!112564 (= lt!171485 (bvadd (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!169806))) (currentByte!5283 (_2!4888 lt!169806)) (currentBit!5278 (_2!4888 lt!169806))) (bvsub lt!169799 lt!169788)))))

(assert (= (and d!36158 res!92945) b!112564))

(assert (=> b!112564 m!167715))

(assert (=> d!35838 d!36158))

(declare-fun d!36160 () Bool)

(assert (=> d!36160 (= (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169801)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169801))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169801)))) (bvsub (bvmul ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169801)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169801))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169801))))))))

(assert (=> d!35816 d!36160))

(declare-fun d!36162 () Bool)

(assert (=> d!36162 (= (invariant!0 (currentBit!5278 (_1!4887 lt!169801)) (currentByte!5283 (_1!4887 lt!169801)) (size!2314 (buf!2717 (_1!4887 lt!169801)))) (and (bvsge (currentBit!5278 (_1!4887 lt!169801)) #b00000000000000000000000000000000) (bvslt (currentBit!5278 (_1!4887 lt!169801)) #b00000000000000000000000000001000) (bvsge (currentByte!5283 (_1!4887 lt!169801)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 (_1!4887 lt!169801)) (size!2314 (buf!2717 (_1!4887 lt!169801)))) (and (= (currentBit!5278 (_1!4887 lt!169801)) #b00000000000000000000000000000000) (= (currentByte!5283 (_1!4887 lt!169801)) (size!2314 (buf!2717 (_1!4887 lt!169801))))))))))

(assert (=> d!35816 d!36162))

(declare-fun d!36164 () Bool)

(assert (=> d!36164 (= (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 thiss!1305))) (and (bvsge (currentBit!5278 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5278 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5283 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 thiss!1305) (size!2314 (buf!2717 thiss!1305))) (and (= (currentBit!5278 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5283 thiss!1305) (size!2314 (buf!2717 thiss!1305)))))))))

(assert (=> d!35860 d!36164))

(declare-fun d!36166 () Bool)

(declare-fun res!92948 () Bool)

(declare-fun e!73846 () Bool)

(assert (=> d!36166 (=> (not res!92948) (not e!73846))))

(assert (=> d!36166 (= res!92948 (= (size!2314 (buf!2717 (_1!4888 lt!170921))) (size!2314 (buf!2717 thiss!1305))))))

(assert (=> d!36166 (= (isPrefixOf!0 (_1!4888 lt!170921) thiss!1305) e!73846)))

(declare-fun b!112565 () Bool)

(declare-fun res!92946 () Bool)

(assert (=> b!112565 (=> (not res!92946) (not e!73846))))

(assert (=> b!112565 (= res!92946 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170921))) (currentByte!5283 (_1!4888 lt!170921)) (currentBit!5278 (_1!4888 lt!170921))) (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(declare-fun b!112566 () Bool)

(declare-fun e!73845 () Bool)

(assert (=> b!112566 (= e!73846 e!73845)))

(declare-fun res!92947 () Bool)

(assert (=> b!112566 (=> res!92947 e!73845)))

(assert (=> b!112566 (= res!92947 (= (size!2314 (buf!2717 (_1!4888 lt!170921))) #b00000000000000000000000000000000))))

(declare-fun b!112567 () Bool)

(assert (=> b!112567 (= e!73845 (arrayBitRangesEq!0 (buf!2717 (_1!4888 lt!170921)) (buf!2717 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170921))) (currentByte!5283 (_1!4888 lt!170921)) (currentBit!5278 (_1!4888 lt!170921)))))))

(assert (= (and d!36166 res!92948) b!112565))

(assert (= (and b!112565 res!92946) b!112566))

(assert (= (and b!112566 (not res!92947)) b!112567))

(declare-fun m!168387 () Bool)

(assert (=> b!112565 m!168387))

(assert (=> b!112565 m!166833))

(assert (=> b!112567 m!168387))

(assert (=> b!112567 m!168387))

(declare-fun m!168389 () Bool)

(assert (=> b!112567 m!168389))

(assert (=> b!112235 d!36166))

(declare-fun d!36168 () Bool)

(declare-fun e!73847 () Bool)

(assert (=> d!36168 e!73847))

(declare-fun res!92949 () Bool)

(assert (=> d!36168 (=> (not res!92949) (not e!73847))))

(declare-fun lt!171489 () (_ BitVec 64))

(declare-fun lt!171491 () (_ BitVec 64))

(declare-fun lt!171486 () (_ BitVec 64))

(assert (=> d!36168 (= res!92949 (= lt!171489 (bvsub lt!171491 lt!171486)))))

(assert (=> d!36168 (or (= (bvand lt!171491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171486 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171491 lt!171486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36168 (= lt!171486 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170766)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170766))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170766)))))))

(declare-fun lt!171490 () (_ BitVec 64))

(declare-fun lt!171488 () (_ BitVec 64))

(assert (=> d!36168 (= lt!171491 (bvmul lt!171490 lt!171488))))

(assert (=> d!36168 (or (= lt!171490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171488 (bvsdiv (bvmul lt!171490 lt!171488) lt!171490)))))

(assert (=> d!36168 (= lt!171488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36168 (= lt!171490 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170766)))))))

(assert (=> d!36168 (= lt!171489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170766))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170766)))))))

(assert (=> d!36168 (invariant!0 (currentBit!5278 (_2!4886 lt!170766)) (currentByte!5283 (_2!4886 lt!170766)) (size!2314 (buf!2717 (_2!4886 lt!170766))))))

(assert (=> d!36168 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170766))) (currentByte!5283 (_2!4886 lt!170766)) (currentBit!5278 (_2!4886 lt!170766))) lt!171489)))

(declare-fun b!112568 () Bool)

(declare-fun res!92950 () Bool)

(assert (=> b!112568 (=> (not res!92950) (not e!73847))))

(assert (=> b!112568 (= res!92950 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171489))))

(declare-fun b!112569 () Bool)

(declare-fun lt!171487 () (_ BitVec 64))

(assert (=> b!112569 (= e!73847 (bvsle lt!171489 (bvmul lt!171487 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112569 (or (= lt!171487 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171487 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171487)))))

(assert (=> b!112569 (= lt!171487 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170766)))))))

(assert (= (and d!36168 res!92949) b!112568))

(assert (= (and b!112568 res!92950) b!112569))

(declare-fun m!168391 () Bool)

(assert (=> d!36168 m!168391))

(declare-fun m!168393 () Bool)

(assert (=> d!36168 m!168393))

(assert (=> b!112178 d!36168))

(assert (=> b!112178 d!35828))

(declare-fun d!36170 () Bool)

(assert (=> d!36170 (= (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169792)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169792))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169792)))) (bvsub (bvmul ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169792)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169792))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169792))))))))

(assert (=> d!35814 d!36170))

(declare-fun d!36172 () Bool)

(assert (=> d!36172 (= (invariant!0 (currentBit!5278 (_1!4887 lt!169792)) (currentByte!5283 (_1!4887 lt!169792)) (size!2314 (buf!2717 (_1!4887 lt!169792)))) (and (bvsge (currentBit!5278 (_1!4887 lt!169792)) #b00000000000000000000000000000000) (bvslt (currentBit!5278 (_1!4887 lt!169792)) #b00000000000000000000000000001000) (bvsge (currentByte!5283 (_1!4887 lt!169792)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 (_1!4887 lt!169792)) (size!2314 (buf!2717 (_1!4887 lt!169792)))) (and (= (currentBit!5278 (_1!4887 lt!169792)) #b00000000000000000000000000000000) (= (currentByte!5283 (_1!4887 lt!169792)) (size!2314 (buf!2717 (_1!4887 lt!169792))))))))))

(assert (=> d!35814 d!36172))

(assert (=> b!112200 d!35828))

(declare-fun d!36174 () Bool)

(assert (=> d!36174 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169807)) (buf!2717 (_2!4886 lt!169810)) lt!170841 lt!170825)))

(declare-fun lt!171494 () Unit!6847)

(declare-fun choose!8 (array!5090 array!5090 (_ BitVec 64) (_ BitVec 64)) Unit!6847)

(assert (=> d!36174 (= lt!171494 (choose!8 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!169807)) lt!170841 lt!170825))))

(assert (=> d!36174 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170841) (bvsle lt!170841 lt!170825))))

(assert (=> d!36174 (= (arrayBitRangesEqSymmetric!0 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!169807)) lt!170841 lt!170825) lt!171494)))

(declare-fun bs!8787 () Bool)

(assert (= bs!8787 d!36174))

(assert (=> bs!8787 m!167575))

(declare-fun m!168395 () Bool)

(assert (=> bs!8787 m!168395))

(assert (=> b!112200 d!36174))

(declare-datatypes ((tuple4!80 0))(
  ( (tuple4!81 (_1!4905 (_ BitVec 32)) (_2!4905 (_ BitVec 32)) (_3!261 (_ BitVec 32)) (_4!40 (_ BitVec 32))) )
))
(declare-fun lt!171501 () tuple4!80)

(declare-fun b!112584 () Bool)

(declare-fun e!73863 () Bool)

(declare-fun arrayRangesEq!41 (array!5090 array!5090 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!112584 (= e!73863 (arrayRangesEq!41 (buf!2717 (_2!4886 lt!169807)) (buf!2717 (_2!4886 lt!169810)) (_1!4905 lt!171501) (_2!4905 lt!171501)))))

(declare-fun lt!171502 () (_ BitVec 32))

(declare-fun bm!1432 () Bool)

(declare-fun lt!171503 () (_ BitVec 32))

(declare-fun call!1435 () Bool)

(declare-fun c!6859 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1432 (= call!1435 (byteRangesEq!0 (ite c!6859 (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_3!261 lt!171501)) (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_4!40 lt!171501))) (ite c!6859 (select (arr!2907 (buf!2717 (_2!4886 lt!169810))) (_3!261 lt!171501)) (select (arr!2907 (buf!2717 (_2!4886 lt!169810))) (_4!40 lt!171501))) (ite c!6859 lt!171502 #b00000000000000000000000000000000) lt!171503))))

(declare-fun b!112586 () Bool)

(declare-fun e!73862 () Bool)

(declare-fun e!73860 () Bool)

(assert (=> b!112586 (= e!73862 e!73860)))

(declare-fun res!92965 () Bool)

(assert (=> b!112586 (= res!92965 (byteRangesEq!0 (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_3!261 lt!171501)) (select (arr!2907 (buf!2717 (_2!4886 lt!169810))) (_3!261 lt!171501)) lt!171502 #b00000000000000000000000000001000))))

(assert (=> b!112586 (=> (not res!92965) (not e!73860))))

(declare-fun d!36176 () Bool)

(declare-fun res!92964 () Bool)

(declare-fun e!73864 () Bool)

(assert (=> d!36176 (=> res!92964 e!73864)))

(assert (=> d!36176 (= res!92964 (bvsge lt!170841 lt!170825))))

(assert (=> d!36176 (= (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169807)) (buf!2717 (_2!4886 lt!169810)) lt!170841 lt!170825) e!73864)))

(declare-fun b!112585 () Bool)

(assert (=> b!112585 (= e!73862 call!1435)))

(declare-fun b!112587 () Bool)

(declare-fun e!73865 () Bool)

(assert (=> b!112587 (= e!73864 e!73865)))

(declare-fun res!92962 () Bool)

(assert (=> b!112587 (=> (not res!92962) (not e!73865))))

(assert (=> b!112587 (= res!92962 e!73863)))

(declare-fun res!92963 () Bool)

(assert (=> b!112587 (=> res!92963 e!73863)))

(assert (=> b!112587 (= res!92963 (bvsge (_1!4905 lt!171501) (_2!4905 lt!171501)))))

(assert (=> b!112587 (= lt!171503 ((_ extract 31 0) (bvsrem lt!170825 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112587 (= lt!171502 ((_ extract 31 0) (bvsrem lt!170841 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!80)

(assert (=> b!112587 (= lt!171501 (arrayBitIndices!0 lt!170841 lt!170825))))

(declare-fun b!112588 () Bool)

(declare-fun res!92961 () Bool)

(assert (=> b!112588 (= res!92961 (= lt!171503 #b00000000000000000000000000000000))))

(declare-fun e!73861 () Bool)

(assert (=> b!112588 (=> res!92961 e!73861)))

(assert (=> b!112588 (= e!73860 e!73861)))

(declare-fun b!112589 () Bool)

(assert (=> b!112589 (= e!73865 e!73862)))

(assert (=> b!112589 (= c!6859 (= (_3!261 lt!171501) (_4!40 lt!171501)))))

(declare-fun b!112590 () Bool)

(assert (=> b!112590 (= e!73861 call!1435)))

(assert (= (and d!36176 (not res!92964)) b!112587))

(assert (= (and b!112587 (not res!92963)) b!112584))

(assert (= (and b!112587 res!92962) b!112589))

(assert (= (and b!112589 c!6859) b!112585))

(assert (= (and b!112589 (not c!6859)) b!112586))

(assert (= (and b!112586 res!92965) b!112588))

(assert (= (and b!112588 (not res!92961)) b!112590))

(assert (= (or b!112585 b!112590) bm!1432))

(declare-fun m!168397 () Bool)

(assert (=> b!112584 m!168397))

(declare-fun m!168399 () Bool)

(assert (=> bm!1432 m!168399))

(declare-fun m!168401 () Bool)

(assert (=> bm!1432 m!168401))

(declare-fun m!168403 () Bool)

(assert (=> bm!1432 m!168403))

(declare-fun m!168405 () Bool)

(assert (=> bm!1432 m!168405))

(declare-fun m!168407 () Bool)

(assert (=> bm!1432 m!168407))

(assert (=> b!112586 m!168399))

(assert (=> b!112586 m!168401))

(assert (=> b!112586 m!168399))

(assert (=> b!112586 m!168401))

(declare-fun m!168409 () Bool)

(assert (=> b!112586 m!168409))

(declare-fun m!168411 () Bool)

(assert (=> b!112587 m!168411))

(assert (=> b!112200 d!36176))

(declare-fun d!36178 () Bool)

(declare-fun e!73872 () Bool)

(assert (=> d!36178 e!73872))

(declare-fun res!92968 () Bool)

(assert (=> d!36178 (=> (not res!92968) (not e!73872))))

(declare-fun increaseBitIndex!0 (BitStream!4102) tuple2!9252)

(assert (=> d!36178 (= res!92968 (= (buf!2717 (_2!4886 (increaseBitIndex!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))) (buf!2717 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))))

(declare-fun lt!171521 () Bool)

(assert (=> d!36178 (= lt!171521 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))) (currentByte!5283 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171519 () tuple2!9284)

(assert (=> d!36178 (= lt!171519 (tuple2!9285 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))) (currentByte!5283 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4886 (increaseBitIndex!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))))))

(assert (=> d!36178 (validate_offset_bit!0 ((_ sign_extend 32) (size!2314 (buf!2717 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))) ((_ sign_extend 32) (currentByte!5283 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))) ((_ sign_extend 32) (currentBit!5278 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))))

(assert (=> d!36178 (= (readBit!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))) lt!171519)))

(declare-fun lt!171522 () (_ BitVec 64))

(declare-fun b!112593 () Bool)

(declare-fun lt!171520 () (_ BitVec 64))

(assert (=> b!112593 (= e!73872 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 (increaseBitIndex!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))) (currentByte!5283 (_2!4886 (increaseBitIndex!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))) (currentBit!5278 (_2!4886 (increaseBitIndex!0 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))) (bvadd lt!171522 lt!171520)))))

(assert (=> b!112593 (or (not (= (bvand lt!171522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171520 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171522 lt!171520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112593 (= lt!171520 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112593 (= lt!171522 (bitIndex!0 (size!2314 (buf!2717 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))) (currentByte!5283 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))) (currentBit!5278 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))))

(declare-fun lt!171518 () Bool)

(assert (=> b!112593 (= lt!171518 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))) (currentByte!5283 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171523 () Bool)

(assert (=> b!112593 (= lt!171523 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))) (currentByte!5283 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171524 () Bool)

(assert (=> b!112593 (= lt!171524 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))) (currentByte!5283 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (readerFrom!0 (_2!4886 lt!169810) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!36178 res!92968) b!112593))

(assert (=> d!36178 m!166851))

(declare-fun m!168413 () Bool)

(assert (=> d!36178 m!168413))

(declare-fun m!168415 () Bool)

(assert (=> d!36178 m!168415))

(declare-fun m!168417 () Bool)

(assert (=> d!36178 m!168417))

(declare-fun m!168419 () Bool)

(assert (=> d!36178 m!168419))

(declare-fun m!168421 () Bool)

(assert (=> b!112593 m!168421))

(declare-fun m!168423 () Bool)

(assert (=> b!112593 m!168423))

(assert (=> b!112593 m!166851))

(assert (=> b!112593 m!168413))

(assert (=> b!112593 m!168417))

(assert (=> b!112593 m!168415))

(assert (=> d!35856 d!36178))

(assert (=> b!112258 d!35826))

(declare-fun b!112608 () Bool)

(declare-fun res!92980 () Bool)

(declare-fun e!73879 () Bool)

(assert (=> b!112608 (=> (not res!92980) (not e!73879))))

(declare-fun lt!171548 () (_ BitVec 64))

(declare-fun lt!171543 () tuple2!9286)

(declare-fun lt!171545 () (_ BitVec 64))

(assert (=> b!112608 (= res!92980 (= (bvlshr (_1!4903 lt!171543) lt!171545) (bvlshr lt!169808 lt!171548)))))

(assert (=> b!112608 (and (bvsge lt!171548 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171548 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112608 (= lt!171548 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112608 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112608 (and (bvsge lt!171545 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171545 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112608 (= lt!171545 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112608 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!112609 () Bool)

(declare-fun e!73881 () Bool)

(assert (=> b!112609 (= e!73879 e!73881)))

(declare-fun res!92983 () Bool)

(assert (=> b!112609 (=> res!92983 e!73881)))

(assert (=> b!112609 (= res!92983 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!112610 () Bool)

(declare-fun e!73880 () tuple2!9286)

(assert (=> b!112610 (= e!73880 (tuple2!9287 lt!169808 (_1!4888 lt!169806)))))

(declare-fun lt!171544 () (_ BitVec 64))

(declare-fun b!112611 () Bool)

(assert (=> b!112611 (= e!73881 (= (= (bvand (bvlshr (_1!4903 lt!171543) lt!171544) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4887 (readBitPure!0 (_1!4888 lt!169806)))))))

(assert (=> b!112611 (and (bvsge lt!171544 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171544 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!171549 () (_ BitVec 32))

(assert (=> b!112611 (= lt!171544 ((_ sign_extend 32) (bvsub lt!171549 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112611 (or (= (bvand lt!171549 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!171549 #b10000000000000000000000000000000) (bvand (bvsub lt!171549 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112611 (= lt!171549 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!112611 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!112612 () Bool)

(declare-fun lt!171546 () tuple2!9286)

(assert (=> b!112612 (= e!73880 (tuple2!9287 (_1!4903 lt!171546) (_2!4903 lt!171546)))))

(declare-fun lt!171547 () tuple2!9284)

(assert (=> b!112612 (= lt!171547 (readBit!0 (_1!4888 lt!169806)))))

(assert (=> b!112612 (= lt!171546 (readNLeastSignificantBitsLoop!0 (_2!4902 lt!171547) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!169808 (ite (_1!4902 lt!171547) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112613 () Bool)

(declare-fun res!92981 () Bool)

(assert (=> b!112613 (=> (not res!92981) (not e!73879))))

(assert (=> b!112613 (= res!92981 (= (bvand (_1!4903 lt!171543) (onesLSBLong!0 nBits!396)) (_1!4903 lt!171543)))))

(declare-fun b!112614 () Bool)

(declare-fun res!92979 () Bool)

(assert (=> b!112614 (=> (not res!92979) (not e!73879))))

(declare-fun lt!171551 () (_ BitVec 64))

(declare-fun lt!171550 () (_ BitVec 64))

(assert (=> b!112614 (= res!92979 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4903 lt!171543))) (currentByte!5283 (_2!4903 lt!171543)) (currentBit!5278 (_2!4903 lt!171543))) (bvadd lt!171551 lt!171550)))))

(assert (=> b!112614 (or (not (= (bvand lt!171551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171550 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171551 lt!171550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112614 (= lt!171550 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112614 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112614 (= lt!171551 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!169806))) (currentByte!5283 (_1!4888 lt!169806)) (currentBit!5278 (_1!4888 lt!169806))))))

(declare-fun d!36180 () Bool)

(assert (=> d!36180 e!73879))

(declare-fun res!92982 () Bool)

(assert (=> d!36180 (=> (not res!92982) (not e!73879))))

(assert (=> d!36180 (= res!92982 (= (buf!2717 (_2!4903 lt!171543)) (buf!2717 (_1!4888 lt!169806))))))

(assert (=> d!36180 (= lt!171543 e!73880)))

(declare-fun c!6862 () Bool)

(assert (=> d!36180 (= c!6862 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!36180 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36180 (= (readNLeastSignificantBitsLoop!0 (_1!4888 lt!169806) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169808) lt!171543)))

(assert (= (and d!36180 c!6862) b!112610))

(assert (= (and d!36180 (not c!6862)) b!112612))

(assert (= (and d!36180 res!92982) b!112614))

(assert (= (and b!112614 res!92979) b!112608))

(assert (= (and b!112608 res!92980) b!112613))

(assert (= (and b!112613 res!92981) b!112609))

(assert (= (and b!112609 (not res!92983)) b!112611))

(declare-fun m!168425 () Bool)

(assert (=> b!112611 m!168425))

(declare-fun m!168427 () Bool)

(assert (=> b!112612 m!168427))

(declare-fun m!168429 () Bool)

(assert (=> b!112612 m!168429))

(assert (=> b!112613 m!166847))

(declare-fun m!168431 () Bool)

(assert (=> b!112614 m!168431))

(declare-fun m!168433 () Bool)

(assert (=> b!112614 m!168433))

(assert (=> d!35818 d!36180))

(declare-fun d!36182 () Bool)

(declare-fun lt!171552 () tuple2!9284)

(assert (=> d!36182 (= lt!171552 (readBit!0 (readerFrom!0 (_2!4886 lt!170854) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))))))

(assert (=> d!36182 (= (readBitPure!0 (readerFrom!0 (_2!4886 lt!170854) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305))) (tuple2!9255 (_2!4902 lt!171552) (_1!4902 lt!171552)))))

(declare-fun bs!8788 () Bool)

(assert (= bs!8788 d!36182))

(assert (=> bs!8788 m!167611))

(declare-fun m!168435 () Bool)

(assert (=> bs!8788 m!168435))

(assert (=> b!112213 d!36182))

(declare-fun d!36184 () Bool)

(declare-fun e!73882 () Bool)

(assert (=> d!36184 e!73882))

(declare-fun res!92984 () Bool)

(assert (=> d!36184 (=> (not res!92984) (not e!73882))))

(assert (=> d!36184 (= res!92984 (invariant!0 (currentBit!5278 (_2!4886 lt!170854)) (currentByte!5283 (_2!4886 lt!170854)) (size!2314 (buf!2717 (_2!4886 lt!170854)))))))

(assert (=> d!36184 (= (readerFrom!0 (_2!4886 lt!170854) (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305)) (BitStream!4103 (buf!2717 (_2!4886 lt!170854)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))

(declare-fun b!112615 () Bool)

(assert (=> b!112615 (= e!73882 (invariant!0 (currentBit!5278 thiss!1305) (currentByte!5283 thiss!1305) (size!2314 (buf!2717 (_2!4886 lt!170854)))))))

(assert (= (and d!36184 res!92984) b!112615))

(declare-fun m!168437 () Bool)

(assert (=> d!36184 m!168437))

(declare-fun m!168439 () Bool)

(assert (=> b!112615 m!168439))

(assert (=> b!112213 d!36184))

(declare-fun d!36186 () Bool)

(declare-fun e!73883 () Bool)

(assert (=> d!36186 e!73883))

(declare-fun res!92985 () Bool)

(assert (=> d!36186 (=> (not res!92985) (not e!73883))))

(declare-fun lt!171556 () (_ BitVec 64))

(declare-fun lt!171553 () (_ BitVec 64))

(declare-fun lt!171558 () (_ BitVec 64))

(assert (=> d!36186 (= res!92985 (= lt!171556 (bvsub lt!171558 lt!171553)))))

(assert (=> d!36186 (or (= (bvand lt!171558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171558 lt!171553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36186 (= lt!171553 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170739)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170739))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170739)))))))

(declare-fun lt!171557 () (_ BitVec 64))

(declare-fun lt!171555 () (_ BitVec 64))

(assert (=> d!36186 (= lt!171558 (bvmul lt!171557 lt!171555))))

(assert (=> d!36186 (or (= lt!171557 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171555 (bvsdiv (bvmul lt!171557 lt!171555) lt!171557)))))

(assert (=> d!36186 (= lt!171555 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36186 (= lt!171557 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170739)))))))

(assert (=> d!36186 (= lt!171556 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170739))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170739)))))))

(assert (=> d!36186 (invariant!0 (currentBit!5278 (_2!4886 lt!170739)) (currentByte!5283 (_2!4886 lt!170739)) (size!2314 (buf!2717 (_2!4886 lt!170739))))))

(assert (=> d!36186 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170739))) (currentByte!5283 (_2!4886 lt!170739)) (currentBit!5278 (_2!4886 lt!170739))) lt!171556)))

(declare-fun b!112616 () Bool)

(declare-fun res!92986 () Bool)

(assert (=> b!112616 (=> (not res!92986) (not e!73883))))

(assert (=> b!112616 (= res!92986 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171556))))

(declare-fun b!112617 () Bool)

(declare-fun lt!171554 () (_ BitVec 64))

(assert (=> b!112617 (= e!73883 (bvsle lt!171556 (bvmul lt!171554 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112617 (or (= lt!171554 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171554 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171554)))))

(assert (=> b!112617 (= lt!171554 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170739)))))))

(assert (= (and d!36186 res!92985) b!112616))

(assert (= (and b!112616 res!92986) b!112617))

(declare-fun m!168441 () Bool)

(assert (=> d!36186 m!168441))

(declare-fun m!168443 () Bool)

(assert (=> d!36186 m!168443))

(assert (=> b!112174 d!36186))

(assert (=> b!112174 d!35828))

(declare-fun b!112618 () Bool)

(declare-fun res!92988 () Bool)

(declare-fun e!73884 () Bool)

(assert (=> b!112618 (=> (not res!92988) (not e!73884))))

(declare-fun lt!171561 () (_ BitVec 64))

(declare-fun lt!171564 () (_ BitVec 64))

(declare-fun lt!171559 () tuple2!9286)

(assert (=> b!112618 (= res!92988 (= (bvlshr (_1!4903 lt!171559) lt!171561) (bvlshr lt!169808 lt!171564)))))

(assert (=> b!112618 (and (bvsge lt!171564 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171564 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112618 (= lt!171564 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112618 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112618 (and (bvsge lt!171561 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171561 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112618 (= lt!171561 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112618 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!112619 () Bool)

(declare-fun e!73886 () Bool)

(assert (=> b!112619 (= e!73884 e!73886)))

(declare-fun res!92991 () Bool)

(assert (=> b!112619 (=> res!92991 e!73886)))

(assert (=> b!112619 (= res!92991 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!112620 () Bool)

(declare-fun e!73885 () tuple2!9286)

(assert (=> b!112620 (= e!73885 (tuple2!9287 lt!169808 lt!169812))))

(declare-fun b!112621 () Bool)

(declare-fun lt!171560 () (_ BitVec 64))

(assert (=> b!112621 (= e!73886 (= (= (bvand (bvlshr (_1!4903 lt!171559) lt!171560) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4887 (readBitPure!0 lt!169812))))))

(assert (=> b!112621 (and (bvsge lt!171560 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171560 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!171565 () (_ BitVec 32))

(assert (=> b!112621 (= lt!171560 ((_ sign_extend 32) (bvsub lt!171565 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112621 (or (= (bvand lt!171565 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!171565 #b10000000000000000000000000000000) (bvand (bvsub lt!171565 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112621 (= lt!171565 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!112621 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!112622 () Bool)

(declare-fun lt!171562 () tuple2!9286)

(assert (=> b!112622 (= e!73885 (tuple2!9287 (_1!4903 lt!171562) (_2!4903 lt!171562)))))

(declare-fun lt!171563 () tuple2!9284)

(assert (=> b!112622 (= lt!171563 (readBit!0 lt!169812))))

(assert (=> b!112622 (= lt!171562 (readNLeastSignificantBitsLoop!0 (_2!4902 lt!171563) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!169808 (ite (_1!4902 lt!171563) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112623 () Bool)

(declare-fun res!92989 () Bool)

(assert (=> b!112623 (=> (not res!92989) (not e!73884))))

(assert (=> b!112623 (= res!92989 (= (bvand (_1!4903 lt!171559) (onesLSBLong!0 nBits!396)) (_1!4903 lt!171559)))))

(declare-fun b!112624 () Bool)

(declare-fun res!92987 () Bool)

(assert (=> b!112624 (=> (not res!92987) (not e!73884))))

(declare-fun lt!171567 () (_ BitVec 64))

(declare-fun lt!171566 () (_ BitVec 64))

(assert (=> b!112624 (= res!92987 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4903 lt!171559))) (currentByte!5283 (_2!4903 lt!171559)) (currentBit!5278 (_2!4903 lt!171559))) (bvadd lt!171567 lt!171566)))))

(assert (=> b!112624 (or (not (= (bvand lt!171567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171566 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171567 lt!171566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112624 (= lt!171566 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112624 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112624 (= lt!171567 (bitIndex!0 (size!2314 (buf!2717 lt!169812)) (currentByte!5283 lt!169812) (currentBit!5278 lt!169812)))))

(declare-fun d!36188 () Bool)

(assert (=> d!36188 e!73884))

(declare-fun res!92990 () Bool)

(assert (=> d!36188 (=> (not res!92990) (not e!73884))))

(assert (=> d!36188 (= res!92990 (= (buf!2717 (_2!4903 lt!171559)) (buf!2717 lt!169812)))))

(assert (=> d!36188 (= lt!171559 e!73885)))

(declare-fun c!6863 () Bool)

(assert (=> d!36188 (= c!6863 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!36188 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36188 (= (readNLeastSignificantBitsLoop!0 lt!169812 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169808) lt!171559)))

(assert (= (and d!36188 c!6863) b!112620))

(assert (= (and d!36188 (not c!6863)) b!112622))

(assert (= (and d!36188 res!92990) b!112624))

(assert (= (and b!112624 res!92987) b!112618))

(assert (= (and b!112618 res!92988) b!112623))

(assert (= (and b!112623 res!92989) b!112619))

(assert (= (and b!112619 (not res!92991)) b!112621))

(declare-fun m!168445 () Bool)

(assert (=> b!112621 m!168445))

(declare-fun m!168447 () Bool)

(assert (=> b!112622 m!168447))

(declare-fun m!168449 () Bool)

(assert (=> b!112622 m!168449))

(assert (=> b!112623 m!166847))

(declare-fun m!168451 () Bool)

(assert (=> b!112624 m!168451))

(declare-fun m!168453 () Bool)

(assert (=> b!112624 m!168453))

(assert (=> d!35840 d!36188))

(declare-fun e!73890 () Bool)

(declare-fun lt!171568 () tuple4!80)

(declare-fun b!112625 () Bool)

(assert (=> b!112625 (= e!73890 (arrayRangesEq!41 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169807)) (_1!4905 lt!171568) (_2!4905 lt!171568)))))

(declare-fun bm!1433 () Bool)

(declare-fun c!6864 () Bool)

(declare-fun call!1436 () Bool)

(declare-fun lt!171569 () (_ BitVec 32))

(declare-fun lt!171570 () (_ BitVec 32))

(assert (=> bm!1433 (= call!1436 (byteRangesEq!0 (ite c!6864 (select (arr!2907 (buf!2717 thiss!1305)) (_3!261 lt!171568)) (select (arr!2907 (buf!2717 thiss!1305)) (_4!40 lt!171568))) (ite c!6864 (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_3!261 lt!171568)) (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_4!40 lt!171568))) (ite c!6864 lt!171569 #b00000000000000000000000000000000) lt!171570))))

(declare-fun b!112627 () Bool)

(declare-fun e!73889 () Bool)

(declare-fun e!73887 () Bool)

(assert (=> b!112627 (= e!73889 e!73887)))

(declare-fun res!92996 () Bool)

(assert (=> b!112627 (= res!92996 (byteRangesEq!0 (select (arr!2907 (buf!2717 thiss!1305)) (_3!261 lt!171568)) (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_3!261 lt!171568)) lt!171569 #b00000000000000000000000000001000))))

(assert (=> b!112627 (=> (not res!92996) (not e!73887))))

(declare-fun d!36190 () Bool)

(declare-fun res!92995 () Bool)

(declare-fun e!73891 () Bool)

(assert (=> d!36190 (=> res!92995 e!73891)))

(assert (=> d!36190 (= res!92995 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (=> d!36190 (= (arrayBitRangesEq!0 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))) e!73891)))

(declare-fun b!112626 () Bool)

(assert (=> b!112626 (= e!73889 call!1436)))

(declare-fun b!112628 () Bool)

(declare-fun e!73892 () Bool)

(assert (=> b!112628 (= e!73891 e!73892)))

(declare-fun res!92993 () Bool)

(assert (=> b!112628 (=> (not res!92993) (not e!73892))))

(assert (=> b!112628 (= res!92993 e!73890)))

(declare-fun res!92994 () Bool)

(assert (=> b!112628 (=> res!92994 e!73890)))

(assert (=> b!112628 (= res!92994 (bvsge (_1!4905 lt!171568) (_2!4905 lt!171568)))))

(assert (=> b!112628 (= lt!171570 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112628 (= lt!171569 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112628 (= lt!171568 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(declare-fun b!112629 () Bool)

(declare-fun res!92992 () Bool)

(assert (=> b!112629 (= res!92992 (= lt!171570 #b00000000000000000000000000000000))))

(declare-fun e!73888 () Bool)

(assert (=> b!112629 (=> res!92992 e!73888)))

(assert (=> b!112629 (= e!73887 e!73888)))

(declare-fun b!112630 () Bool)

(assert (=> b!112630 (= e!73892 e!73889)))

(assert (=> b!112630 (= c!6864 (= (_3!261 lt!171568) (_4!40 lt!171568)))))

(declare-fun b!112631 () Bool)

(assert (=> b!112631 (= e!73888 call!1436)))

(assert (= (and d!36190 (not res!92995)) b!112628))

(assert (= (and b!112628 (not res!92994)) b!112625))

(assert (= (and b!112628 res!92993) b!112630))

(assert (= (and b!112630 c!6864) b!112626))

(assert (= (and b!112630 (not c!6864)) b!112627))

(assert (= (and b!112627 res!92996) b!112629))

(assert (= (and b!112629 (not res!92992)) b!112631))

(assert (= (or b!112626 b!112631) bm!1433))

(declare-fun m!168455 () Bool)

(assert (=> b!112625 m!168455))

(declare-fun m!168457 () Bool)

(assert (=> bm!1433 m!168457))

(declare-fun m!168459 () Bool)

(assert (=> bm!1433 m!168459))

(declare-fun m!168461 () Bool)

(assert (=> bm!1433 m!168461))

(declare-fun m!168463 () Bool)

(assert (=> bm!1433 m!168463))

(declare-fun m!168465 () Bool)

(assert (=> bm!1433 m!168465))

(assert (=> b!112627 m!168457))

(assert (=> b!112627 m!168459))

(assert (=> b!112627 m!168457))

(assert (=> b!112627 m!168459))

(declare-fun m!168467 () Bool)

(assert (=> b!112627 m!168467))

(assert (=> b!112628 m!166833))

(declare-fun m!168469 () Bool)

(assert (=> b!112628 m!168469))

(assert (=> b!112226 d!36190))

(assert (=> b!112226 d!35830))

(declare-fun d!36192 () Bool)

(assert (=> d!36192 (isPrefixOf!0 lt!170777 lt!170777)))

(declare-fun lt!171573 () Unit!6847)

(declare-fun choose!11 (BitStream!4102) Unit!6847)

(assert (=> d!36192 (= lt!171573 (choose!11 lt!170777))))

(assert (=> d!36192 (= (lemmaIsPrefixRefl!0 lt!170777) lt!171573)))

(declare-fun bs!8790 () Bool)

(assert (= bs!8790 d!36192))

(declare-fun m!168471 () Bool)

(assert (=> bs!8790 m!168471))

(declare-fun m!168473 () Bool)

(assert (=> bs!8790 m!168473))

(assert (=> b!112183 d!36192))

(declare-fun d!36194 () Bool)

(assert (=> d!36194 (= (invariant!0 (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!169810)))) (and (bvsge (currentBit!5278 (_2!4886 lt!169810)) #b00000000000000000000000000000000) (bvslt (currentBit!5278 (_2!4886 lt!169810)) #b00000000000000000000000000001000) (bvsge (currentByte!5283 (_2!4886 lt!169810)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!169810)))) (and (= (currentBit!5278 (_2!4886 lt!169810)) #b00000000000000000000000000000000) (= (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!169810))))))))))

(assert (=> d!35858 d!36194))

(declare-fun d!36196 () Bool)

(declare-fun res!92999 () Bool)

(declare-fun e!73894 () Bool)

(assert (=> d!36196 (=> (not res!92999) (not e!73894))))

(assert (=> d!36196 (= res!92999 (= (size!2314 (buf!2717 (_2!4888 lt!170921))) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (=> d!36196 (= (isPrefixOf!0 (_2!4888 lt!170921) (_2!4886 lt!169807)) e!73894)))

(declare-fun b!112632 () Bool)

(declare-fun res!92997 () Bool)

(assert (=> b!112632 (=> (not res!92997) (not e!73894))))

(assert (=> b!112632 (= res!92997 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170921))) (currentByte!5283 (_2!4888 lt!170921)) (currentBit!5278 (_2!4888 lt!170921))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807)))))))

(declare-fun b!112633 () Bool)

(declare-fun e!73893 () Bool)

(assert (=> b!112633 (= e!73894 e!73893)))

(declare-fun res!92998 () Bool)

(assert (=> b!112633 (=> res!92998 e!73893)))

(assert (=> b!112633 (= res!92998 (= (size!2314 (buf!2717 (_2!4888 lt!170921))) #b00000000000000000000000000000000))))

(declare-fun b!112634 () Bool)

(assert (=> b!112634 (= e!73893 (arrayBitRangesEq!0 (buf!2717 (_2!4888 lt!170921)) (buf!2717 (_2!4886 lt!169807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170921))) (currentByte!5283 (_2!4888 lt!170921)) (currentBit!5278 (_2!4888 lt!170921)))))))

(assert (= (and d!36196 res!92999) b!112632))

(assert (= (and b!112632 res!92997) b!112633))

(assert (= (and b!112633 (not res!92998)) b!112634))

(declare-fun m!168475 () Bool)

(assert (=> b!112632 m!168475))

(assert (=> b!112632 m!166831))

(assert (=> b!112634 m!168475))

(assert (=> b!112634 m!168475))

(declare-fun m!168477 () Bool)

(assert (=> b!112634 m!168477))

(assert (=> b!112239 d!36196))

(assert (=> b!112224 d!35830))

(assert (=> b!112224 d!35836))

(declare-fun d!36198 () Bool)

(assert (=> d!36198 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!170776) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810)))) lt!170776))))

(declare-fun bs!8791 () Bool)

(assert (= bs!8791 d!36198))

(assert (=> bs!8791 m!167685))

(assert (=> b!112181 d!36198))

(declare-fun d!36200 () Bool)

(assert (=> d!36200 (= (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169809)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169809))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169809)))) (bvsub (bvmul ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!169809)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!169809))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!169809))))))))

(assert (=> d!35854 d!36200))

(declare-fun d!36202 () Bool)

(assert (=> d!36202 (= (invariant!0 (currentBit!5278 (_1!4887 lt!169809)) (currentByte!5283 (_1!4887 lt!169809)) (size!2314 (buf!2717 (_1!4887 lt!169809)))) (and (bvsge (currentBit!5278 (_1!4887 lt!169809)) #b00000000000000000000000000000000) (bvslt (currentBit!5278 (_1!4887 lt!169809)) #b00000000000000000000000000001000) (bvsge (currentByte!5283 (_1!4887 lt!169809)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 (_1!4887 lt!169809)) (size!2314 (buf!2717 (_1!4887 lt!169809)))) (and (= (currentBit!5278 (_1!4887 lt!169809)) #b00000000000000000000000000000000) (= (currentByte!5283 (_1!4887 lt!169809)) (size!2314 (buf!2717 (_1!4887 lt!169809))))))))))

(assert (=> d!35854 d!36202))

(declare-fun d!36204 () Bool)

(declare-fun e!73895 () Bool)

(assert (=> d!36204 e!73895))

(declare-fun res!93000 () Bool)

(assert (=> d!36204 (=> (not res!93000) (not e!73895))))

(assert (=> d!36204 (= res!93000 (= (buf!2717 (_2!4886 (increaseBitIndex!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))) (buf!2717 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))))

(declare-fun lt!171577 () Bool)

(assert (=> d!36204 (= lt!171577 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))) (currentByte!5283 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171575 () tuple2!9284)

(assert (=> d!36204 (= lt!171575 (tuple2!9285 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))) (currentByte!5283 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4886 (increaseBitIndex!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))))

(assert (=> d!36204 (validate_offset_bit!0 ((_ sign_extend 32) (size!2314 (buf!2717 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))) ((_ sign_extend 32) (currentByte!5283 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))) ((_ sign_extend 32) (currentBit!5278 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))))

(assert (=> d!36204 (= (readBit!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))) lt!171575)))

(declare-fun lt!171576 () (_ BitVec 64))

(declare-fun lt!171578 () (_ BitVec 64))

(declare-fun b!112635 () Bool)

(assert (=> b!112635 (= e!73895 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 (increaseBitIndex!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))) (currentByte!5283 (_2!4886 (increaseBitIndex!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))) (currentBit!5278 (_2!4886 (increaseBitIndex!0 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))) (bvadd lt!171578 lt!171576)))))

(assert (=> b!112635 (or (not (= (bvand lt!171578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171576 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171578 lt!171576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112635 (= lt!171576 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112635 (= lt!171578 (bitIndex!0 (size!2314 (buf!2717 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))) (currentByte!5283 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))) (currentBit!5278 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))))

(declare-fun lt!171574 () Bool)

(assert (=> b!112635 (= lt!171574 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))) (currentByte!5283 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171579 () Bool)

(assert (=> b!112635 (= lt!171579 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))) (currentByte!5283 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171580 () Bool)

(assert (=> b!112635 (= lt!171580 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))) (currentByte!5283 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!36204 res!93000) b!112635))

(declare-fun m!168479 () Bool)

(assert (=> d!36204 m!168479))

(declare-fun m!168481 () Bool)

(assert (=> d!36204 m!168481))

(declare-fun m!168483 () Bool)

(assert (=> d!36204 m!168483))

(declare-fun m!168485 () Bool)

(assert (=> d!36204 m!168485))

(declare-fun m!168487 () Bool)

(assert (=> b!112635 m!168487))

(declare-fun m!168489 () Bool)

(assert (=> b!112635 m!168489))

(assert (=> b!112635 m!168479))

(assert (=> b!112635 m!168483))

(assert (=> b!112635 m!168481))

(assert (=> d!35802 d!36204))

(assert (=> d!35810 d!35820))

(declare-fun d!36206 () Bool)

(assert (=> d!36206 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169807)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!169805)))

(assert (=> d!36206 true))

(declare-fun _$6!253 () Unit!6847)

(assert (=> d!36206 (= (choose!9 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!169807)) lt!169805 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))) _$6!253)))

(declare-fun bs!8792 () Bool)

(assert (= bs!8792 d!36206))

(assert (=> bs!8792 m!166795))

(assert (=> d!35810 d!36206))

(declare-fun d!36208 () Bool)

(declare-fun lt!171581 () tuple2!9284)

(assert (=> d!36208 (= lt!171581 (readBit!0 (readerFrom!0 (_2!4886 lt!170739) (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)))))))

(assert (=> d!36208 (= (readBitPure!0 (readerFrom!0 (_2!4886 lt!170739) (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)))) (tuple2!9255 (_2!4902 lt!171581) (_1!4902 lt!171581)))))

(declare-fun bs!8793 () Bool)

(assert (= bs!8793 d!36208))

(assert (=> bs!8793 m!167545))

(declare-fun m!168491 () Bool)

(assert (=> bs!8793 m!168491))

(assert (=> b!112179 d!36208))

(declare-fun d!36210 () Bool)

(declare-fun e!73896 () Bool)

(assert (=> d!36210 e!73896))

(declare-fun res!93001 () Bool)

(assert (=> d!36210 (=> (not res!93001) (not e!73896))))

(assert (=> d!36210 (= res!93001 (invariant!0 (currentBit!5278 (_2!4886 lt!170739)) (currentByte!5283 (_2!4886 lt!170739)) (size!2314 (buf!2717 (_2!4886 lt!170739)))))))

(assert (=> d!36210 (= (readerFrom!0 (_2!4886 lt!170739) (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810))) (BitStream!4103 (buf!2717 (_2!4886 lt!170739)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(declare-fun b!112636 () Bool)

(assert (=> b!112636 (= e!73896 (invariant!0 (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!170739)))))))

(assert (= (and d!36210 res!93001) b!112636))

(assert (=> d!36210 m!168443))

(declare-fun m!168493 () Bool)

(assert (=> b!112636 m!168493))

(assert (=> b!112179 d!36210))

(declare-fun b!112637 () Bool)

(declare-fun res!93003 () Bool)

(declare-fun e!73897 () Bool)

(assert (=> b!112637 (=> (not res!93003) (not e!73897))))

(declare-fun lt!171582 () tuple2!9286)

(declare-fun lt!171584 () (_ BitVec 64))

(declare-fun lt!171587 () (_ BitVec 64))

(assert (=> b!112637 (= res!93003 (= (bvlshr (_1!4903 lt!171582) lt!171584) (bvlshr lt!169798 lt!171587)))))

(assert (=> b!112637 (and (bvsge lt!171587 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171587 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112637 (= lt!171587 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!112637 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!112637 (and (bvsge lt!171584 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171584 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112637 (= lt!171584 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!112637 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!112638 () Bool)

(declare-fun e!73899 () Bool)

(assert (=> b!112638 (= e!73897 e!73899)))

(declare-fun res!93006 () Bool)

(assert (=> b!112638 (=> res!93006 e!73899)))

(assert (=> b!112638 (= res!93006 (bvsge i!615 nBits!396))))

(declare-fun b!112639 () Bool)

(declare-fun e!73898 () tuple2!9286)

(assert (=> b!112639 (= e!73898 (tuple2!9287 lt!169798 (_1!4888 lt!169797)))))

(declare-fun b!112640 () Bool)

(declare-fun lt!171583 () (_ BitVec 64))

(assert (=> b!112640 (= e!73899 (= (= (bvand (bvlshr (_1!4903 lt!171582) lt!171583) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4887 (readBitPure!0 (_1!4888 lt!169797)))))))

(assert (=> b!112640 (and (bvsge lt!171583 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171583 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!171588 () (_ BitVec 32))

(assert (=> b!112640 (= lt!171583 ((_ sign_extend 32) (bvsub lt!171588 i!615)))))

(assert (=> b!112640 (or (= (bvand lt!171588 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!171588 #b10000000000000000000000000000000) (bvand (bvsub lt!171588 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!112640 (= lt!171588 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!112640 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!112641 () Bool)

(declare-fun lt!171585 () tuple2!9286)

(assert (=> b!112641 (= e!73898 (tuple2!9287 (_1!4903 lt!171585) (_2!4903 lt!171585)))))

(declare-fun lt!171586 () tuple2!9284)

(assert (=> b!112641 (= lt!171586 (readBit!0 (_1!4888 lt!169797)))))

(assert (=> b!112641 (= lt!171585 (readNLeastSignificantBitsLoop!0 (_2!4902 lt!171586) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!169798 (ite (_1!4902 lt!171586) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112642 () Bool)

(declare-fun res!93004 () Bool)

(assert (=> b!112642 (=> (not res!93004) (not e!73897))))

(assert (=> b!112642 (= res!93004 (= (bvand (_1!4903 lt!171582) (onesLSBLong!0 nBits!396)) (_1!4903 lt!171582)))))

(declare-fun b!112643 () Bool)

(declare-fun res!93002 () Bool)

(assert (=> b!112643 (=> (not res!93002) (not e!73897))))

(declare-fun lt!171589 () (_ BitVec 64))

(declare-fun lt!171590 () (_ BitVec 64))

(assert (=> b!112643 (= res!93002 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4903 lt!171582))) (currentByte!5283 (_2!4903 lt!171582)) (currentBit!5278 (_2!4903 lt!171582))) (bvadd lt!171590 lt!171589)))))

(assert (=> b!112643 (or (not (= (bvand lt!171590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171589 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171590 lt!171589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112643 (= lt!171589 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!112643 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!112643 (= lt!171590 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)) (currentBit!5278 (_1!4888 lt!169797))))))

(declare-fun d!36212 () Bool)

(assert (=> d!36212 e!73897))

(declare-fun res!93005 () Bool)

(assert (=> d!36212 (=> (not res!93005) (not e!73897))))

(assert (=> d!36212 (= res!93005 (= (buf!2717 (_2!4903 lt!171582)) (buf!2717 (_1!4888 lt!169797))))))

(assert (=> d!36212 (= lt!171582 e!73898)))

(declare-fun c!6865 () Bool)

(assert (=> d!36212 (= c!6865 (= nBits!396 i!615))))

(assert (=> d!36212 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36212 (= (readNLeastSignificantBitsLoop!0 (_1!4888 lt!169797) nBits!396 i!615 lt!169798) lt!171582)))

(assert (= (and d!36212 c!6865) b!112639))

(assert (= (and d!36212 (not c!6865)) b!112641))

(assert (= (and d!36212 res!93005) b!112643))

(assert (= (and b!112643 res!93002) b!112637))

(assert (= (and b!112637 res!93003) b!112642))

(assert (= (and b!112642 res!93004) b!112638))

(assert (= (and b!112638 (not res!93006)) b!112640))

(assert (=> b!112640 m!166811))

(assert (=> b!112641 m!167621))

(declare-fun m!168495 () Bool)

(assert (=> b!112641 m!168495))

(assert (=> b!112642 m!166847))

(declare-fun m!168497 () Bool)

(assert (=> b!112643 m!168497))

(assert (=> b!112643 m!167703))

(assert (=> d!35824 d!36212))

(declare-fun b!112644 () Bool)

(declare-fun e!73903 () Bool)

(declare-fun lt!171591 () tuple4!80)

(assert (=> b!112644 (= e!73903 (arrayRangesEq!41 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169810)) (_1!4905 lt!171591) (_2!4905 lt!171591)))))

(declare-fun lt!171593 () (_ BitVec 32))

(declare-fun call!1437 () Bool)

(declare-fun bm!1434 () Bool)

(declare-fun lt!171592 () (_ BitVec 32))

(declare-fun c!6866 () Bool)

(assert (=> bm!1434 (= call!1437 (byteRangesEq!0 (ite c!6866 (select (arr!2907 (buf!2717 thiss!1305)) (_3!261 lt!171591)) (select (arr!2907 (buf!2717 thiss!1305)) (_4!40 lt!171591))) (ite c!6866 (select (arr!2907 (buf!2717 (_2!4886 lt!169810))) (_3!261 lt!171591)) (select (arr!2907 (buf!2717 (_2!4886 lt!169810))) (_4!40 lt!171591))) (ite c!6866 lt!171592 #b00000000000000000000000000000000) lt!171593))))

(declare-fun b!112646 () Bool)

(declare-fun e!73902 () Bool)

(declare-fun e!73900 () Bool)

(assert (=> b!112646 (= e!73902 e!73900)))

(declare-fun res!93011 () Bool)

(assert (=> b!112646 (= res!93011 (byteRangesEq!0 (select (arr!2907 (buf!2717 thiss!1305)) (_3!261 lt!171591)) (select (arr!2907 (buf!2717 (_2!4886 lt!169810))) (_3!261 lt!171591)) lt!171592 #b00000000000000000000000000001000))))

(assert (=> b!112646 (=> (not res!93011) (not e!73900))))

(declare-fun d!36214 () Bool)

(declare-fun res!93010 () Bool)

(declare-fun e!73904 () Bool)

(assert (=> d!36214 (=> res!93010 e!73904)))

(assert (=> d!36214 (= res!93010 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (=> d!36214 (= (arrayBitRangesEq!0 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169810)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))) e!73904)))

(declare-fun b!112645 () Bool)

(assert (=> b!112645 (= e!73902 call!1437)))

(declare-fun b!112647 () Bool)

(declare-fun e!73905 () Bool)

(assert (=> b!112647 (= e!73904 e!73905)))

(declare-fun res!93008 () Bool)

(assert (=> b!112647 (=> (not res!93008) (not e!73905))))

(assert (=> b!112647 (= res!93008 e!73903)))

(declare-fun res!93009 () Bool)

(assert (=> b!112647 (=> res!93009 e!73903)))

(assert (=> b!112647 (= res!93009 (bvsge (_1!4905 lt!171591) (_2!4905 lt!171591)))))

(assert (=> b!112647 (= lt!171593 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112647 (= lt!171592 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112647 (= lt!171591 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(declare-fun b!112648 () Bool)

(declare-fun res!93007 () Bool)

(assert (=> b!112648 (= res!93007 (= lt!171593 #b00000000000000000000000000000000))))

(declare-fun e!73901 () Bool)

(assert (=> b!112648 (=> res!93007 e!73901)))

(assert (=> b!112648 (= e!73900 e!73901)))

(declare-fun b!112649 () Bool)

(assert (=> b!112649 (= e!73905 e!73902)))

(assert (=> b!112649 (= c!6866 (= (_3!261 lt!171591) (_4!40 lt!171591)))))

(declare-fun b!112650 () Bool)

(assert (=> b!112650 (= e!73901 call!1437)))

(assert (= (and d!36214 (not res!93010)) b!112647))

(assert (= (and b!112647 (not res!93009)) b!112644))

(assert (= (and b!112647 res!93008) b!112649))

(assert (= (and b!112649 c!6866) b!112645))

(assert (= (and b!112649 (not c!6866)) b!112646))

(assert (= (and b!112646 res!93011) b!112648))

(assert (= (and b!112648 (not res!93007)) b!112650))

(assert (= (or b!112645 b!112650) bm!1434))

(declare-fun m!168499 () Bool)

(assert (=> b!112644 m!168499))

(declare-fun m!168501 () Bool)

(assert (=> bm!1434 m!168501))

(declare-fun m!168503 () Bool)

(assert (=> bm!1434 m!168503))

(declare-fun m!168505 () Bool)

(assert (=> bm!1434 m!168505))

(declare-fun m!168507 () Bool)

(assert (=> bm!1434 m!168507))

(declare-fun m!168509 () Bool)

(assert (=> bm!1434 m!168509))

(assert (=> b!112646 m!168501))

(assert (=> b!112646 m!168503))

(assert (=> b!112646 m!168501))

(assert (=> b!112646 m!168503))

(declare-fun m!168511 () Bool)

(assert (=> b!112646 m!168511))

(assert (=> b!112647 m!166833))

(assert (=> b!112647 m!168469))

(assert (=> b!112253 d!36214))

(assert (=> b!112253 d!35830))

(declare-fun d!36216 () Bool)

(declare-fun e!73908 () Bool)

(assert (=> d!36216 e!73908))

(declare-fun res!93014 () Bool)

(assert (=> d!36216 (=> (not res!93014) (not e!73908))))

(declare-fun lt!171602 () tuple2!9254)

(declare-fun lt!171600 () tuple2!9254)

(assert (=> d!36216 (= res!93014 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171602))) (currentByte!5283 (_1!4887 lt!171602)) (currentBit!5278 (_1!4887 lt!171602))) (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171600))) (currentByte!5283 (_1!4887 lt!171600)) (currentBit!5278 (_1!4887 lt!171600)))))))

(declare-fun lt!171601 () BitStream!4102)

(assert (=> d!36216 (= lt!171600 (readBitPure!0 lt!171601))))

(assert (=> d!36216 (= lt!171602 (readBitPure!0 lt!169794))))

(assert (=> d!36216 (= lt!171601 (BitStream!4103 (buf!2717 (_2!4886 lt!169807)) (currentByte!5283 lt!169794) (currentBit!5278 lt!169794)))))

(assert (=> d!36216 (invariant!0 (currentBit!5278 lt!169794) (currentByte!5283 lt!169794) (size!2314 (buf!2717 (_2!4886 lt!169807))))))

(assert (=> d!36216 true))

(declare-fun _$9!57 () Unit!6847)

(assert (=> d!36216 (= (choose!50 lt!169794 (_2!4886 lt!169807) lt!170868 lt!170870 (tuple2!9255 (_1!4887 lt!170870) (_2!4887 lt!170870)) (_1!4887 lt!170870) (_2!4887 lt!170870) lt!170869 (tuple2!9255 (_1!4887 lt!170869) (_2!4887 lt!170869)) (_1!4887 lt!170869) (_2!4887 lt!170869)) _$9!57)))

(declare-fun b!112653 () Bool)

(assert (=> b!112653 (= e!73908 (= (_2!4887 lt!171602) (_2!4887 lt!171600)))))

(assert (= (and d!36216 res!93014) b!112653))

(assert (=> d!36216 m!166819))

(declare-fun m!168513 () Bool)

(assert (=> d!36216 m!168513))

(declare-fun m!168515 () Bool)

(assert (=> d!36216 m!168515))

(declare-fun m!168517 () Bool)

(assert (=> d!36216 m!168517))

(assert (=> d!36216 m!167631))

(assert (=> d!35800 d!36216))

(declare-fun d!36218 () Bool)

(declare-fun e!73909 () Bool)

(assert (=> d!36218 e!73909))

(declare-fun res!93015 () Bool)

(assert (=> d!36218 (=> (not res!93015) (not e!73909))))

(declare-fun lt!171606 () (_ BitVec 64))

(declare-fun lt!171603 () (_ BitVec 64))

(declare-fun lt!171608 () (_ BitVec 64))

(assert (=> d!36218 (= res!93015 (= lt!171606 (bvsub lt!171608 lt!171603)))))

(assert (=> d!36218 (or (= (bvand lt!171608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171603 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171608 lt!171603) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36218 (= lt!171603 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170869)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170869))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170869)))))))

(declare-fun lt!171607 () (_ BitVec 64))

(declare-fun lt!171605 () (_ BitVec 64))

(assert (=> d!36218 (= lt!171608 (bvmul lt!171607 lt!171605))))

(assert (=> d!36218 (or (= lt!171607 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171605 (bvsdiv (bvmul lt!171607 lt!171605) lt!171607)))))

(assert (=> d!36218 (= lt!171605 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36218 (= lt!171607 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170869)))))))

(assert (=> d!36218 (= lt!171606 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170869))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170869)))))))

(assert (=> d!36218 (invariant!0 (currentBit!5278 (_1!4887 lt!170869)) (currentByte!5283 (_1!4887 lt!170869)) (size!2314 (buf!2717 (_1!4887 lt!170869))))))

(assert (=> d!36218 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170869))) (currentByte!5283 (_1!4887 lt!170869)) (currentBit!5278 (_1!4887 lt!170869))) lt!171606)))

(declare-fun b!112654 () Bool)

(declare-fun res!93016 () Bool)

(assert (=> b!112654 (=> (not res!93016) (not e!73909))))

(assert (=> b!112654 (= res!93016 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171606))))

(declare-fun b!112655 () Bool)

(declare-fun lt!171604 () (_ BitVec 64))

(assert (=> b!112655 (= e!73909 (bvsle lt!171606 (bvmul lt!171604 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112655 (or (= lt!171604 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171604 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171604)))))

(assert (=> b!112655 (= lt!171604 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170869)))))))

(assert (= (and d!36218 res!93015) b!112654))

(assert (= (and b!112654 res!93016) b!112655))

(declare-fun m!168519 () Bool)

(assert (=> d!36218 m!168519))

(declare-fun m!168521 () Bool)

(assert (=> d!36218 m!168521))

(assert (=> d!35800 d!36218))

(assert (=> d!35800 d!35796))

(declare-fun d!36220 () Bool)

(declare-fun e!73910 () Bool)

(assert (=> d!36220 e!73910))

(declare-fun res!93017 () Bool)

(assert (=> d!36220 (=> (not res!93017) (not e!73910))))

(declare-fun lt!171612 () (_ BitVec 64))

(declare-fun lt!171609 () (_ BitVec 64))

(declare-fun lt!171614 () (_ BitVec 64))

(assert (=> d!36220 (= res!93017 (= lt!171612 (bvsub lt!171614 lt!171609)))))

(assert (=> d!36220 (or (= (bvand lt!171614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171609 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171614 lt!171609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36220 (= lt!171609 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170870)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170870))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170870)))))))

(declare-fun lt!171613 () (_ BitVec 64))

(declare-fun lt!171611 () (_ BitVec 64))

(assert (=> d!36220 (= lt!171614 (bvmul lt!171613 lt!171611))))

(assert (=> d!36220 (or (= lt!171613 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171611 (bvsdiv (bvmul lt!171613 lt!171611) lt!171613)))))

(assert (=> d!36220 (= lt!171611 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36220 (= lt!171613 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170870)))))))

(assert (=> d!36220 (= lt!171612 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170870))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170870)))))))

(assert (=> d!36220 (invariant!0 (currentBit!5278 (_1!4887 lt!170870)) (currentByte!5283 (_1!4887 lt!170870)) (size!2314 (buf!2717 (_1!4887 lt!170870))))))

(assert (=> d!36220 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170870))) (currentByte!5283 (_1!4887 lt!170870)) (currentBit!5278 (_1!4887 lt!170870))) lt!171612)))

(declare-fun b!112656 () Bool)

(declare-fun res!93018 () Bool)

(assert (=> b!112656 (=> (not res!93018) (not e!73910))))

(assert (=> b!112656 (= res!93018 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171612))))

(declare-fun b!112657 () Bool)

(declare-fun lt!171610 () (_ BitVec 64))

(assert (=> b!112657 (= e!73910 (bvsle lt!171612 (bvmul lt!171610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112657 (or (= lt!171610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171610)))))

(assert (=> b!112657 (= lt!171610 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170870)))))))

(assert (= (and d!36220 res!93017) b!112656))

(assert (= (and b!112656 res!93018) b!112657))

(declare-fun m!168523 () Bool)

(assert (=> d!36220 m!168523))

(declare-fun m!168525 () Bool)

(assert (=> d!36220 m!168525))

(assert (=> d!35800 d!36220))

(declare-fun d!36222 () Bool)

(assert (=> d!36222 (= (invariant!0 (currentBit!5278 lt!169794) (currentByte!5283 lt!169794) (size!2314 (buf!2717 (_2!4886 lt!169807)))) (and (bvsge (currentBit!5278 lt!169794) #b00000000000000000000000000000000) (bvslt (currentBit!5278 lt!169794) #b00000000000000000000000000001000) (bvsge (currentByte!5283 lt!169794) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 lt!169794) (size!2314 (buf!2717 (_2!4886 lt!169807)))) (and (= (currentBit!5278 lt!169794) #b00000000000000000000000000000000) (= (currentByte!5283 lt!169794) (size!2314 (buf!2717 (_2!4886 lt!169807))))))))))

(assert (=> d!35800 d!36222))

(declare-fun d!36224 () Bool)

(declare-fun lt!171615 () tuple2!9284)

(assert (=> d!36224 (= lt!171615 (readBit!0 lt!170868))))

(assert (=> d!36224 (= (readBitPure!0 lt!170868) (tuple2!9255 (_2!4902 lt!171615) (_1!4902 lt!171615)))))

(declare-fun bs!8794 () Bool)

(assert (= bs!8794 d!36224))

(declare-fun m!168527 () Bool)

(assert (=> bs!8794 m!168527))

(assert (=> d!35800 d!36224))

(assert (=> b!112251 d!35830))

(assert (=> b!112251 d!35828))

(declare-fun d!36226 () Bool)

(assert (=> d!36226 (isPrefixOf!0 lt!170834 lt!170834)))

(declare-fun lt!171616 () Unit!6847)

(assert (=> d!36226 (= lt!171616 (choose!11 lt!170834))))

(assert (=> d!36226 (= (lemmaIsPrefixRefl!0 lt!170834) lt!171616)))

(declare-fun bs!8795 () Bool)

(assert (= bs!8795 d!36226))

(assert (=> bs!8795 m!167587))

(declare-fun m!168529 () Bool)

(assert (=> bs!8795 m!168529))

(assert (=> d!35792 d!36226))

(declare-fun d!36228 () Bool)

(declare-fun res!93021 () Bool)

(declare-fun e!73912 () Bool)

(assert (=> d!36228 (=> (not res!93021) (not e!73912))))

(assert (=> d!36228 (= res!93021 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (=> d!36228 (= (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!169807)) e!73912)))

(declare-fun b!112658 () Bool)

(declare-fun res!93019 () Bool)

(assert (=> b!112658 (=> (not res!93019) (not e!73912))))

(assert (=> b!112658 (= res!93019 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807)))))))

(declare-fun b!112659 () Bool)

(declare-fun e!73911 () Bool)

(assert (=> b!112659 (= e!73912 e!73911)))

(declare-fun res!93020 () Bool)

(assert (=> b!112659 (=> res!93020 e!73911)))

(assert (=> b!112659 (= res!93020 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) #b00000000000000000000000000000000))))

(declare-fun b!112660 () Bool)

(assert (=> b!112660 (= e!73911 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!169807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(assert (= (and d!36228 res!93021) b!112658))

(assert (= (and b!112658 res!93019) b!112659))

(assert (= (and b!112659 (not res!93020)) b!112660))

(assert (=> b!112658 m!166841))

(assert (=> b!112658 m!166831))

(assert (=> b!112660 m!166841))

(assert (=> b!112660 m!166841))

(declare-fun m!168531 () Bool)

(assert (=> b!112660 m!168531))

(assert (=> d!35792 d!36228))

(declare-fun d!36230 () Bool)

(declare-fun res!93024 () Bool)

(declare-fun e!73914 () Bool)

(assert (=> d!36230 (=> (not res!93024) (not e!73914))))

(assert (=> d!36230 (= res!93024 (= (size!2314 (buf!2717 (_1!4888 lt!170838))) (size!2314 (buf!2717 (_2!4888 lt!170838)))))))

(assert (=> d!36230 (= (isPrefixOf!0 (_1!4888 lt!170838) (_2!4888 lt!170838)) e!73914)))

(declare-fun b!112661 () Bool)

(declare-fun res!93022 () Bool)

(assert (=> b!112661 (=> (not res!93022) (not e!73914))))

(assert (=> b!112661 (= res!93022 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170838))) (currentByte!5283 (_1!4888 lt!170838)) (currentBit!5278 (_1!4888 lt!170838))) (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170838))) (currentByte!5283 (_2!4888 lt!170838)) (currentBit!5278 (_2!4888 lt!170838)))))))

(declare-fun b!112662 () Bool)

(declare-fun e!73913 () Bool)

(assert (=> b!112662 (= e!73914 e!73913)))

(declare-fun res!93023 () Bool)

(assert (=> b!112662 (=> res!93023 e!73913)))

(assert (=> b!112662 (= res!93023 (= (size!2314 (buf!2717 (_1!4888 lt!170838))) #b00000000000000000000000000000000))))

(declare-fun b!112663 () Bool)

(assert (=> b!112663 (= e!73913 (arrayBitRangesEq!0 (buf!2717 (_1!4888 lt!170838)) (buf!2717 (_2!4888 lt!170838)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170838))) (currentByte!5283 (_1!4888 lt!170838)) (currentBit!5278 (_1!4888 lt!170838)))))))

(assert (= (and d!36230 res!93024) b!112661))

(assert (= (and b!112661 res!93022) b!112662))

(assert (= (and b!112662 (not res!93023)) b!112663))

(assert (=> b!112661 m!168363))

(declare-fun m!168533 () Bool)

(assert (=> b!112661 m!168533))

(assert (=> b!112663 m!168363))

(assert (=> b!112663 m!168363))

(declare-fun m!168535 () Bool)

(assert (=> b!112663 m!168535))

(assert (=> d!35792 d!36230))

(declare-fun d!36232 () Bool)

(declare-fun res!93027 () Bool)

(declare-fun e!73916 () Bool)

(assert (=> d!36232 (=> (not res!93027) (not e!73916))))

(assert (=> d!36232 (= res!93027 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) (size!2314 (buf!2717 (_2!4886 lt!169810)))))))

(assert (=> d!36232 (= (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!169810)) e!73916)))

(declare-fun b!112664 () Bool)

(declare-fun res!93025 () Bool)

(assert (=> b!112664 (=> (not res!93025) (not e!73916))))

(assert (=> b!112664 (= res!93025 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(declare-fun b!112665 () Bool)

(declare-fun e!73915 () Bool)

(assert (=> b!112665 (= e!73916 e!73915)))

(declare-fun res!93026 () Bool)

(assert (=> b!112665 (=> res!93026 e!73915)))

(assert (=> b!112665 (= res!93026 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) #b00000000000000000000000000000000))))

(declare-fun b!112666 () Bool)

(assert (=> b!112666 (= e!73915 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!169810)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(assert (= (and d!36232 res!93027) b!112664))

(assert (= (and b!112664 res!93025) b!112665))

(assert (= (and b!112665 (not res!93026)) b!112666))

(assert (=> b!112664 m!166841))

(assert (=> b!112664 m!166841))

(assert (=> b!112666 m!166841))

(assert (=> b!112666 m!166841))

(declare-fun m!168537 () Bool)

(assert (=> b!112666 m!168537))

(assert (=> d!35792 d!36232))

(declare-fun d!36234 () Bool)

(declare-fun res!93030 () Bool)

(declare-fun e!73918 () Bool)

(assert (=> d!36234 (=> (not res!93030) (not e!73918))))

(assert (=> d!36234 (= res!93030 (= (size!2314 (buf!2717 lt!170834)) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (=> d!36234 (= (isPrefixOf!0 lt!170834 (_2!4886 lt!169807)) e!73918)))

(declare-fun b!112667 () Bool)

(declare-fun res!93028 () Bool)

(assert (=> b!112667 (=> (not res!93028) (not e!73918))))

(assert (=> b!112667 (= res!93028 (bvsle (bitIndex!0 (size!2314 (buf!2717 lt!170834)) (currentByte!5283 lt!170834) (currentBit!5278 lt!170834)) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807)))))))

(declare-fun b!112668 () Bool)

(declare-fun e!73917 () Bool)

(assert (=> b!112668 (= e!73918 e!73917)))

(declare-fun res!93029 () Bool)

(assert (=> b!112668 (=> res!93029 e!73917)))

(assert (=> b!112668 (= res!93029 (= (size!2314 (buf!2717 lt!170834)) #b00000000000000000000000000000000))))

(declare-fun b!112669 () Bool)

(assert (=> b!112669 (= e!73917 (arrayBitRangesEq!0 (buf!2717 lt!170834) (buf!2717 (_2!4886 lt!169807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 lt!170834)) (currentByte!5283 lt!170834) (currentBit!5278 lt!170834))))))

(assert (= (and d!36234 res!93030) b!112667))

(assert (= (and b!112667 res!93028) b!112668))

(assert (= (and b!112668 (not res!93029)) b!112669))

(declare-fun m!168539 () Bool)

(assert (=> b!112667 m!168539))

(assert (=> b!112667 m!166831))

(assert (=> b!112669 m!168539))

(assert (=> b!112669 m!168539))

(declare-fun m!168541 () Bool)

(assert (=> b!112669 m!168541))

(assert (=> d!35792 d!36234))

(declare-fun d!36236 () Bool)

(assert (=> d!36236 (isPrefixOf!0 lt!170834 (_2!4886 lt!169807))))

(declare-fun lt!171617 () Unit!6847)

(assert (=> d!36236 (= lt!171617 (choose!30 lt!170834 (_2!4886 lt!169807) (_2!4886 lt!169807)))))

(assert (=> d!36236 (isPrefixOf!0 lt!170834 (_2!4886 lt!169807))))

(assert (=> d!36236 (= (lemmaIsPrefixTransitive!0 lt!170834 (_2!4886 lt!169807) (_2!4886 lt!169807)) lt!171617)))

(declare-fun bs!8796 () Bool)

(assert (= bs!8796 d!36236))

(assert (=> bs!8796 m!167595))

(declare-fun m!168543 () Bool)

(assert (=> bs!8796 m!168543))

(assert (=> bs!8796 m!167595))

(assert (=> d!35792 d!36236))

(declare-fun d!36238 () Bool)

(assert (=> d!36238 (isPrefixOf!0 lt!170834 (_2!4886 lt!169807))))

(declare-fun lt!171618 () Unit!6847)

(assert (=> d!36238 (= lt!171618 (choose!30 lt!170834 (_2!4886 lt!169810) (_2!4886 lt!169807)))))

(assert (=> d!36238 (isPrefixOf!0 lt!170834 (_2!4886 lt!169810))))

(assert (=> d!36238 (= (lemmaIsPrefixTransitive!0 lt!170834 (_2!4886 lt!169810) (_2!4886 lt!169807)) lt!171618)))

(declare-fun bs!8797 () Bool)

(assert (= bs!8797 d!36238))

(assert (=> bs!8797 m!167595))

(declare-fun m!168545 () Bool)

(assert (=> bs!8797 m!168545))

(declare-fun m!168547 () Bool)

(assert (=> bs!8797 m!168547))

(assert (=> d!35792 d!36238))

(declare-fun d!36240 () Bool)

(declare-fun res!93033 () Bool)

(declare-fun e!73920 () Bool)

(assert (=> d!36240 (=> (not res!93033) (not e!73920))))

(assert (=> d!36240 (= res!93033 (= (size!2314 (buf!2717 (_2!4886 lt!169807))) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (=> d!36240 (= (isPrefixOf!0 (_2!4886 lt!169807) (_2!4886 lt!169807)) e!73920)))

(declare-fun b!112670 () Bool)

(declare-fun res!93031 () Bool)

(assert (=> b!112670 (=> (not res!93031) (not e!73920))))

(assert (=> b!112670 (= res!93031 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807)))))))

(declare-fun b!112671 () Bool)

(declare-fun e!73919 () Bool)

(assert (=> b!112671 (= e!73920 e!73919)))

(declare-fun res!93032 () Bool)

(assert (=> b!112671 (=> res!93032 e!73919)))

(assert (=> b!112671 (= res!93032 (= (size!2314 (buf!2717 (_2!4886 lt!169807))) #b00000000000000000000000000000000))))

(declare-fun b!112672 () Bool)

(assert (=> b!112672 (= e!73919 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169807)) (buf!2717 (_2!4886 lt!169807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807)))))))

(assert (= (and d!36240 res!93033) b!112670))

(assert (= (and b!112670 res!93031) b!112671))

(assert (= (and b!112671 (not res!93032)) b!112672))

(assert (=> b!112670 m!166831))

(assert (=> b!112670 m!166831))

(assert (=> b!112672 m!166831))

(assert (=> b!112672 m!166831))

(declare-fun m!168549 () Bool)

(assert (=> b!112672 m!168549))

(assert (=> d!35792 d!36240))

(declare-fun d!36242 () Bool)

(declare-fun res!93036 () Bool)

(declare-fun e!73922 () Bool)

(assert (=> d!36242 (=> (not res!93036) (not e!73922))))

(assert (=> d!36242 (= res!93036 (= (size!2314 (buf!2717 lt!170834)) (size!2314 (buf!2717 lt!170834))))))

(assert (=> d!36242 (= (isPrefixOf!0 lt!170834 lt!170834) e!73922)))

(declare-fun b!112673 () Bool)

(declare-fun res!93034 () Bool)

(assert (=> b!112673 (=> (not res!93034) (not e!73922))))

(assert (=> b!112673 (= res!93034 (bvsle (bitIndex!0 (size!2314 (buf!2717 lt!170834)) (currentByte!5283 lt!170834) (currentBit!5278 lt!170834)) (bitIndex!0 (size!2314 (buf!2717 lt!170834)) (currentByte!5283 lt!170834) (currentBit!5278 lt!170834))))))

(declare-fun b!112674 () Bool)

(declare-fun e!73921 () Bool)

(assert (=> b!112674 (= e!73922 e!73921)))

(declare-fun res!93035 () Bool)

(assert (=> b!112674 (=> res!93035 e!73921)))

(assert (=> b!112674 (= res!93035 (= (size!2314 (buf!2717 lt!170834)) #b00000000000000000000000000000000))))

(declare-fun b!112675 () Bool)

(assert (=> b!112675 (= e!73921 (arrayBitRangesEq!0 (buf!2717 lt!170834) (buf!2717 lt!170834) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 lt!170834)) (currentByte!5283 lt!170834) (currentBit!5278 lt!170834))))))

(assert (= (and d!36242 res!93036) b!112673))

(assert (= (and b!112673 res!93034) b!112674))

(assert (= (and b!112674 (not res!93035)) b!112675))

(assert (=> b!112673 m!168539))

(assert (=> b!112673 m!168539))

(assert (=> b!112675 m!168539))

(assert (=> b!112675 m!168539))

(declare-fun m!168551 () Bool)

(assert (=> b!112675 m!168551))

(assert (=> d!35792 d!36242))

(declare-fun d!36244 () Bool)

(assert (=> d!36244 (isPrefixOf!0 (_2!4886 lt!169807) (_2!4886 lt!169807))))

(declare-fun lt!171619 () Unit!6847)

(assert (=> d!36244 (= lt!171619 (choose!11 (_2!4886 lt!169807)))))

(assert (=> d!36244 (= (lemmaIsPrefixRefl!0 (_2!4886 lt!169807)) lt!171619)))

(declare-fun bs!8798 () Bool)

(assert (= bs!8798 d!36244))

(assert (=> bs!8798 m!167597))

(declare-fun m!168553 () Bool)

(assert (=> bs!8798 m!168553))

(assert (=> d!35792 d!36244))

(declare-fun d!36246 () Bool)

(assert (=> d!36246 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!169810))))

(declare-fun lt!171620 () Unit!6847)

(assert (=> d!36246 (= lt!171620 (choose!11 (_2!4886 lt!169810)))))

(assert (=> d!36246 (= (lemmaIsPrefixRefl!0 (_2!4886 lt!169810)) lt!171620)))

(declare-fun bs!8799 () Bool)

(assert (= bs!8799 d!36246))

(assert (=> bs!8799 m!167579))

(declare-fun m!168555 () Bool)

(assert (=> bs!8799 m!168555))

(assert (=> d!35792 d!36246))

(declare-fun d!36248 () Bool)

(declare-fun e!73923 () Bool)

(assert (=> d!36248 e!73923))

(declare-fun res!93037 () Bool)

(assert (=> d!36248 (=> (not res!93037) (not e!73923))))

(declare-fun lt!171622 () (_ BitVec 64))

(declare-fun lt!171621 () BitStream!4102)

(assert (=> d!36248 (= res!93037 (= (bvadd lt!171622 (bvsub lt!170832 lt!170839)) (bitIndex!0 (size!2314 (buf!2717 lt!171621)) (currentByte!5283 lt!171621) (currentBit!5278 lt!171621))))))

(assert (=> d!36248 (or (not (= (bvand lt!171622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170832 lt!170839) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171622 (bvsub lt!170832 lt!170839)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36248 (= lt!171622 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170838))) (currentByte!5283 (_2!4888 lt!170838)) (currentBit!5278 (_2!4888 lt!170838))))))

(assert (=> d!36248 (= lt!171621 (_2!4886 (moveBitIndex!0 (_2!4888 lt!170838) (bvsub lt!170832 lt!170839))))))

(assert (=> d!36248 (moveBitIndexPrecond!0 (_2!4888 lt!170838) (bvsub lt!170832 lt!170839))))

(assert (=> d!36248 (= (withMovedBitIndex!0 (_2!4888 lt!170838) (bvsub lt!170832 lt!170839)) lt!171621)))

(declare-fun b!112676 () Bool)

(assert (=> b!112676 (= e!73923 (= (size!2314 (buf!2717 (_2!4888 lt!170838))) (size!2314 (buf!2717 lt!171621))))))

(assert (= (and d!36248 res!93037) b!112676))

(declare-fun m!168557 () Bool)

(assert (=> d!36248 m!168557))

(assert (=> d!36248 m!168533))

(declare-fun m!168559 () Bool)

(assert (=> d!36248 m!168559))

(declare-fun m!168561 () Bool)

(assert (=> d!36248 m!168561))

(assert (=> b!112198 d!36248))

(assert (=> b!112198 d!35836))

(assert (=> b!112198 d!35828))

(declare-fun d!36250 () Bool)

(assert (=> d!36250 (= (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) ((_ sign_extend 32) (currentByte!5283 thiss!1305)) ((_ sign_extend 32) (currentBit!5278 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2314 (buf!2717 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 thiss!1305)))))))

(assert (=> d!35850 d!36250))

(declare-fun d!36252 () Bool)

(declare-fun e!73924 () Bool)

(assert (=> d!36252 e!73924))

(declare-fun res!93038 () Bool)

(assert (=> d!36252 (=> (not res!93038) (not e!73924))))

(declare-fun lt!171623 () (_ BitVec 64))

(declare-fun lt!171628 () (_ BitVec 64))

(declare-fun lt!171626 () (_ BitVec 64))

(assert (=> d!36252 (= res!93038 (= lt!171626 (bvsub lt!171628 lt!171623)))))

(assert (=> d!36252 (or (= (bvand lt!171628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171628 lt!171623) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36252 (= lt!171623 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170854)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170854))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170854)))))))

(declare-fun lt!171627 () (_ BitVec 64))

(declare-fun lt!171625 () (_ BitVec 64))

(assert (=> d!36252 (= lt!171628 (bvmul lt!171627 lt!171625))))

(assert (=> d!36252 (or (= lt!171627 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171625 (bvsdiv (bvmul lt!171627 lt!171625) lt!171627)))))

(assert (=> d!36252 (= lt!171625 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36252 (= lt!171627 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170854)))))))

(assert (=> d!36252 (= lt!171626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170854))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170854)))))))

(assert (=> d!36252 (invariant!0 (currentBit!5278 (_2!4886 lt!170854)) (currentByte!5283 (_2!4886 lt!170854)) (size!2314 (buf!2717 (_2!4886 lt!170854))))))

(assert (=> d!36252 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170854))) (currentByte!5283 (_2!4886 lt!170854)) (currentBit!5278 (_2!4886 lt!170854))) lt!171626)))

(declare-fun b!112677 () Bool)

(declare-fun res!93039 () Bool)

(assert (=> b!112677 (=> (not res!93039) (not e!73924))))

(assert (=> b!112677 (= res!93039 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171626))))

(declare-fun b!112678 () Bool)

(declare-fun lt!171624 () (_ BitVec 64))

(assert (=> b!112678 (= e!73924 (bvsle lt!171626 (bvmul lt!171624 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112678 (or (= lt!171624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171624)))))

(assert (=> b!112678 (= lt!171624 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170854)))))))

(assert (= (and d!36252 res!93038) b!112677))

(assert (= (and b!112677 res!93039) b!112678))

(declare-fun m!168563 () Bool)

(assert (=> d!36252 m!168563))

(assert (=> d!36252 m!168437))

(assert (=> b!112211 d!36252))

(assert (=> b!112211 d!35830))

(declare-fun d!36254 () Bool)

(assert (=> d!36254 (isPrefixOf!0 lt!170917 (_2!4886 lt!169807))))

(declare-fun lt!171629 () Unit!6847)

(assert (=> d!36254 (= lt!171629 (choose!30 lt!170917 (_2!4886 lt!169807) (_2!4886 lt!169807)))))

(assert (=> d!36254 (isPrefixOf!0 lt!170917 (_2!4886 lt!169807))))

(assert (=> d!36254 (= (lemmaIsPrefixTransitive!0 lt!170917 (_2!4886 lt!169807) (_2!4886 lt!169807)) lt!171629)))

(declare-fun bs!8800 () Bool)

(assert (= bs!8800 d!36254))

(assert (=> bs!8800 m!167675))

(declare-fun m!168565 () Bool)

(assert (=> bs!8800 m!168565))

(assert (=> bs!8800 m!167675))

(assert (=> d!35822 d!36254))

(declare-fun d!36256 () Bool)

(assert (=> d!36256 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!171630 () Unit!6847)

(assert (=> d!36256 (= lt!171630 (choose!11 thiss!1305))))

(assert (=> d!36256 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!171630)))

(declare-fun bs!8801 () Bool)

(assert (= bs!8801 d!36256))

(assert (=> bs!8801 m!167663))

(declare-fun m!168567 () Bool)

(assert (=> bs!8801 m!168567))

(assert (=> d!35822 d!36256))

(declare-fun d!36258 () Bool)

(declare-fun res!93042 () Bool)

(declare-fun e!73926 () Bool)

(assert (=> d!36258 (=> (not res!93042) (not e!73926))))

(assert (=> d!36258 (= res!93042 (= (size!2314 (buf!2717 lt!170917)) (size!2314 (buf!2717 lt!170917))))))

(assert (=> d!36258 (= (isPrefixOf!0 lt!170917 lt!170917) e!73926)))

(declare-fun b!112679 () Bool)

(declare-fun res!93040 () Bool)

(assert (=> b!112679 (=> (not res!93040) (not e!73926))))

(assert (=> b!112679 (= res!93040 (bvsle (bitIndex!0 (size!2314 (buf!2717 lt!170917)) (currentByte!5283 lt!170917) (currentBit!5278 lt!170917)) (bitIndex!0 (size!2314 (buf!2717 lt!170917)) (currentByte!5283 lt!170917) (currentBit!5278 lt!170917))))))

(declare-fun b!112680 () Bool)

(declare-fun e!73925 () Bool)

(assert (=> b!112680 (= e!73926 e!73925)))

(declare-fun res!93041 () Bool)

(assert (=> b!112680 (=> res!93041 e!73925)))

(assert (=> b!112680 (= res!93041 (= (size!2314 (buf!2717 lt!170917)) #b00000000000000000000000000000000))))

(declare-fun b!112681 () Bool)

(assert (=> b!112681 (= e!73925 (arrayBitRangesEq!0 (buf!2717 lt!170917) (buf!2717 lt!170917) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 lt!170917)) (currentByte!5283 lt!170917) (currentBit!5278 lt!170917))))))

(assert (= (and d!36258 res!93042) b!112679))

(assert (= (and b!112679 res!93040) b!112680))

(assert (= (and b!112680 (not res!93041)) b!112681))

(declare-fun m!168569 () Bool)

(assert (=> b!112679 m!168569))

(assert (=> b!112679 m!168569))

(assert (=> b!112681 m!168569))

(assert (=> b!112681 m!168569))

(declare-fun m!168571 () Bool)

(assert (=> b!112681 m!168571))

(assert (=> d!35822 d!36258))

(assert (=> d!35822 d!36240))

(assert (=> d!35822 d!35806))

(assert (=> d!35822 d!36244))

(declare-fun d!36260 () Bool)

(assert (=> d!36260 (isPrefixOf!0 lt!170917 lt!170917)))

(declare-fun lt!171631 () Unit!6847)

(assert (=> d!36260 (= lt!171631 (choose!11 lt!170917))))

(assert (=> d!36260 (= (lemmaIsPrefixRefl!0 lt!170917) lt!171631)))

(declare-fun bs!8802 () Bool)

(assert (= bs!8802 d!36260))

(assert (=> bs!8802 m!167667))

(declare-fun m!168573 () Bool)

(assert (=> bs!8802 m!168573))

(assert (=> d!35822 d!36260))

(declare-fun d!36262 () Bool)

(declare-fun res!93045 () Bool)

(declare-fun e!73928 () Bool)

(assert (=> d!36262 (=> (not res!93045) (not e!73928))))

(assert (=> d!36262 (= res!93045 (= (size!2314 (buf!2717 thiss!1305)) (size!2314 (buf!2717 thiss!1305))))))

(assert (=> d!36262 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!73928)))

(declare-fun b!112682 () Bool)

(declare-fun res!93043 () Bool)

(assert (=> b!112682 (=> (not res!93043) (not e!73928))))

(assert (=> b!112682 (= res!93043 (bvsle (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305)) (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(declare-fun b!112683 () Bool)

(declare-fun e!73927 () Bool)

(assert (=> b!112683 (= e!73928 e!73927)))

(declare-fun res!93044 () Bool)

(assert (=> b!112683 (=> res!93044 e!73927)))

(assert (=> b!112683 (= res!93044 (= (size!2314 (buf!2717 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112684 () Bool)

(assert (=> b!112684 (= e!73927 (arrayBitRangesEq!0 (buf!2717 thiss!1305) (buf!2717 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 thiss!1305)) (currentByte!5283 thiss!1305) (currentBit!5278 thiss!1305))))))

(assert (= (and d!36262 res!93045) b!112682))

(assert (= (and b!112682 res!93043) b!112683))

(assert (= (and b!112683 (not res!93044)) b!112684))

(assert (=> b!112682 m!166833))

(assert (=> b!112682 m!166833))

(assert (=> b!112684 m!166833))

(assert (=> b!112684 m!166833))

(declare-fun m!168575 () Bool)

(assert (=> b!112684 m!168575))

(assert (=> d!35822 d!36262))

(declare-fun d!36264 () Bool)

(declare-fun res!93048 () Bool)

(declare-fun e!73930 () Bool)

(assert (=> d!36264 (=> (not res!93048) (not e!73930))))

(assert (=> d!36264 (= res!93048 (= (size!2314 (buf!2717 lt!170917)) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (=> d!36264 (= (isPrefixOf!0 lt!170917 (_2!4886 lt!169807)) e!73930)))

(declare-fun b!112685 () Bool)

(declare-fun res!93046 () Bool)

(assert (=> b!112685 (=> (not res!93046) (not e!73930))))

(assert (=> b!112685 (= res!93046 (bvsle (bitIndex!0 (size!2314 (buf!2717 lt!170917)) (currentByte!5283 lt!170917) (currentBit!5278 lt!170917)) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807)))))))

(declare-fun b!112686 () Bool)

(declare-fun e!73929 () Bool)

(assert (=> b!112686 (= e!73930 e!73929)))

(declare-fun res!93047 () Bool)

(assert (=> b!112686 (=> res!93047 e!73929)))

(assert (=> b!112686 (= res!93047 (= (size!2314 (buf!2717 lt!170917)) #b00000000000000000000000000000000))))

(declare-fun b!112687 () Bool)

(assert (=> b!112687 (= e!73929 (arrayBitRangesEq!0 (buf!2717 lt!170917) (buf!2717 (_2!4886 lt!169807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 lt!170917)) (currentByte!5283 lt!170917) (currentBit!5278 lt!170917))))))

(assert (= (and d!36264 res!93048) b!112685))

(assert (= (and b!112685 res!93046) b!112686))

(assert (= (and b!112686 (not res!93047)) b!112687))

(assert (=> b!112685 m!168569))

(assert (=> b!112685 m!166831))

(assert (=> b!112687 m!168569))

(assert (=> b!112687 m!168569))

(declare-fun m!168577 () Bool)

(assert (=> b!112687 m!168577))

(assert (=> d!35822 d!36264))

(declare-fun d!36266 () Bool)

(declare-fun res!93051 () Bool)

(declare-fun e!73932 () Bool)

(assert (=> d!36266 (=> (not res!93051) (not e!73932))))

(assert (=> d!36266 (= res!93051 (= (size!2314 (buf!2717 (_1!4888 lt!170921))) (size!2314 (buf!2717 (_2!4888 lt!170921)))))))

(assert (=> d!36266 (= (isPrefixOf!0 (_1!4888 lt!170921) (_2!4888 lt!170921)) e!73932)))

(declare-fun b!112688 () Bool)

(declare-fun res!93049 () Bool)

(assert (=> b!112688 (=> (not res!93049) (not e!73932))))

(assert (=> b!112688 (= res!93049 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170921))) (currentByte!5283 (_1!4888 lt!170921)) (currentBit!5278 (_1!4888 lt!170921))) (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170921))) (currentByte!5283 (_2!4888 lt!170921)) (currentBit!5278 (_2!4888 lt!170921)))))))

(declare-fun b!112689 () Bool)

(declare-fun e!73931 () Bool)

(assert (=> b!112689 (= e!73932 e!73931)))

(declare-fun res!93050 () Bool)

(assert (=> b!112689 (=> res!93050 e!73931)))

(assert (=> b!112689 (= res!93050 (= (size!2314 (buf!2717 (_1!4888 lt!170921))) #b00000000000000000000000000000000))))

(declare-fun b!112690 () Bool)

(assert (=> b!112690 (= e!73931 (arrayBitRangesEq!0 (buf!2717 (_1!4888 lt!170921)) (buf!2717 (_2!4888 lt!170921)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170921))) (currentByte!5283 (_1!4888 lt!170921)) (currentBit!5278 (_1!4888 lt!170921)))))))

(assert (= (and d!36266 res!93051) b!112688))

(assert (= (and b!112688 res!93049) b!112689))

(assert (= (and b!112689 (not res!93050)) b!112690))

(assert (=> b!112688 m!168387))

(assert (=> b!112688 m!168475))

(assert (=> b!112690 m!168387))

(assert (=> b!112690 m!168387))

(declare-fun m!168579 () Bool)

(assert (=> b!112690 m!168579))

(assert (=> d!35822 d!36266))

(declare-fun d!36268 () Bool)

(assert (=> d!36268 (isPrefixOf!0 lt!170917 (_2!4886 lt!169807))))

(declare-fun lt!171632 () Unit!6847)

(assert (=> d!36268 (= lt!171632 (choose!30 lt!170917 thiss!1305 (_2!4886 lt!169807)))))

(assert (=> d!36268 (isPrefixOf!0 lt!170917 thiss!1305)))

(assert (=> d!36268 (= (lemmaIsPrefixTransitive!0 lt!170917 thiss!1305 (_2!4886 lt!169807)) lt!171632)))

(declare-fun bs!8803 () Bool)

(assert (= bs!8803 d!36268))

(assert (=> bs!8803 m!167675))

(declare-fun m!168581 () Bool)

(assert (=> bs!8803 m!168581))

(declare-fun m!168583 () Bool)

(assert (=> bs!8803 m!168583))

(assert (=> d!35822 d!36268))

(declare-fun d!36270 () Bool)

(declare-fun e!73933 () Bool)

(assert (=> d!36270 e!73933))

(declare-fun res!93052 () Bool)

(assert (=> d!36270 (=> (not res!93052) (not e!73933))))

(assert (=> d!36270 (= res!93052 (= (buf!2717 (_2!4886 (increaseBitIndex!0 lt!169794))) (buf!2717 lt!169794)))))

(declare-fun lt!171636 () Bool)

(assert (=> d!36270 (= lt!171636 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 lt!169794)) (currentByte!5283 lt!169794))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 lt!169794)))) #b00000000000000000000000000000000)))))

(declare-fun lt!171634 () tuple2!9284)

(assert (=> d!36270 (= lt!171634 (tuple2!9285 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 lt!169794)) (currentByte!5283 lt!169794))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 lt!169794)))) #b00000000000000000000000000000000)) (_2!4886 (increaseBitIndex!0 lt!169794))))))

(assert (=> d!36270 (validate_offset_bit!0 ((_ sign_extend 32) (size!2314 (buf!2717 lt!169794))) ((_ sign_extend 32) (currentByte!5283 lt!169794)) ((_ sign_extend 32) (currentBit!5278 lt!169794)))))

(assert (=> d!36270 (= (readBit!0 lt!169794) lt!171634)))

(declare-fun lt!171637 () (_ BitVec 64))

(declare-fun lt!171635 () (_ BitVec 64))

(declare-fun b!112691 () Bool)

(assert (=> b!112691 (= e!73933 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 (increaseBitIndex!0 lt!169794)))) (currentByte!5283 (_2!4886 (increaseBitIndex!0 lt!169794))) (currentBit!5278 (_2!4886 (increaseBitIndex!0 lt!169794)))) (bvadd lt!171637 lt!171635)))))

(assert (=> b!112691 (or (not (= (bvand lt!171637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171635 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171637 lt!171635) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112691 (= lt!171635 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112691 (= lt!171637 (bitIndex!0 (size!2314 (buf!2717 lt!169794)) (currentByte!5283 lt!169794) (currentBit!5278 lt!169794)))))

(declare-fun lt!171633 () Bool)

(assert (=> b!112691 (= lt!171633 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 lt!169794)) (currentByte!5283 lt!169794))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 lt!169794)))) #b00000000000000000000000000000000)))))

(declare-fun lt!171638 () Bool)

(assert (=> b!112691 (= lt!171638 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 lt!169794)) (currentByte!5283 lt!169794))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 lt!169794)))) #b00000000000000000000000000000000)))))

(declare-fun lt!171639 () Bool)

(assert (=> b!112691 (= lt!171639 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 lt!169794)) (currentByte!5283 lt!169794))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 lt!169794)))) #b00000000000000000000000000000000)))))

(assert (= (and d!36270 res!93052) b!112691))

(declare-fun m!168585 () Bool)

(assert (=> d!36270 m!168585))

(declare-fun m!168587 () Bool)

(assert (=> d!36270 m!168587))

(declare-fun m!168589 () Bool)

(assert (=> d!36270 m!168589))

(declare-fun m!168591 () Bool)

(assert (=> d!36270 m!168591))

(declare-fun m!168593 () Bool)

(assert (=> b!112691 m!168593))

(declare-fun m!168595 () Bool)

(assert (=> b!112691 m!168595))

(assert (=> b!112691 m!168585))

(assert (=> b!112691 m!168589))

(assert (=> b!112691 m!168587))

(assert (=> d!35796 d!36270))

(declare-fun d!36272 () Bool)

(declare-fun e!73934 () Bool)

(assert (=> d!36272 e!73934))

(declare-fun res!93053 () Bool)

(assert (=> d!36272 (=> (not res!93053) (not e!73934))))

(declare-fun lt!171640 () BitStream!4102)

(declare-fun lt!171641 () (_ BitVec 64))

(assert (=> d!36272 (= res!93053 (= (bvadd lt!171641 (bvsub lt!170915 lt!170922)) (bitIndex!0 (size!2314 (buf!2717 lt!171640)) (currentByte!5283 lt!171640) (currentBit!5278 lt!171640))))))

(assert (=> d!36272 (or (not (= (bvand lt!171641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170915 lt!170922) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171641 (bvsub lt!170915 lt!170922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36272 (= lt!171641 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170921))) (currentByte!5283 (_2!4888 lt!170921)) (currentBit!5278 (_2!4888 lt!170921))))))

(assert (=> d!36272 (= lt!171640 (_2!4886 (moveBitIndex!0 (_2!4888 lt!170921) (bvsub lt!170915 lt!170922))))))

(assert (=> d!36272 (moveBitIndexPrecond!0 (_2!4888 lt!170921) (bvsub lt!170915 lt!170922))))

(assert (=> d!36272 (= (withMovedBitIndex!0 (_2!4888 lt!170921) (bvsub lt!170915 lt!170922)) lt!171640)))

(declare-fun b!112692 () Bool)

(assert (=> b!112692 (= e!73934 (= (size!2314 (buf!2717 (_2!4888 lt!170921))) (size!2314 (buf!2717 lt!171640))))))

(assert (= (and d!36272 res!93053) b!112692))

(declare-fun m!168597 () Bool)

(assert (=> d!36272 m!168597))

(assert (=> d!36272 m!168475))

(declare-fun m!168599 () Bool)

(assert (=> d!36272 m!168599))

(declare-fun m!168601 () Bool)

(assert (=> d!36272 m!168601))

(assert (=> b!112236 d!36272))

(assert (=> b!112236 d!35836))

(assert (=> b!112236 d!35830))

(declare-fun d!36274 () Bool)

(declare-fun res!93056 () Bool)

(declare-fun e!73936 () Bool)

(assert (=> d!36274 (=> (not res!93056) (not e!73936))))

(assert (=> d!36274 (= res!93056 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) (size!2314 (buf!2717 (_2!4886 lt!170766)))))))

(assert (=> d!36274 (= (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!170766)) e!73936)))

(declare-fun b!112693 () Bool)

(declare-fun res!93054 () Bool)

(assert (=> b!112693 (=> (not res!93054) (not e!73936))))

(assert (=> b!112693 (= res!93054 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170766))) (currentByte!5283 (_2!4886 lt!170766)) (currentBit!5278 (_2!4886 lt!170766)))))))

(declare-fun b!112694 () Bool)

(declare-fun e!73935 () Bool)

(assert (=> b!112694 (= e!73936 e!73935)))

(declare-fun res!93055 () Bool)

(assert (=> b!112694 (=> res!93055 e!73935)))

(assert (=> b!112694 (= res!93055 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) #b00000000000000000000000000000000))))

(declare-fun b!112695 () Bool)

(assert (=> b!112695 (= e!73935 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!170766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(assert (= (and d!36274 res!93056) b!112693))

(assert (= (and b!112693 res!93054) b!112694))

(assert (= (and b!112694 (not res!93055)) b!112695))

(assert (=> b!112693 m!166841))

(assert (=> b!112693 m!167567))

(assert (=> b!112695 m!166841))

(assert (=> b!112695 m!166841))

(declare-fun m!168603 () Bool)

(assert (=> b!112695 m!168603))

(assert (=> b!112177 d!36274))

(assert (=> d!35830 d!36250))

(assert (=> d!35830 d!36164))

(declare-fun d!36276 () Bool)

(declare-fun res!93059 () Bool)

(declare-fun e!73938 () Bool)

(assert (=> d!36276 (=> (not res!93059) (not e!73938))))

(assert (=> d!36276 (= res!93059 (= (size!2314 (buf!2717 (_2!4888 lt!170838))) (size!2314 (buf!2717 (_2!4886 lt!169807)))))))

(assert (=> d!36276 (= (isPrefixOf!0 (_2!4888 lt!170838) (_2!4886 lt!169807)) e!73938)))

(declare-fun b!112696 () Bool)

(declare-fun res!93057 () Bool)

(assert (=> b!112696 (=> (not res!93057) (not e!73938))))

(assert (=> b!112696 (= res!93057 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170838))) (currentByte!5283 (_2!4888 lt!170838)) (currentBit!5278 (_2!4888 lt!170838))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169807))) (currentByte!5283 (_2!4886 lt!169807)) (currentBit!5278 (_2!4886 lt!169807)))))))

(declare-fun b!112697 () Bool)

(declare-fun e!73937 () Bool)

(assert (=> b!112697 (= e!73938 e!73937)))

(declare-fun res!93058 () Bool)

(assert (=> b!112697 (=> res!93058 e!73937)))

(assert (=> b!112697 (= res!93058 (= (size!2314 (buf!2717 (_2!4888 lt!170838))) #b00000000000000000000000000000000))))

(declare-fun b!112698 () Bool)

(assert (=> b!112698 (= e!73937 (arrayBitRangesEq!0 (buf!2717 (_2!4888 lt!170838)) (buf!2717 (_2!4886 lt!169807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170838))) (currentByte!5283 (_2!4888 lt!170838)) (currentBit!5278 (_2!4888 lt!170838)))))))

(assert (= (and d!36276 res!93059) b!112696))

(assert (= (and b!112696 res!93057) b!112697))

(assert (= (and b!112697 (not res!93058)) b!112698))

(assert (=> b!112696 m!168533))

(assert (=> b!112696 m!166831))

(assert (=> b!112698 m!168533))

(assert (=> b!112698 m!168533))

(declare-fun m!168605 () Bool)

(assert (=> b!112698 m!168605))

(assert (=> b!112201 d!36276))

(declare-fun d!36278 () Bool)

(declare-fun e!73939 () Bool)

(assert (=> d!36278 e!73939))

(declare-fun res!93060 () Bool)

(assert (=> d!36278 (=> (not res!93060) (not e!73939))))

(declare-fun lt!171647 () (_ BitVec 64))

(declare-fun lt!171645 () (_ BitVec 64))

(declare-fun lt!171642 () (_ BitVec 64))

(assert (=> d!36278 (= res!93060 (= lt!171645 (bvsub lt!171647 lt!171642)))))

(assert (=> d!36278 (or (= (bvand lt!171647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171642 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171647 lt!171642) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36278 (= lt!171642 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170765)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170765))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170765)))))))

(declare-fun lt!171646 () (_ BitVec 64))

(declare-fun lt!171644 () (_ BitVec 64))

(assert (=> d!36278 (= lt!171647 (bvmul lt!171646 lt!171644))))

(assert (=> d!36278 (or (= lt!171646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171644 (bvsdiv (bvmul lt!171646 lt!171644) lt!171646)))))

(assert (=> d!36278 (= lt!171644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36278 (= lt!171646 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170765)))))))

(assert (=> d!36278 (= lt!171645 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170765))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170765)))))))

(assert (=> d!36278 (invariant!0 (currentBit!5278 (_1!4887 lt!170765)) (currentByte!5283 (_1!4887 lt!170765)) (size!2314 (buf!2717 (_1!4887 lt!170765))))))

(assert (=> d!36278 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170765))) (currentByte!5283 (_1!4887 lt!170765)) (currentBit!5278 (_1!4887 lt!170765))) lt!171645)))

(declare-fun b!112699 () Bool)

(declare-fun res!93061 () Bool)

(assert (=> b!112699 (=> (not res!93061) (not e!73939))))

(assert (=> b!112699 (= res!93061 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171645))))

(declare-fun b!112700 () Bool)

(declare-fun lt!171643 () (_ BitVec 64))

(assert (=> b!112700 (= e!73939 (bvsle lt!171645 (bvmul lt!171643 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112700 (or (= lt!171643 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171643 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171643)))))

(assert (=> b!112700 (= lt!171643 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170765)))))))

(assert (= (and d!36278 res!93060) b!112699))

(assert (= (and b!112699 res!93061) b!112700))

(declare-fun m!168607 () Bool)

(assert (=> d!36278 m!168607))

(declare-fun m!168609 () Bool)

(assert (=> d!36278 m!168609))

(assert (=> b!112175 d!36278))

(assert (=> b!112175 d!36186))

(declare-fun d!36280 () Bool)

(declare-fun e!73940 () Bool)

(assert (=> d!36280 e!73940))

(declare-fun res!93062 () Bool)

(assert (=> d!36280 (=> (not res!93062) (not e!73940))))

(declare-fun lt!171653 () (_ BitVec 64))

(declare-fun lt!171648 () (_ BitVec 64))

(declare-fun lt!171651 () (_ BitVec 64))

(assert (=> d!36280 (= res!93062 (= lt!171651 (bvsub lt!171653 lt!171648)))))

(assert (=> d!36280 (or (= (bvand lt!171653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171648 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171653 lt!171648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36280 (= lt!171648 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170855)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170855))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170855)))))))

(declare-fun lt!171652 () (_ BitVec 64))

(declare-fun lt!171650 () (_ BitVec 64))

(assert (=> d!36280 (= lt!171653 (bvmul lt!171652 lt!171650))))

(assert (=> d!36280 (or (= lt!171652 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171650 (bvsdiv (bvmul lt!171652 lt!171650) lt!171652)))))

(assert (=> d!36280 (= lt!171650 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36280 (= lt!171652 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170855)))))))

(assert (=> d!36280 (= lt!171651 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170855))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170855)))))))

(assert (=> d!36280 (invariant!0 (currentBit!5278 (_1!4887 lt!170855)) (currentByte!5283 (_1!4887 lt!170855)) (size!2314 (buf!2717 (_1!4887 lt!170855))))))

(assert (=> d!36280 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170855))) (currentByte!5283 (_1!4887 lt!170855)) (currentBit!5278 (_1!4887 lt!170855))) lt!171651)))

(declare-fun b!112701 () Bool)

(declare-fun res!93063 () Bool)

(assert (=> b!112701 (=> (not res!93063) (not e!73940))))

(assert (=> b!112701 (= res!93063 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171651))))

(declare-fun b!112702 () Bool)

(declare-fun lt!171649 () (_ BitVec 64))

(assert (=> b!112702 (= e!73940 (bvsle lt!171651 (bvmul lt!171649 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112702 (or (= lt!171649 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171649 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171649)))))

(assert (=> b!112702 (= lt!171649 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170855)))))))

(assert (= (and d!36280 res!93062) b!112701))

(assert (= (and b!112701 res!93063) b!112702))

(declare-fun m!168611 () Bool)

(assert (=> d!36280 m!168611))

(declare-fun m!168613 () Bool)

(assert (=> d!36280 m!168613))

(assert (=> b!112214 d!36280))

(assert (=> b!112214 d!36252))

(declare-fun b!112703 () Bool)

(declare-fun res!93066 () Bool)

(declare-fun e!73942 () Bool)

(assert (=> b!112703 (=> (not res!93066) (not e!73942))))

(declare-fun lt!171668 () tuple2!9256)

(assert (=> b!112703 (= res!93066 (isPrefixOf!0 (_1!4888 lt!171668) (_2!4886 lt!169810)))))

(declare-fun lt!171669 () (_ BitVec 64))

(declare-fun lt!171662 () (_ BitVec 64))

(declare-fun b!112704 () Bool)

(assert (=> b!112704 (= e!73942 (= (_1!4888 lt!171668) (withMovedBitIndex!0 (_2!4888 lt!171668) (bvsub lt!171662 lt!171669))))))

(assert (=> b!112704 (or (= (bvand lt!171662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171669 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171662 lt!171669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112704 (= lt!171669 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))))

(assert (=> b!112704 (= lt!171662 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(declare-fun b!112705 () Bool)

(declare-fun e!73941 () Unit!6847)

(declare-fun Unit!6917 () Unit!6847)

(assert (=> b!112705 (= e!73941 Unit!6917)))

(declare-fun d!36282 () Bool)

(assert (=> d!36282 e!73942))

(declare-fun res!93064 () Bool)

(assert (=> d!36282 (=> (not res!93064) (not e!73942))))

(assert (=> d!36282 (= res!93064 (isPrefixOf!0 (_1!4888 lt!171668) (_2!4888 lt!171668)))))

(declare-fun lt!171664 () BitStream!4102)

(assert (=> d!36282 (= lt!171668 (tuple2!9257 lt!171664 (_2!4886 lt!170774)))))

(declare-fun lt!171658 () Unit!6847)

(declare-fun lt!171663 () Unit!6847)

(assert (=> d!36282 (= lt!171658 lt!171663)))

(assert (=> d!36282 (isPrefixOf!0 lt!171664 (_2!4886 lt!170774))))

(assert (=> d!36282 (= lt!171663 (lemmaIsPrefixTransitive!0 lt!171664 (_2!4886 lt!170774) (_2!4886 lt!170774)))))

(declare-fun lt!171656 () Unit!6847)

(declare-fun lt!171670 () Unit!6847)

(assert (=> d!36282 (= lt!171656 lt!171670)))

(assert (=> d!36282 (isPrefixOf!0 lt!171664 (_2!4886 lt!170774))))

(assert (=> d!36282 (= lt!171670 (lemmaIsPrefixTransitive!0 lt!171664 (_2!4886 lt!169810) (_2!4886 lt!170774)))))

(declare-fun lt!171673 () Unit!6847)

(assert (=> d!36282 (= lt!171673 e!73941)))

(declare-fun c!6867 () Bool)

(assert (=> d!36282 (= c!6867 (not (= (size!2314 (buf!2717 (_2!4886 lt!169810))) #b00000000000000000000000000000000)))))

(declare-fun lt!171666 () Unit!6847)

(declare-fun lt!171672 () Unit!6847)

(assert (=> d!36282 (= lt!171666 lt!171672)))

(assert (=> d!36282 (isPrefixOf!0 (_2!4886 lt!170774) (_2!4886 lt!170774))))

(assert (=> d!36282 (= lt!171672 (lemmaIsPrefixRefl!0 (_2!4886 lt!170774)))))

(declare-fun lt!171654 () Unit!6847)

(declare-fun lt!171661 () Unit!6847)

(assert (=> d!36282 (= lt!171654 lt!171661)))

(assert (=> d!36282 (= lt!171661 (lemmaIsPrefixRefl!0 (_2!4886 lt!170774)))))

(declare-fun lt!171657 () Unit!6847)

(declare-fun lt!171659 () Unit!6847)

(assert (=> d!36282 (= lt!171657 lt!171659)))

(assert (=> d!36282 (isPrefixOf!0 lt!171664 lt!171664)))

(assert (=> d!36282 (= lt!171659 (lemmaIsPrefixRefl!0 lt!171664))))

(declare-fun lt!171665 () Unit!6847)

(declare-fun lt!171667 () Unit!6847)

(assert (=> d!36282 (= lt!171665 lt!171667)))

(assert (=> d!36282 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!169810))))

(assert (=> d!36282 (= lt!171667 (lemmaIsPrefixRefl!0 (_2!4886 lt!169810)))))

(assert (=> d!36282 (= lt!171664 (BitStream!4103 (buf!2717 (_2!4886 lt!170774)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> d!36282 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!170774))))

(assert (=> d!36282 (= (reader!0 (_2!4886 lt!169810) (_2!4886 lt!170774)) lt!171668)))

(declare-fun b!112706 () Bool)

(declare-fun lt!171660 () Unit!6847)

(assert (=> b!112706 (= e!73941 lt!171660)))

(declare-fun lt!171671 () (_ BitVec 64))

(assert (=> b!112706 (= lt!171671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!171655 () (_ BitVec 64))

(assert (=> b!112706 (= lt!171655 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> b!112706 (= lt!171660 (arrayBitRangesEqSymmetric!0 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!170774)) lt!171671 lt!171655))))

(assert (=> b!112706 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!170774)) (buf!2717 (_2!4886 lt!169810)) lt!171671 lt!171655)))

(declare-fun b!112707 () Bool)

(declare-fun res!93065 () Bool)

(assert (=> b!112707 (=> (not res!93065) (not e!73942))))

(assert (=> b!112707 (= res!93065 (isPrefixOf!0 (_2!4888 lt!171668) (_2!4886 lt!170774)))))

(assert (= (and d!36282 c!6867) b!112706))

(assert (= (and d!36282 (not c!6867)) b!112705))

(assert (= (and d!36282 res!93064) b!112703))

(assert (= (and b!112703 res!93066) b!112707))

(assert (= (and b!112707 res!93065) b!112704))

(assert (=> b!112706 m!166841))

(declare-fun m!168615 () Bool)

(assert (=> b!112706 m!168615))

(declare-fun m!168617 () Bool)

(assert (=> b!112706 m!168617))

(assert (=> d!36282 m!167577))

(assert (=> d!36282 m!167579))

(declare-fun m!168619 () Bool)

(assert (=> d!36282 m!168619))

(declare-fun m!168621 () Bool)

(assert (=> d!36282 m!168621))

(declare-fun m!168623 () Bool)

(assert (=> d!36282 m!168623))

(declare-fun m!168625 () Bool)

(assert (=> d!36282 m!168625))

(declare-fun m!168627 () Bool)

(assert (=> d!36282 m!168627))

(declare-fun m!168629 () Bool)

(assert (=> d!36282 m!168629))

(declare-fun m!168631 () Bool)

(assert (=> d!36282 m!168631))

(declare-fun m!168633 () Bool)

(assert (=> d!36282 m!168633))

(declare-fun m!168635 () Bool)

(assert (=> d!36282 m!168635))

(declare-fun m!168637 () Bool)

(assert (=> b!112707 m!168637))

(declare-fun m!168639 () Bool)

(assert (=> b!112703 m!168639))

(declare-fun m!168641 () Bool)

(assert (=> b!112704 m!168641))

(assert (=> b!112704 m!167537))

(assert (=> b!112704 m!166841))

(assert (=> b!112182 d!36282))

(declare-fun d!36284 () Bool)

(declare-fun lt!171674 () tuple2!9284)

(assert (=> d!36284 (= lt!171674 (readBit!0 lt!170783))))

(assert (=> d!36284 (= (readBitPure!0 lt!170783) (tuple2!9255 (_2!4902 lt!171674) (_1!4902 lt!171674)))))

(declare-fun bs!8804 () Bool)

(assert (= bs!8804 d!36284))

(declare-fun m!168643 () Bool)

(assert (=> bs!8804 m!168643))

(assert (=> b!112182 d!36284))

(declare-fun d!36286 () Bool)

(assert (=> d!36286 (= (invariant!0 (currentBit!5278 lt!170783) (currentByte!5283 lt!170783) (size!2314 (buf!2717 (_2!4886 lt!170774)))) (and (bvsge (currentBit!5278 lt!170783) #b00000000000000000000000000000000) (bvslt (currentBit!5278 lt!170783) #b00000000000000000000000000001000) (bvsge (currentByte!5283 lt!170783) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 lt!170783) (size!2314 (buf!2717 (_2!4886 lt!170774)))) (and (= (currentBit!5278 lt!170783) #b00000000000000000000000000000000) (= (currentByte!5283 lt!170783) (size!2314 (buf!2717 (_2!4886 lt!170774))))))))))

(assert (=> b!112182 d!36286))

(declare-fun lt!171675 () tuple2!9286)

(declare-fun d!36288 () Bool)

(assert (=> d!36288 (= lt!171675 (readNLeastSignificantBitsLoop!0 (_1!4888 lt!170756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170779))))

(assert (=> d!36288 (= (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!170756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170779) (tuple2!9259 (_2!4903 lt!171675) (_1!4903 lt!171675)))))

(declare-fun bs!8805 () Bool)

(assert (= bs!8805 d!36288))

(declare-fun m!168645 () Bool)

(assert (=> bs!8805 m!168645))

(assert (=> b!112182 d!36288))

(declare-fun d!36290 () Bool)

(declare-fun lt!171676 () tuple2!9284)

(assert (=> d!36290 (= lt!171676 (readBit!0 (_1!4888 lt!170756)))))

(assert (=> d!36290 (= (readBitPure!0 (_1!4888 lt!170756)) (tuple2!9255 (_2!4902 lt!171676) (_1!4902 lt!171676)))))

(declare-fun bs!8806 () Bool)

(assert (= bs!8806 d!36290))

(declare-fun m!168647 () Bool)

(assert (=> bs!8806 m!168647))

(assert (=> b!112182 d!36290))

(declare-fun d!36292 () Bool)

(declare-fun e!73943 () Bool)

(assert (=> d!36292 e!73943))

(declare-fun res!93067 () Bool)

(assert (=> d!36292 (=> (not res!93067) (not e!73943))))

(declare-fun lt!171677 () BitStream!4102)

(declare-fun lt!171678 () (_ BitVec 64))

(assert (=> d!36292 (= res!93067 (= (bvadd lt!171678 (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))) (bitIndex!0 (size!2314 (buf!2717 lt!171677)) (currentByte!5283 lt!171677) (currentBit!5278 lt!171677))))))

(assert (=> d!36292 (or (not (= (bvand lt!171678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171678 (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36292 (= lt!171678 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170756))) (currentByte!5283 (_2!4888 lt!170756)) (currentBit!5278 (_2!4888 lt!170756))))))

(assert (=> d!36292 (= lt!171677 (_2!4886 (moveBitIndex!0 (_2!4888 lt!170756) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774)))))))))

(assert (=> d!36292 (moveBitIndexPrecond!0 (_2!4888 lt!170756) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774)))))))

(assert (=> d!36292 (= (withMovedBitIndex!0 (_2!4888 lt!170756) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))) lt!171677)))

(declare-fun b!112708 () Bool)

(assert (=> b!112708 (= e!73943 (= (size!2314 (buf!2717 (_2!4888 lt!170756))) (size!2314 (buf!2717 lt!171677))))))

(assert (= (and d!36292 res!93067) b!112708))

(declare-fun m!168649 () Bool)

(assert (=> d!36292 m!168649))

(declare-fun m!168651 () Bool)

(assert (=> d!36292 m!168651))

(declare-fun m!168653 () Bool)

(assert (=> d!36292 m!168653))

(declare-fun m!168655 () Bool)

(assert (=> d!36292 m!168655))

(assert (=> b!112182 d!36292))

(assert (=> b!112182 d!36132))

(declare-fun d!36294 () Bool)

(declare-fun lt!171679 () tuple2!9284)

(assert (=> d!36294 (= lt!171679 (readBit!0 lt!170757))))

(assert (=> d!36294 (= (readBitPure!0 lt!170757) (tuple2!9255 (_2!4902 lt!171679) (_1!4902 lt!171679)))))

(declare-fun bs!8807 () Bool)

(assert (= bs!8807 d!36294))

(declare-fun m!168657 () Bool)

(assert (=> bs!8807 m!168657))

(assert (=> b!112182 d!36294))

(declare-fun d!36296 () Bool)

(assert (=> d!36296 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782))) lt!170758)))

(declare-fun lt!171680 () Unit!6847)

(assert (=> d!36296 (= lt!171680 (choose!9 (_2!4886 lt!170782) (buf!2717 (_2!4886 lt!170774)) lt!170758 (BitStream!4103 (buf!2717 (_2!4886 lt!170774)) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782)))))))

(assert (=> d!36296 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!170782) (buf!2717 (_2!4886 lt!170774)) lt!170758) lt!171680)))

(declare-fun bs!8808 () Bool)

(assert (= bs!8808 d!36296))

(assert (=> bs!8808 m!167517))

(declare-fun m!168659 () Bool)

(assert (=> bs!8808 m!168659))

(assert (=> b!112182 d!36296))

(declare-fun d!36298 () Bool)

(assert (=> d!36298 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782))) lt!170758) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782)))) lt!170758))))

(declare-fun bs!8809 () Bool)

(assert (= bs!8809 d!36298))

(declare-fun m!168661 () Bool)

(assert (=> bs!8809 m!168661))

(assert (=> b!112182 d!36298))

(declare-fun b!112709 () Bool)

(declare-fun res!93069 () Bool)

(declare-fun e!73945 () Bool)

(assert (=> b!112709 (=> (not res!93069) (not e!73945))))

(declare-fun lt!171681 () (_ BitVec 64))

(declare-fun lt!171683 () tuple2!9252)

(declare-fun lt!171682 () (_ BitVec 64))

(assert (=> b!112709 (= res!93069 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171683))) (currentByte!5283 (_2!4886 lt!171683)) (currentBit!5278 (_2!4886 lt!171683))) (bvadd lt!171682 lt!171681)))))

(assert (=> b!112709 (or (not (= (bvand lt!171682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171681 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171682 lt!171681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112709 (= lt!171681 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112709 (= lt!171682 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))))))

(declare-fun b!112710 () Bool)

(declare-fun res!93070 () Bool)

(assert (=> b!112710 (=> (not res!93070) (not e!73945))))

(assert (=> b!112710 (= res!93070 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!171683)))))

(declare-fun b!112712 () Bool)

(declare-fun e!73944 () Bool)

(declare-fun lt!171684 () tuple2!9254)

(assert (=> b!112712 (= e!73944 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171684))) (currentByte!5283 (_1!4887 lt!171684)) (currentBit!5278 (_1!4887 lt!171684))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171683))) (currentByte!5283 (_2!4886 lt!171683)) (currentBit!5278 (_2!4886 lt!171683)))))))

(declare-fun b!112711 () Bool)

(assert (=> b!112711 (= e!73945 e!73944)))

(declare-fun res!93068 () Bool)

(assert (=> b!112711 (=> (not res!93068) (not e!73944))))

(assert (=> b!112711 (= res!93068 (and (= (_2!4887 lt!171684) lt!170759) (= (_1!4887 lt!171684) (_2!4886 lt!171683))))))

(assert (=> b!112711 (= lt!171684 (readBitPure!0 (readerFrom!0 (_2!4886 lt!171683) (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)))))))

(declare-fun d!36300 () Bool)

(assert (=> d!36300 e!73945))

(declare-fun res!93071 () Bool)

(assert (=> d!36300 (=> (not res!93071) (not e!73945))))

(assert (=> d!36300 (= res!93071 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) (size!2314 (buf!2717 (_2!4886 lt!171683)))))))

(assert (=> d!36300 (= lt!171683 (choose!16 (_2!4886 lt!169810) lt!170759))))

(assert (=> d!36300 (validate_offset_bit!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))))))

(assert (=> d!36300 (= (appendBit!0 (_2!4886 lt!169810) lt!170759) lt!171683)))

(assert (= (and d!36300 res!93071) b!112709))

(assert (= (and b!112709 res!93069) b!112710))

(assert (= (and b!112710 res!93070) b!112711))

(assert (= (and b!112711 res!93068) b!112712))

(declare-fun m!168663 () Bool)

(assert (=> b!112710 m!168663))

(declare-fun m!168665 () Bool)

(assert (=> b!112712 m!168665))

(declare-fun m!168667 () Bool)

(assert (=> b!112712 m!168667))

(declare-fun m!168669 () Bool)

(assert (=> b!112711 m!168669))

(assert (=> b!112711 m!168669))

(declare-fun m!168671 () Bool)

(assert (=> b!112711 m!168671))

(declare-fun m!168673 () Bool)

(assert (=> d!36300 m!168673))

(declare-fun m!168675 () Bool)

(assert (=> d!36300 m!168675))

(assert (=> b!112709 m!168667))

(assert (=> b!112709 m!166841))

(assert (=> b!112182 d!36300))

(assert (=> b!112182 d!35828))

(declare-fun d!36302 () Bool)

(assert (=> d!36302 (= (invariant!0 (currentBit!5278 (_2!4886 lt!169810)) (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!170782)))) (and (bvsge (currentBit!5278 (_2!4886 lt!169810)) #b00000000000000000000000000000000) (bvslt (currentBit!5278 (_2!4886 lt!169810)) #b00000000000000000000000000001000) (bvsge (currentByte!5283 (_2!4886 lt!169810)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!170782)))) (and (= (currentBit!5278 (_2!4886 lt!169810)) #b00000000000000000000000000000000) (= (currentByte!5283 (_2!4886 lt!169810)) (size!2314 (buf!2717 (_2!4886 lt!170782))))))))))

(assert (=> b!112182 d!36302))

(declare-fun d!36304 () Bool)

(declare-fun e!73946 () Bool)

(assert (=> d!36304 e!73946))

(declare-fun res!93072 () Bool)

(assert (=> d!36304 (=> (not res!93072) (not e!73946))))

(declare-fun lt!171685 () (_ BitVec 64))

(declare-fun lt!171690 () (_ BitVec 64))

(declare-fun lt!171688 () (_ BitVec 64))

(assert (=> d!36304 (= res!93072 (= lt!171688 (bvsub lt!171690 lt!171685)))))

(assert (=> d!36304 (or (= (bvand lt!171690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171685 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171690 lt!171685) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36304 (= lt!171685 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170746)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170746))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170746)))))))

(declare-fun lt!171689 () (_ BitVec 64))

(declare-fun lt!171687 () (_ BitVec 64))

(assert (=> d!36304 (= lt!171690 (bvmul lt!171689 lt!171687))))

(assert (=> d!36304 (or (= lt!171689 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171687 (bvsdiv (bvmul lt!171689 lt!171687) lt!171689)))))

(assert (=> d!36304 (= lt!171687 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36304 (= lt!171689 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170746)))))))

(assert (=> d!36304 (= lt!171688 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170746))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170746)))))))

(assert (=> d!36304 (invariant!0 (currentBit!5278 (_1!4887 lt!170746)) (currentByte!5283 (_1!4887 lt!170746)) (size!2314 (buf!2717 (_1!4887 lt!170746))))))

(assert (=> d!36304 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170746))) (currentByte!5283 (_1!4887 lt!170746)) (currentBit!5278 (_1!4887 lt!170746))) lt!171688)))

(declare-fun b!112713 () Bool)

(declare-fun res!93073 () Bool)

(assert (=> b!112713 (=> (not res!93073) (not e!73946))))

(assert (=> b!112713 (= res!93073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171688))))

(declare-fun b!112714 () Bool)

(declare-fun lt!171686 () (_ BitVec 64))

(assert (=> b!112714 (= e!73946 (bvsle lt!171688 (bvmul lt!171686 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112714 (or (= lt!171686 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171686 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171686)))))

(assert (=> b!112714 (= lt!171686 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170746)))))))

(assert (= (and d!36304 res!93072) b!112713))

(assert (= (and b!112713 res!93073) b!112714))

(declare-fun m!168677 () Bool)

(assert (=> d!36304 m!168677))

(declare-fun m!168679 () Bool)

(assert (=> d!36304 m!168679))

(assert (=> b!112182 d!36304))

(declare-fun d!36306 () Bool)

(declare-fun e!73947 () Bool)

(assert (=> d!36306 e!73947))

(declare-fun res!93074 () Bool)

(assert (=> d!36306 (=> (not res!93074) (not e!73947))))

(declare-fun lt!171692 () (_ BitVec 64))

(declare-fun lt!171691 () BitStream!4102)

(assert (=> d!36306 (= res!93074 (= (bvadd lt!171692 (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))) (bitIndex!0 (size!2314 (buf!2717 lt!171691)) (currentByte!5283 lt!171691) (currentBit!5278 lt!171691))))))

(assert (=> d!36306 (or (not (= (bvand lt!171692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171692 (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36306 (= lt!171692 (bitIndex!0 (size!2314 (buf!2717 (_2!4888 lt!170771))) (currentByte!5283 (_2!4888 lt!170771)) (currentBit!5278 (_2!4888 lt!170771))))))

(assert (=> d!36306 (= lt!171691 (_2!4886 (moveBitIndex!0 (_2!4888 lt!170771) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774)))))))))

(assert (=> d!36306 (moveBitIndexPrecond!0 (_2!4888 lt!170771) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774)))))))

(assert (=> d!36306 (= (withMovedBitIndex!0 (_2!4888 lt!170771) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))) lt!171691)))

(declare-fun b!112715 () Bool)

(assert (=> b!112715 (= e!73947 (= (size!2314 (buf!2717 (_2!4888 lt!170771))) (size!2314 (buf!2717 lt!171691))))))

(assert (= (and d!36306 res!93074) b!112715))

(declare-fun m!168681 () Bool)

(assert (=> d!36306 m!168681))

(declare-fun m!168683 () Bool)

(assert (=> d!36306 m!168683))

(declare-fun m!168685 () Bool)

(assert (=> d!36306 m!168685))

(declare-fun m!168687 () Bool)

(assert (=> d!36306 m!168687))

(assert (=> b!112182 d!36306))

(declare-fun d!36308 () Bool)

(declare-fun e!73948 () Bool)

(assert (=> d!36308 e!73948))

(declare-fun res!93075 () Bool)

(assert (=> d!36308 (=> (not res!93075) (not e!73948))))

(declare-fun lt!171693 () (_ BitVec 64))

(declare-fun lt!171696 () (_ BitVec 64))

(declare-fun lt!171698 () (_ BitVec 64))

(assert (=> d!36308 (= res!93075 (= lt!171696 (bvsub lt!171698 lt!171693)))))

(assert (=> d!36308 (or (= (bvand lt!171698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171693 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171698 lt!171693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36308 (= lt!171693 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170774))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170774)))))))

(declare-fun lt!171697 () (_ BitVec 64))

(declare-fun lt!171695 () (_ BitVec 64))

(assert (=> d!36308 (= lt!171698 (bvmul lt!171697 lt!171695))))

(assert (=> d!36308 (or (= lt!171697 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171695 (bvsdiv (bvmul lt!171697 lt!171695) lt!171697)))))

(assert (=> d!36308 (= lt!171695 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36308 (= lt!171697 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))))))

(assert (=> d!36308 (= lt!171696 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170774))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170774)))))))

(assert (=> d!36308 (invariant!0 (currentBit!5278 (_2!4886 lt!170774)) (currentByte!5283 (_2!4886 lt!170774)) (size!2314 (buf!2717 (_2!4886 lt!170774))))))

(assert (=> d!36308 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))) lt!171696)))

(declare-fun b!112716 () Bool)

(declare-fun res!93076 () Bool)

(assert (=> b!112716 (=> (not res!93076) (not e!73948))))

(assert (=> b!112716 (= res!93076 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171696))))

(declare-fun b!112717 () Bool)

(declare-fun lt!171694 () (_ BitVec 64))

(assert (=> b!112717 (= e!73948 (bvsle lt!171696 (bvmul lt!171694 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112717 (or (= lt!171694 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171694 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171694)))))

(assert (=> b!112717 (= lt!171694 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))))))

(assert (= (and d!36308 res!93075) b!112716))

(assert (= (and b!112716 res!93076) b!112717))

(declare-fun m!168689 () Bool)

(assert (=> d!36308 m!168689))

(declare-fun m!168691 () Bool)

(assert (=> d!36308 m!168691))

(assert (=> b!112182 d!36308))

(declare-fun d!36310 () Bool)

(assert (=> d!36310 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!170774))))

(declare-fun lt!171699 () Unit!6847)

(assert (=> d!36310 (= lt!171699 (choose!30 (_2!4886 lt!169810) (_2!4886 lt!170782) (_2!4886 lt!170774)))))

(assert (=> d!36310 (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!170782))))

(assert (=> d!36310 (= (lemmaIsPrefixTransitive!0 (_2!4886 lt!169810) (_2!4886 lt!170782) (_2!4886 lt!170774)) lt!171699)))

(declare-fun bs!8810 () Bool)

(assert (= bs!8810 d!36310))

(assert (=> bs!8810 m!168619))

(declare-fun m!168693 () Bool)

(assert (=> bs!8810 m!168693))

(declare-fun m!168695 () Bool)

(assert (=> bs!8810 m!168695))

(assert (=> b!112182 d!36310))

(declare-fun b!112718 () Bool)

(declare-fun res!93079 () Bool)

(declare-fun e!73950 () Bool)

(assert (=> b!112718 (=> (not res!93079) (not e!73950))))

(declare-fun lt!171714 () tuple2!9256)

(assert (=> b!112718 (= res!93079 (isPrefixOf!0 (_1!4888 lt!171714) (_2!4886 lt!170782)))))

(declare-fun lt!171715 () (_ BitVec 64))

(declare-fun lt!171708 () (_ BitVec 64))

(declare-fun b!112719 () Bool)

(assert (=> b!112719 (= e!73950 (= (_1!4888 lt!171714) (withMovedBitIndex!0 (_2!4888 lt!171714) (bvsub lt!171708 lt!171715))))))

(assert (=> b!112719 (or (= (bvand lt!171708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171715 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171708 lt!171715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112719 (= lt!171715 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170774))) (currentByte!5283 (_2!4886 lt!170774)) (currentBit!5278 (_2!4886 lt!170774))))))

(assert (=> b!112719 (= lt!171708 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))))))

(declare-fun b!112720 () Bool)

(declare-fun e!73949 () Unit!6847)

(declare-fun Unit!6918 () Unit!6847)

(assert (=> b!112720 (= e!73949 Unit!6918)))

(declare-fun d!36312 () Bool)

(assert (=> d!36312 e!73950))

(declare-fun res!93077 () Bool)

(assert (=> d!36312 (=> (not res!93077) (not e!73950))))

(assert (=> d!36312 (= res!93077 (isPrefixOf!0 (_1!4888 lt!171714) (_2!4888 lt!171714)))))

(declare-fun lt!171710 () BitStream!4102)

(assert (=> d!36312 (= lt!171714 (tuple2!9257 lt!171710 (_2!4886 lt!170774)))))

(declare-fun lt!171704 () Unit!6847)

(declare-fun lt!171709 () Unit!6847)

(assert (=> d!36312 (= lt!171704 lt!171709)))

(assert (=> d!36312 (isPrefixOf!0 lt!171710 (_2!4886 lt!170774))))

(assert (=> d!36312 (= lt!171709 (lemmaIsPrefixTransitive!0 lt!171710 (_2!4886 lt!170774) (_2!4886 lt!170774)))))

(declare-fun lt!171702 () Unit!6847)

(declare-fun lt!171716 () Unit!6847)

(assert (=> d!36312 (= lt!171702 lt!171716)))

(assert (=> d!36312 (isPrefixOf!0 lt!171710 (_2!4886 lt!170774))))

(assert (=> d!36312 (= lt!171716 (lemmaIsPrefixTransitive!0 lt!171710 (_2!4886 lt!170782) (_2!4886 lt!170774)))))

(declare-fun lt!171719 () Unit!6847)

(assert (=> d!36312 (= lt!171719 e!73949)))

(declare-fun c!6868 () Bool)

(assert (=> d!36312 (= c!6868 (not (= (size!2314 (buf!2717 (_2!4886 lt!170782))) #b00000000000000000000000000000000)))))

(declare-fun lt!171712 () Unit!6847)

(declare-fun lt!171718 () Unit!6847)

(assert (=> d!36312 (= lt!171712 lt!171718)))

(assert (=> d!36312 (isPrefixOf!0 (_2!4886 lt!170774) (_2!4886 lt!170774))))

(assert (=> d!36312 (= lt!171718 (lemmaIsPrefixRefl!0 (_2!4886 lt!170774)))))

(declare-fun lt!171700 () Unit!6847)

(declare-fun lt!171707 () Unit!6847)

(assert (=> d!36312 (= lt!171700 lt!171707)))

(assert (=> d!36312 (= lt!171707 (lemmaIsPrefixRefl!0 (_2!4886 lt!170774)))))

(declare-fun lt!171703 () Unit!6847)

(declare-fun lt!171705 () Unit!6847)

(assert (=> d!36312 (= lt!171703 lt!171705)))

(assert (=> d!36312 (isPrefixOf!0 lt!171710 lt!171710)))

(assert (=> d!36312 (= lt!171705 (lemmaIsPrefixRefl!0 lt!171710))))

(declare-fun lt!171711 () Unit!6847)

(declare-fun lt!171713 () Unit!6847)

(assert (=> d!36312 (= lt!171711 lt!171713)))

(assert (=> d!36312 (isPrefixOf!0 (_2!4886 lt!170782) (_2!4886 lt!170782))))

(assert (=> d!36312 (= lt!171713 (lemmaIsPrefixRefl!0 (_2!4886 lt!170782)))))

(assert (=> d!36312 (= lt!171710 (BitStream!4103 (buf!2717 (_2!4886 lt!170774)) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))))))

(assert (=> d!36312 (isPrefixOf!0 (_2!4886 lt!170782) (_2!4886 lt!170774))))

(assert (=> d!36312 (= (reader!0 (_2!4886 lt!170782) (_2!4886 lt!170774)) lt!171714)))

(declare-fun b!112721 () Bool)

(declare-fun lt!171706 () Unit!6847)

(assert (=> b!112721 (= e!73949 lt!171706)))

(declare-fun lt!171717 () (_ BitVec 64))

(assert (=> b!112721 (= lt!171717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!171701 () (_ BitVec 64))

(assert (=> b!112721 (= lt!171701 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))))))

(assert (=> b!112721 (= lt!171706 (arrayBitRangesEqSymmetric!0 (buf!2717 (_2!4886 lt!170782)) (buf!2717 (_2!4886 lt!170774)) lt!171717 lt!171701))))

(assert (=> b!112721 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!170774)) (buf!2717 (_2!4886 lt!170782)) lt!171717 lt!171701)))

(declare-fun b!112722 () Bool)

(declare-fun res!93078 () Bool)

(assert (=> b!112722 (=> (not res!93078) (not e!73950))))

(assert (=> b!112722 (= res!93078 (isPrefixOf!0 (_2!4888 lt!171714) (_2!4886 lt!170774)))))

(assert (= (and d!36312 c!6868) b!112721))

(assert (= (and d!36312 (not c!6868)) b!112720))

(assert (= (and d!36312 res!93077) b!112718))

(assert (= (and b!112718 res!93079) b!112722))

(assert (= (and b!112722 res!93078) b!112719))

(assert (=> b!112721 m!167523))

(declare-fun m!168697 () Bool)

(assert (=> b!112721 m!168697))

(declare-fun m!168699 () Bool)

(assert (=> b!112721 m!168699))

(declare-fun m!168701 () Bool)

(assert (=> d!36312 m!168701))

(declare-fun m!168703 () Bool)

(assert (=> d!36312 m!168703))

(declare-fun m!168705 () Bool)

(assert (=> d!36312 m!168705))

(assert (=> d!36312 m!168621))

(declare-fun m!168707 () Bool)

(assert (=> d!36312 m!168707))

(declare-fun m!168709 () Bool)

(assert (=> d!36312 m!168709))

(declare-fun m!168711 () Bool)

(assert (=> d!36312 m!168711))

(declare-fun m!168713 () Bool)

(assert (=> d!36312 m!168713))

(declare-fun m!168715 () Bool)

(assert (=> d!36312 m!168715))

(declare-fun m!168717 () Bool)

(assert (=> d!36312 m!168717))

(assert (=> d!36312 m!168635))

(declare-fun m!168719 () Bool)

(assert (=> b!112722 m!168719))

(declare-fun m!168721 () Bool)

(assert (=> b!112718 m!168721))

(declare-fun m!168723 () Bool)

(assert (=> b!112719 m!168723))

(assert (=> b!112719 m!167537))

(assert (=> b!112719 m!167523))

(assert (=> b!112182 d!36312))

(declare-fun d!36314 () Bool)

(declare-fun e!73951 () Bool)

(assert (=> d!36314 e!73951))

(declare-fun res!93080 () Bool)

(assert (=> d!36314 (=> (not res!93080) (not e!73951))))

(declare-fun lt!171722 () tuple2!9254)

(declare-fun lt!171721 () tuple2!9254)

(assert (=> d!36314 (= res!93080 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171722))) (currentByte!5283 (_1!4887 lt!171722)) (currentBit!5278 (_1!4887 lt!171722))) (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171721))) (currentByte!5283 (_1!4887 lt!171721)) (currentBit!5278 (_1!4887 lt!171721)))))))

(declare-fun lt!171723 () Unit!6847)

(declare-fun lt!171720 () BitStream!4102)

(assert (=> d!36314 (= lt!171723 (choose!50 lt!170783 (_2!4886 lt!170774) lt!171720 lt!171722 (tuple2!9255 (_1!4887 lt!171722) (_2!4887 lt!171722)) (_1!4887 lt!171722) (_2!4887 lt!171722) lt!171721 (tuple2!9255 (_1!4887 lt!171721) (_2!4887 lt!171721)) (_1!4887 lt!171721) (_2!4887 lt!171721)))))

(assert (=> d!36314 (= lt!171721 (readBitPure!0 lt!171720))))

(assert (=> d!36314 (= lt!171722 (readBitPure!0 lt!170783))))

(assert (=> d!36314 (= lt!171720 (BitStream!4103 (buf!2717 (_2!4886 lt!170774)) (currentByte!5283 lt!170783) (currentBit!5278 lt!170783)))))

(assert (=> d!36314 (invariant!0 (currentBit!5278 lt!170783) (currentByte!5283 lt!170783) (size!2314 (buf!2717 (_2!4886 lt!170774))))))

(assert (=> d!36314 (= (readBitPrefixLemma!0 lt!170783 (_2!4886 lt!170774)) lt!171723)))

(declare-fun b!112723 () Bool)

(assert (=> b!112723 (= e!73951 (= (_2!4887 lt!171722) (_2!4887 lt!171721)))))

(assert (= (and d!36314 res!93080) b!112723))

(declare-fun m!168725 () Bool)

(assert (=> d!36314 m!168725))

(declare-fun m!168727 () Bool)

(assert (=> d!36314 m!168727))

(declare-fun m!168729 () Bool)

(assert (=> d!36314 m!168729))

(declare-fun m!168731 () Bool)

(assert (=> d!36314 m!168731))

(assert (=> d!36314 m!167503))

(assert (=> d!36314 m!167513))

(assert (=> b!112182 d!36314))

(declare-fun d!36316 () Bool)

(assert (=> d!36316 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!170745)))

(declare-fun lt!171724 () Unit!6847)

(assert (=> d!36316 (= lt!171724 (choose!9 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!170774)) lt!170745 (BitStream!4103 (buf!2717 (_2!4886 lt!170774)) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(assert (=> d!36316 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!169810) (buf!2717 (_2!4886 lt!170774)) lt!170745) lt!171724)))

(declare-fun bs!8811 () Bool)

(assert (= bs!8811 d!36316))

(assert (=> bs!8811 m!167527))

(declare-fun m!168733 () Bool)

(assert (=> bs!8811 m!168733))

(assert (=> b!112182 d!36316))

(declare-fun lt!171725 () tuple2!9286)

(declare-fun d!36318 () Bool)

(assert (=> d!36318 (= lt!171725 (readNLeastSignificantBitsLoop!0 (_1!4888 lt!170771) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170779 (ite (_2!4887 lt!170761) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!36318 (= (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!170771) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170779 (ite (_2!4887 lt!170761) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9259 (_2!4903 lt!171725) (_1!4903 lt!171725)))))

(declare-fun bs!8812 () Bool)

(assert (= bs!8812 d!36318))

(declare-fun m!168735 () Bool)

(assert (=> bs!8812 m!168735))

(assert (=> b!112182 d!36318))

(declare-fun d!36320 () Bool)

(declare-fun lt!171726 () tuple2!9286)

(assert (=> d!36320 (= lt!171726 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4888 lt!170756) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170779 e!73595)))))

(assert (=> d!36320 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4888 lt!170756) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170779 e!73595)) (tuple2!9259 (_2!4903 lt!171726) (_1!4903 lt!171726)))))

(declare-fun bs!8813 () Bool)

(assert (= bs!8813 d!36320))

(assert (=> bs!8813 m!167493))

(declare-fun m!168737 () Bool)

(assert (=> bs!8813 m!168737))

(assert (=> b!112182 d!36320))

(declare-fun d!36322 () Bool)

(declare-fun e!73953 () Bool)

(assert (=> d!36322 e!73953))

(declare-fun res!93087 () Bool)

(assert (=> d!36322 (=> (not res!93087) (not e!73953))))

(declare-fun lt!171754 () tuple2!9252)

(assert (=> d!36322 (= res!93087 (= (size!2314 (buf!2717 (_2!4886 lt!170782))) (size!2314 (buf!2717 (_2!4886 lt!171754)))))))

(declare-fun e!73958 () tuple2!9252)

(assert (=> d!36322 (= lt!171754 e!73958)))

(declare-fun c!6870 () Bool)

(assert (=> d!36322 (= c!6870 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!36322 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36322 (= (appendNLeastSignificantBitsLoop!0 (_2!4886 lt!170782) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!171754)))

(declare-fun b!112724 () Bool)

(declare-fun res!93086 () Bool)

(declare-fun lt!171727 () tuple2!9252)

(assert (=> b!112724 (= res!93086 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171727))) (currentByte!5283 (_2!4886 lt!171727)) (currentBit!5278 (_2!4886 lt!171727))) (bvadd (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!73955 () Bool)

(assert (=> b!112724 (=> (not res!93086) (not e!73955))))

(declare-fun b!112725 () Bool)

(declare-fun e!73956 () Bool)

(declare-fun lt!171753 () tuple2!9254)

(assert (=> b!112725 (= e!73956 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171753))) (currentByte!5283 (_1!4887 lt!171753)) (currentBit!5278 (_1!4887 lt!171753))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171727))) (currentByte!5283 (_2!4886 lt!171727)) (currentBit!5278 (_2!4886 lt!171727)))))))

(declare-fun b!112726 () Bool)

(declare-fun e!73957 () (_ BitVec 64))

(assert (=> b!112726 (= e!73957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!112727 () Bool)

(declare-fun res!93084 () Bool)

(assert (=> b!112727 (=> (not res!93084) (not e!73953))))

(assert (=> b!112727 (= res!93084 (isPrefixOf!0 (_2!4886 lt!170782) (_2!4886 lt!171754)))))

(declare-fun b!112728 () Bool)

(declare-fun res!93081 () Bool)

(assert (=> b!112728 (=> (not res!93081) (not e!73953))))

(declare-fun lt!171731 () (_ BitVec 64))

(declare-fun lt!171740 () (_ BitVec 64))

(assert (=> b!112728 (= res!93081 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171754))) (currentByte!5283 (_2!4886 lt!171754)) (currentBit!5278 (_2!4886 lt!171754))) (bvadd lt!171740 lt!171731)))))

(assert (=> b!112728 (or (not (= (bvand lt!171740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171731 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171740 lt!171731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112728 (= lt!171731 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!112728 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!112728 (= lt!171740 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))))))

(declare-fun call!1438 () Bool)

(declare-fun lt!171762 () tuple2!9252)

(declare-fun lt!171765 () BitStream!4102)

(declare-fun bm!1435 () Bool)

(assert (=> bm!1435 (= call!1438 (isPrefixOf!0 (ite c!6870 (_2!4886 lt!170782) lt!171765) (ite c!6870 (_2!4886 lt!171762) lt!171765)))))

(declare-fun b!112729 () Bool)

(assert (=> b!112729 (= lt!171753 (readBitPure!0 (readerFrom!0 (_2!4886 lt!171727) (currentBit!5278 (_2!4886 lt!170782)) (currentByte!5283 (_2!4886 lt!170782)))))))

(declare-fun res!93082 () Bool)

(declare-fun lt!171747 () Bool)

(assert (=> b!112729 (= res!93082 (and (= (_2!4887 lt!171753) lt!171747) (= (_1!4887 lt!171753) (_2!4886 lt!171727))))))

(assert (=> b!112729 (=> (not res!93082) (not e!73956))))

(assert (=> b!112729 (= e!73955 e!73956)))

(declare-fun b!112730 () Bool)

(declare-fun res!93088 () Bool)

(assert (=> b!112730 (= res!93088 (isPrefixOf!0 (_2!4886 lt!170782) (_2!4886 lt!171727)))))

(assert (=> b!112730 (=> (not res!93088) (not e!73955))))

(declare-fun b!112731 () Bool)

(declare-fun e!73952 () Bool)

(declare-fun lt!171764 () (_ BitVec 64))

(assert (=> b!112731 (= e!73952 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170782)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782))) lt!171764))))

(declare-fun b!112732 () Bool)

(declare-fun Unit!6919 () Unit!6847)

(assert (=> b!112732 (= e!73958 (tuple2!9253 Unit!6919 (_2!4886 lt!171762)))))

(assert (=> b!112732 (= lt!171747 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112732 (= lt!171727 (appendBit!0 (_2!4886 lt!170782) lt!171747))))

(declare-fun res!93083 () Bool)

(assert (=> b!112732 (= res!93083 (= (size!2314 (buf!2717 (_2!4886 lt!170782))) (size!2314 (buf!2717 (_2!4886 lt!171727)))))))

(assert (=> b!112732 (=> (not res!93083) (not e!73955))))

(assert (=> b!112732 e!73955))

(declare-fun lt!171770 () tuple2!9252)

(assert (=> b!112732 (= lt!171770 lt!171727)))

(assert (=> b!112732 (= lt!171762 (appendNLeastSignificantBitsLoop!0 (_2!4886 lt!171770) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!171729 () Unit!6847)

(assert (=> b!112732 (= lt!171729 (lemmaIsPrefixTransitive!0 (_2!4886 lt!170782) (_2!4886 lt!171770) (_2!4886 lt!171762)))))

(assert (=> b!112732 call!1438))

(declare-fun lt!171748 () Unit!6847)

(assert (=> b!112732 (= lt!171748 lt!171729)))

(assert (=> b!112732 (invariant!0 (currentBit!5278 (_2!4886 lt!170782)) (currentByte!5283 (_2!4886 lt!170782)) (size!2314 (buf!2717 (_2!4886 lt!171770))))))

(declare-fun lt!171771 () BitStream!4102)

(assert (=> b!112732 (= lt!171771 (BitStream!4103 (buf!2717 (_2!4886 lt!171770)) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))))))

(assert (=> b!112732 (invariant!0 (currentBit!5278 lt!171771) (currentByte!5283 lt!171771) (size!2314 (buf!2717 (_2!4886 lt!171762))))))

(declare-fun lt!171745 () BitStream!4102)

(assert (=> b!112732 (= lt!171745 (BitStream!4103 (buf!2717 (_2!4886 lt!171762)) (currentByte!5283 lt!171771) (currentBit!5278 lt!171771)))))

(declare-fun lt!171734 () tuple2!9254)

(assert (=> b!112732 (= lt!171734 (readBitPure!0 lt!171771))))

(declare-fun lt!171735 () tuple2!9254)

(assert (=> b!112732 (= lt!171735 (readBitPure!0 lt!171745))))

(declare-fun lt!171737 () Unit!6847)

(assert (=> b!112732 (= lt!171737 (readBitPrefixLemma!0 lt!171771 (_2!4886 lt!171762)))))

(declare-fun res!93089 () Bool)

(assert (=> b!112732 (= res!93089 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171734))) (currentByte!5283 (_1!4887 lt!171734)) (currentBit!5278 (_1!4887 lt!171734))) (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!171735))) (currentByte!5283 (_1!4887 lt!171735)) (currentBit!5278 (_1!4887 lt!171735)))))))

(declare-fun e!73954 () Bool)

(assert (=> b!112732 (=> (not res!93089) (not e!73954))))

(assert (=> b!112732 e!73954))

(declare-fun lt!171750 () Unit!6847)

(assert (=> b!112732 (= lt!171750 lt!171737)))

(declare-fun lt!171744 () tuple2!9256)

(assert (=> b!112732 (= lt!171744 (reader!0 (_2!4886 lt!170782) (_2!4886 lt!171762)))))

(declare-fun lt!171759 () tuple2!9256)

(assert (=> b!112732 (= lt!171759 (reader!0 (_2!4886 lt!171770) (_2!4886 lt!171762)))))

(declare-fun lt!171749 () tuple2!9254)

(assert (=> b!112732 (= lt!171749 (readBitPure!0 (_1!4888 lt!171744)))))

(assert (=> b!112732 (= (_2!4887 lt!171749) lt!171747)))

(declare-fun lt!171752 () Unit!6847)

(declare-fun Unit!6920 () Unit!6847)

(assert (=> b!112732 (= lt!171752 Unit!6920)))

(declare-fun lt!171767 () (_ BitVec 64))

(assert (=> b!112732 (= lt!171767 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!171733 () (_ BitVec 64))

(assert (=> b!112732 (= lt!171733 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!171758 () Unit!6847)

(assert (=> b!112732 (= lt!171758 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!170782) (buf!2717 (_2!4886 lt!171762)) lt!171733))))

(assert (=> b!112732 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!171762)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782))) lt!171733)))

(declare-fun lt!171738 () Unit!6847)

(assert (=> b!112732 (= lt!171738 lt!171758)))

(declare-fun lt!171769 () tuple2!9258)

(assert (=> b!112732 (= lt!171769 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!171744) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171767))))

(declare-fun lt!171746 () (_ BitVec 64))

(assert (=> b!112732 (= lt!171746 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!171739 () Unit!6847)

(assert (=> b!112732 (= lt!171739 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!171770) (buf!2717 (_2!4886 lt!171762)) lt!171746))))

(assert (=> b!112732 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!171762)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!171770))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!171770))) lt!171746)))

(declare-fun lt!171732 () Unit!6847)

(assert (=> b!112732 (= lt!171732 lt!171739)))

(declare-fun lt!171761 () tuple2!9258)

(assert (=> b!112732 (= lt!171761 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!171759) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!171767 (ite (_2!4887 lt!171749) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!171730 () tuple2!9258)

(assert (=> b!112732 (= lt!171730 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!171744) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171767))))

(declare-fun c!6869 () Bool)

(assert (=> b!112732 (= c!6869 (_2!4887 (readBitPure!0 (_1!4888 lt!171744))))))

(declare-fun lt!171766 () tuple2!9258)

(assert (=> b!112732 (= lt!171766 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4888 lt!171744) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!171767 e!73957)))))

(declare-fun lt!171763 () Unit!6847)

(assert (=> b!112732 (= lt!171763 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4888 lt!171744) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171767))))

(assert (=> b!112732 (and (= (_2!4889 lt!171730) (_2!4889 lt!171766)) (= (_1!4889 lt!171730) (_1!4889 lt!171766)))))

(declare-fun lt!171742 () Unit!6847)

(assert (=> b!112732 (= lt!171742 lt!171763)))

(assert (=> b!112732 (= (_1!4888 lt!171744) (withMovedBitIndex!0 (_2!4888 lt!171744) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171762))) (currentByte!5283 (_2!4886 lt!171762)) (currentBit!5278 (_2!4886 lt!171762))))))))

(declare-fun lt!171757 () Unit!6847)

(declare-fun Unit!6921 () Unit!6847)

(assert (=> b!112732 (= lt!171757 Unit!6921)))

(assert (=> b!112732 (= (_1!4888 lt!171759) (withMovedBitIndex!0 (_2!4888 lt!171759) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171770))) (currentByte!5283 (_2!4886 lt!171770)) (currentBit!5278 (_2!4886 lt!171770))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171762))) (currentByte!5283 (_2!4886 lt!171762)) (currentBit!5278 (_2!4886 lt!171762))))))))

(declare-fun lt!171768 () Unit!6847)

(declare-fun Unit!6922 () Unit!6847)

(assert (=> b!112732 (= lt!171768 Unit!6922)))

(assert (=> b!112732 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) (bvsub (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171770))) (currentByte!5283 (_2!4886 lt!171770)) (currentBit!5278 (_2!4886 lt!171770))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!171760 () Unit!6847)

(declare-fun Unit!6923 () Unit!6847)

(assert (=> b!112732 (= lt!171760 Unit!6923)))

(assert (=> b!112732 (= (_2!4889 lt!171769) (_2!4889 lt!171761))))

(declare-fun lt!171728 () Unit!6847)

(declare-fun Unit!6924 () Unit!6847)

(assert (=> b!112732 (= lt!171728 Unit!6924)))

(assert (=> b!112732 (= (_1!4889 lt!171769) (_2!4888 lt!171744))))

(declare-fun b!112733 () Bool)

(declare-fun lt!171755 () Unit!6847)

(assert (=> b!112733 (= e!73958 (tuple2!9253 lt!171755 (_2!4886 lt!170782)))))

(assert (=> b!112733 (= lt!171765 (_2!4886 lt!170782))))

(assert (=> b!112733 (= lt!171755 (lemmaIsPrefixRefl!0 lt!171765))))

(assert (=> b!112733 call!1438))

(declare-fun b!112734 () Bool)

(assert (=> b!112734 (= e!73954 (= (_2!4887 lt!171734) (_2!4887 lt!171735)))))

(declare-fun lt!171756 () tuple2!9256)

(declare-fun b!112735 () Bool)

(declare-fun lt!171743 () tuple2!9258)

(assert (=> b!112735 (= e!73953 (and (= (_2!4889 lt!171743) v!199) (= (_1!4889 lt!171743) (_2!4888 lt!171756))))))

(declare-fun lt!171736 () (_ BitVec 64))

(assert (=> b!112735 (= lt!171743 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!171756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171736))))

(declare-fun lt!171751 () Unit!6847)

(declare-fun lt!171741 () Unit!6847)

(assert (=> b!112735 (= lt!171751 lt!171741)))

(assert (=> b!112735 (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!171754)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782))) lt!171764)))

(assert (=> b!112735 (= lt!171741 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4886 lt!170782) (buf!2717 (_2!4886 lt!171754)) lt!171764))))

(assert (=> b!112735 e!73952))

(declare-fun res!93085 () Bool)

(assert (=> b!112735 (=> (not res!93085) (not e!73952))))

(assert (=> b!112735 (= res!93085 (and (= (size!2314 (buf!2717 (_2!4886 lt!170782))) (size!2314 (buf!2717 (_2!4886 lt!171754)))) (bvsge lt!171764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112735 (= lt!171764 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!112735 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!112735 (= lt!171736 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!112735 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!112735 (= lt!171756 (reader!0 (_2!4886 lt!170782) (_2!4886 lt!171754)))))

(declare-fun b!112736 () Bool)

(assert (=> b!112736 (= e!73957 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(assert (= (and d!36322 c!6870) b!112732))

(assert (= (and d!36322 (not c!6870)) b!112733))

(assert (= (and b!112732 res!93083) b!112724))

(assert (= (and b!112724 res!93086) b!112730))

(assert (= (and b!112730 res!93088) b!112729))

(assert (= (and b!112729 res!93082) b!112725))

(assert (= (and b!112732 res!93089) b!112734))

(assert (= (and b!112732 c!6869) b!112736))

(assert (= (and b!112732 (not c!6869)) b!112726))

(assert (= (or b!112732 b!112733) bm!1435))

(assert (= (and d!36322 res!93087) b!112728))

(assert (= (and b!112728 res!93081) b!112727))

(assert (= (and b!112727 res!93084) b!112735))

(assert (= (and b!112735 res!93085) b!112731))

(declare-fun m!168739 () Bool)

(assert (=> b!112732 m!168739))

(declare-fun m!168741 () Bool)

(assert (=> b!112732 m!168741))

(declare-fun m!168743 () Bool)

(assert (=> b!112732 m!168743))

(declare-fun m!168745 () Bool)

(assert (=> b!112732 m!168745))

(declare-fun m!168747 () Bool)

(assert (=> b!112732 m!168747))

(declare-fun m!168749 () Bool)

(assert (=> b!112732 m!168749))

(declare-fun m!168751 () Bool)

(assert (=> b!112732 m!168751))

(declare-fun m!168753 () Bool)

(assert (=> b!112732 m!168753))

(declare-fun m!168755 () Bool)

(assert (=> b!112732 m!168755))

(declare-fun m!168757 () Bool)

(assert (=> b!112732 m!168757))

(declare-fun m!168759 () Bool)

(assert (=> b!112732 m!168759))

(declare-fun m!168761 () Bool)

(assert (=> b!112732 m!168761))

(assert (=> b!112732 m!167523))

(declare-fun m!168763 () Bool)

(assert (=> b!112732 m!168763))

(declare-fun m!168765 () Bool)

(assert (=> b!112732 m!168765))

(declare-fun m!168767 () Bool)

(assert (=> b!112732 m!168767))

(declare-fun m!168769 () Bool)

(assert (=> b!112732 m!168769))

(declare-fun m!168771 () Bool)

(assert (=> b!112732 m!168771))

(declare-fun m!168773 () Bool)

(assert (=> b!112732 m!168773))

(declare-fun m!168775 () Bool)

(assert (=> b!112732 m!168775))

(declare-fun m!168777 () Bool)

(assert (=> b!112732 m!168777))

(declare-fun m!168779 () Bool)

(assert (=> b!112732 m!168779))

(assert (=> b!112732 m!168741))

(declare-fun m!168781 () Bool)

(assert (=> b!112732 m!168781))

(declare-fun m!168783 () Bool)

(assert (=> b!112732 m!168783))

(declare-fun m!168785 () Bool)

(assert (=> b!112732 m!168785))

(declare-fun m!168787 () Bool)

(assert (=> b!112732 m!168787))

(declare-fun m!168789 () Bool)

(assert (=> b!112732 m!168789))

(declare-fun m!168791 () Bool)

(assert (=> b!112732 m!168791))

(declare-fun m!168793 () Bool)

(assert (=> b!112729 m!168793))

(assert (=> b!112729 m!168793))

(declare-fun m!168795 () Bool)

(assert (=> b!112729 m!168795))

(declare-fun m!168797 () Bool)

(assert (=> b!112725 m!168797))

(declare-fun m!168799 () Bool)

(assert (=> b!112725 m!168799))

(declare-fun m!168801 () Bool)

(assert (=> b!112730 m!168801))

(declare-fun m!168803 () Bool)

(assert (=> b!112735 m!168803))

(declare-fun m!168805 () Bool)

(assert (=> b!112735 m!168805))

(assert (=> b!112735 m!168745))

(declare-fun m!168807 () Bool)

(assert (=> b!112735 m!168807))

(declare-fun m!168809 () Bool)

(assert (=> b!112735 m!168809))

(declare-fun m!168811 () Bool)

(assert (=> bm!1435 m!168811))

(declare-fun m!168813 () Bool)

(assert (=> b!112727 m!168813))

(assert (=> b!112724 m!168799))

(assert (=> b!112724 m!167523))

(declare-fun m!168815 () Bool)

(assert (=> b!112728 m!168815))

(assert (=> b!112728 m!167523))

(declare-fun m!168817 () Bool)

(assert (=> b!112731 m!168817))

(declare-fun m!168819 () Bool)

(assert (=> b!112733 m!168819))

(assert (=> b!112182 d!36322))

(declare-fun d!36324 () Bool)

(declare-fun e!73959 () Bool)

(assert (=> d!36324 e!73959))

(declare-fun res!93090 () Bool)

(assert (=> d!36324 (=> (not res!93090) (not e!73959))))

(declare-fun lt!171773 () (_ BitVec 64))

(declare-fun lt!171772 () BitStream!4102)

(assert (=> d!36324 (= res!93090 (= (bvadd lt!171773 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2314 (buf!2717 lt!171772)) (currentByte!5283 lt!171772) (currentBit!5278 lt!171772))))))

(assert (=> d!36324 (or (not (= (bvand lt!171773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171773 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36324 (= lt!171773 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!170756))) (currentByte!5283 (_1!4888 lt!170756)) (currentBit!5278 (_1!4888 lt!170756))))))

(assert (=> d!36324 (= lt!171772 (_2!4886 (moveBitIndex!0 (_1!4888 lt!170756) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!36324 (moveBitIndexPrecond!0 (_1!4888 lt!170756) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!36324 (= (withMovedBitIndex!0 (_1!4888 lt!170756) #b0000000000000000000000000000000000000000000000000000000000000001) lt!171772)))

(declare-fun b!112737 () Bool)

(assert (=> b!112737 (= e!73959 (= (size!2314 (buf!2717 (_1!4888 lt!170756))) (size!2314 (buf!2717 lt!171772))))))

(assert (= (and d!36324 res!93090) b!112737))

(declare-fun m!168821 () Bool)

(assert (=> d!36324 m!168821))

(declare-fun m!168823 () Bool)

(assert (=> d!36324 m!168823))

(declare-fun m!168825 () Bool)

(assert (=> d!36324 m!168825))

(declare-fun m!168827 () Bool)

(assert (=> d!36324 m!168827))

(assert (=> b!112182 d!36324))

(declare-fun d!36326 () Bool)

(declare-fun lt!171778 () tuple2!9258)

(declare-fun lt!171777 () tuple2!9258)

(assert (=> d!36326 (and (= (_2!4889 lt!171778) (_2!4889 lt!171777)) (= (_1!4889 lt!171778) (_1!4889 lt!171777)))))

(declare-fun lt!171774 () Unit!6847)

(declare-fun lt!171775 () BitStream!4102)

(declare-fun lt!171776 () Bool)

(declare-fun lt!171779 () (_ BitVec 64))

(assert (=> d!36326 (= lt!171774 (choose!45 (_1!4888 lt!170756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170779 lt!171778 (tuple2!9259 (_1!4889 lt!171778) (_2!4889 lt!171778)) (_1!4889 lt!171778) (_2!4889 lt!171778) lt!171776 lt!171775 lt!171779 lt!171777 (tuple2!9259 (_1!4889 lt!171777) (_2!4889 lt!171777)) (_1!4889 lt!171777) (_2!4889 lt!171777)))))

(assert (=> d!36326 (= lt!171777 (readNLeastSignificantBitsLoopPure!0 lt!171775 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171779))))

(assert (=> d!36326 (= lt!171779 (bvor lt!170779 (ite lt!171776 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36326 (= lt!171775 (withMovedBitIndex!0 (_1!4888 lt!170756) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!36326 (= lt!171776 (_2!4887 (readBitPure!0 (_1!4888 lt!170756))))))

(assert (=> d!36326 (= lt!171778 (readNLeastSignificantBitsLoopPure!0 (_1!4888 lt!170756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170779))))

(assert (=> d!36326 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4888 lt!170756) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170779) lt!171774)))

(declare-fun bs!8814 () Bool)

(assert (= bs!8814 d!36326))

(declare-fun m!168829 () Bool)

(assert (=> bs!8814 m!168829))

(assert (=> bs!8814 m!167535))

(assert (=> bs!8814 m!167521))

(assert (=> bs!8814 m!167493))

(declare-fun m!168831 () Bool)

(assert (=> bs!8814 m!168831))

(assert (=> b!112182 d!36326))

(declare-fun d!36328 () Bool)

(declare-fun e!73960 () Bool)

(assert (=> d!36328 e!73960))

(declare-fun res!93091 () Bool)

(assert (=> d!36328 (=> (not res!93091) (not e!73960))))

(declare-fun lt!171780 () (_ BitVec 64))

(declare-fun lt!171783 () (_ BitVec 64))

(declare-fun lt!171785 () (_ BitVec 64))

(assert (=> d!36328 (= res!93091 (= lt!171783 (bvsub lt!171785 lt!171780)))))

(assert (=> d!36328 (or (= (bvand lt!171785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171780 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171785 lt!171780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36328 (= lt!171780 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170747)))) ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170747))) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170747)))))))

(declare-fun lt!171784 () (_ BitVec 64))

(declare-fun lt!171782 () (_ BitVec 64))

(assert (=> d!36328 (= lt!171785 (bvmul lt!171784 lt!171782))))

(assert (=> d!36328 (or (= lt!171784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171782 (bvsdiv (bvmul lt!171784 lt!171782) lt!171784)))))

(assert (=> d!36328 (= lt!171782 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36328 (= lt!171784 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170747)))))))

(assert (=> d!36328 (= lt!171783 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4887 lt!170747))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4887 lt!170747)))))))

(assert (=> d!36328 (invariant!0 (currentBit!5278 (_1!4887 lt!170747)) (currentByte!5283 (_1!4887 lt!170747)) (size!2314 (buf!2717 (_1!4887 lt!170747))))))

(assert (=> d!36328 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4887 lt!170747))) (currentByte!5283 (_1!4887 lt!170747)) (currentBit!5278 (_1!4887 lt!170747))) lt!171783)))

(declare-fun b!112738 () Bool)

(declare-fun res!93092 () Bool)

(assert (=> b!112738 (=> (not res!93092) (not e!73960))))

(assert (=> b!112738 (= res!93092 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171783))))

(declare-fun b!112739 () Bool)

(declare-fun lt!171781 () (_ BitVec 64))

(assert (=> b!112739 (= e!73960 (bvsle lt!171783 (bvmul lt!171781 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112739 (or (= lt!171781 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171781 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171781)))))

(assert (=> b!112739 (= lt!171781 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4887 lt!170747)))))))

(assert (= (and d!36328 res!93091) b!112738))

(assert (= (and b!112738 res!93092) b!112739))

(declare-fun m!168833 () Bool)

(assert (=> d!36328 m!168833))

(declare-fun m!168835 () Bool)

(assert (=> d!36328 m!168835))

(assert (=> b!112182 d!36328))

(declare-fun d!36330 () Bool)

(assert (=> d!36330 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))) lt!170745) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170774)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810)))) lt!170745))))

(declare-fun bs!8815 () Bool)

(assert (= bs!8815 d!36330))

(declare-fun m!168837 () Bool)

(assert (=> bs!8815 m!168837))

(assert (=> b!112182 d!36330))

(declare-fun d!36332 () Bool)

(declare-fun e!73961 () Bool)

(assert (=> d!36332 e!73961))

(declare-fun res!93093 () Bool)

(assert (=> d!36332 (=> (not res!93093) (not e!73961))))

(declare-fun lt!171789 () (_ BitVec 64))

(declare-fun lt!171786 () (_ BitVec 64))

(declare-fun lt!171791 () (_ BitVec 64))

(assert (=> d!36332 (= res!93093 (= lt!171789 (bvsub lt!171791 lt!171786)))))

(assert (=> d!36332 (or (= (bvand lt!171791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171786 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171791 lt!171786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36332 (= lt!171786 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170782)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782)))))))

(declare-fun lt!171790 () (_ BitVec 64))

(declare-fun lt!171788 () (_ BitVec 64))

(assert (=> d!36332 (= lt!171791 (bvmul lt!171790 lt!171788))))

(assert (=> d!36332 (or (= lt!171790 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171788 (bvsdiv (bvmul lt!171790 lt!171788) lt!171790)))))

(assert (=> d!36332 (= lt!171788 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36332 (= lt!171790 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170782)))))))

(assert (=> d!36332 (= lt!171789 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!170782))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!170782)))))))

(assert (=> d!36332 (invariant!0 (currentBit!5278 (_2!4886 lt!170782)) (currentByte!5283 (_2!4886 lt!170782)) (size!2314 (buf!2717 (_2!4886 lt!170782))))))

(assert (=> d!36332 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170782))) (currentByte!5283 (_2!4886 lt!170782)) (currentBit!5278 (_2!4886 lt!170782))) lt!171789)))

(declare-fun b!112740 () Bool)

(declare-fun res!93094 () Bool)

(assert (=> b!112740 (=> (not res!93094) (not e!73961))))

(assert (=> b!112740 (= res!93094 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171789))))

(declare-fun b!112741 () Bool)

(declare-fun lt!171787 () (_ BitVec 64))

(assert (=> b!112741 (= e!73961 (bvsle lt!171789 (bvmul lt!171787 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112741 (or (= lt!171787 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171787 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171787)))))

(assert (=> b!112741 (= lt!171787 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!170782)))))))

(assert (= (and d!36332 res!93093) b!112740))

(assert (= (and b!112740 res!93094) b!112741))

(declare-fun m!168839 () Bool)

(assert (=> d!36332 m!168839))

(declare-fun m!168841 () Bool)

(assert (=> d!36332 m!168841))

(assert (=> b!112182 d!36332))

(declare-fun d!36334 () Bool)

(declare-fun res!93097 () Bool)

(declare-fun e!73963 () Bool)

(assert (=> d!36334 (=> (not res!93097) (not e!73963))))

(assert (=> d!36334 (= res!93097 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) (size!2314 (buf!2717 (_2!4886 lt!170739)))))))

(assert (=> d!36334 (= (isPrefixOf!0 (_2!4886 lt!169810) (_2!4886 lt!170739)) e!73963)))

(declare-fun b!112742 () Bool)

(declare-fun res!93095 () Bool)

(assert (=> b!112742 (=> (not res!93095) (not e!73963))))

(assert (=> b!112742 (= res!93095 (bvsle (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810))) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!170739))) (currentByte!5283 (_2!4886 lt!170739)) (currentBit!5278 (_2!4886 lt!170739)))))))

(declare-fun b!112743 () Bool)

(declare-fun e!73962 () Bool)

(assert (=> b!112743 (= e!73963 e!73962)))

(declare-fun res!93096 () Bool)

(assert (=> b!112743 (=> res!93096 e!73962)))

(assert (=> b!112743 (= res!93096 (= (size!2314 (buf!2717 (_2!4886 lt!169810))) #b00000000000000000000000000000000))))

(declare-fun b!112744 () Bool)

(assert (=> b!112744 (= e!73962 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169810)) (buf!2717 (_2!4886 lt!170739)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!169810))) (currentByte!5283 (_2!4886 lt!169810)) (currentBit!5278 (_2!4886 lt!169810)))))))

(assert (= (and d!36334 res!93097) b!112742))

(assert (= (and b!112742 res!93095) b!112743))

(assert (= (and b!112743 (not res!93096)) b!112744))

(assert (=> b!112742 m!166841))

(assert (=> b!112742 m!167551))

(assert (=> b!112744 m!166841))

(assert (=> b!112744 m!166841))

(declare-fun m!168843 () Bool)

(assert (=> b!112744 m!168843))

(assert (=> b!112180 d!36334))

(declare-fun d!36336 () Bool)

(declare-fun e!73964 () Bool)

(assert (=> d!36336 e!73964))

(declare-fun res!93098 () Bool)

(assert (=> d!36336 (=> (not res!93098) (not e!73964))))

(assert (=> d!36336 (= res!93098 (= (buf!2717 (_2!4886 (increaseBitIndex!0 (_1!4888 lt!169797)))) (buf!2717 (_1!4888 lt!169797))))))

(declare-fun lt!171795 () Bool)

(assert (=> d!36336 (= lt!171795 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (_1!4888 lt!169797))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171793 () tuple2!9284)

(assert (=> d!36336 (= lt!171793 (tuple2!9285 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (_1!4888 lt!169797))))) #b00000000000000000000000000000000)) (_2!4886 (increaseBitIndex!0 (_1!4888 lt!169797)))))))

(assert (=> d!36336 (validate_offset_bit!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4888 lt!169797)))) ((_ sign_extend 32) (currentByte!5283 (_1!4888 lt!169797))) ((_ sign_extend 32) (currentBit!5278 (_1!4888 lt!169797))))))

(assert (=> d!36336 (= (readBit!0 (_1!4888 lt!169797)) lt!171793)))

(declare-fun lt!171796 () (_ BitVec 64))

(declare-fun b!112745 () Bool)

(declare-fun lt!171794 () (_ BitVec 64))

(assert (=> b!112745 (= e!73964 (= (bitIndex!0 (size!2314 (buf!2717 (_2!4886 (increaseBitIndex!0 (_1!4888 lt!169797))))) (currentByte!5283 (_2!4886 (increaseBitIndex!0 (_1!4888 lt!169797)))) (currentBit!5278 (_2!4886 (increaseBitIndex!0 (_1!4888 lt!169797))))) (bvadd lt!171796 lt!171794)))))

(assert (=> b!112745 (or (not (= (bvand lt!171796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171794 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171796 lt!171794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112745 (= lt!171794 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112745 (= lt!171796 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)) (currentBit!5278 (_1!4888 lt!169797))))))

(declare-fun lt!171792 () Bool)

(assert (=> b!112745 (= lt!171792 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (_1!4888 lt!169797))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171797 () Bool)

(assert (=> b!112745 (= lt!171797 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (_1!4888 lt!169797))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171798 () Bool)

(assert (=> b!112745 (= lt!171798 (not (= (bvand ((_ sign_extend 24) (select (arr!2907 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5278 (_1!4888 lt!169797))))) #b00000000000000000000000000000000)))))

(assert (= (and d!36336 res!93098) b!112745))

(declare-fun m!168845 () Bool)

(assert (=> d!36336 m!168845))

(declare-fun m!168847 () Bool)

(assert (=> d!36336 m!168847))

(declare-fun m!168849 () Bool)

(assert (=> d!36336 m!168849))

(declare-fun m!168851 () Bool)

(assert (=> d!36336 m!168851))

(declare-fun m!168853 () Bool)

(assert (=> b!112745 m!168853))

(assert (=> b!112745 m!167703))

(assert (=> b!112745 m!168845))

(assert (=> b!112745 m!168849))

(assert (=> b!112745 m!168847))

(assert (=> d!35798 d!36336))

(assert (=> b!112238 d!35830))

(declare-fun d!36338 () Bool)

(assert (=> d!36338 (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169807)) (buf!2717 thiss!1305) lt!170924 lt!170908)))

(declare-fun lt!171799 () Unit!6847)

(assert (=> d!36338 (= lt!171799 (choose!8 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169807)) lt!170924 lt!170908))))

(assert (=> d!36338 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170924) (bvsle lt!170924 lt!170908))))

(assert (=> d!36338 (= (arrayBitRangesEqSymmetric!0 (buf!2717 thiss!1305) (buf!2717 (_2!4886 lt!169807)) lt!170924 lt!170908) lt!171799)))

(declare-fun bs!8816 () Bool)

(assert (= bs!8816 d!36338))

(assert (=> bs!8816 m!167659))

(declare-fun m!168855 () Bool)

(assert (=> bs!8816 m!168855))

(assert (=> b!112238 d!36338))

(declare-fun b!112746 () Bool)

(declare-fun lt!171800 () tuple4!80)

(declare-fun e!73968 () Bool)

(assert (=> b!112746 (= e!73968 (arrayRangesEq!41 (buf!2717 (_2!4886 lt!169807)) (buf!2717 thiss!1305) (_1!4905 lt!171800) (_2!4905 lt!171800)))))

(declare-fun lt!171802 () (_ BitVec 32))

(declare-fun lt!171801 () (_ BitVec 32))

(declare-fun call!1439 () Bool)

(declare-fun bm!1436 () Bool)

(declare-fun c!6871 () Bool)

(assert (=> bm!1436 (= call!1439 (byteRangesEq!0 (ite c!6871 (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_3!261 lt!171800)) (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_4!40 lt!171800))) (ite c!6871 (select (arr!2907 (buf!2717 thiss!1305)) (_3!261 lt!171800)) (select (arr!2907 (buf!2717 thiss!1305)) (_4!40 lt!171800))) (ite c!6871 lt!171801 #b00000000000000000000000000000000) lt!171802))))

(declare-fun b!112748 () Bool)

(declare-fun e!73967 () Bool)

(declare-fun e!73965 () Bool)

(assert (=> b!112748 (= e!73967 e!73965)))

(declare-fun res!93103 () Bool)

(assert (=> b!112748 (= res!93103 (byteRangesEq!0 (select (arr!2907 (buf!2717 (_2!4886 lt!169807))) (_3!261 lt!171800)) (select (arr!2907 (buf!2717 thiss!1305)) (_3!261 lt!171800)) lt!171801 #b00000000000000000000000000001000))))

(assert (=> b!112748 (=> (not res!93103) (not e!73965))))

(declare-fun d!36340 () Bool)

(declare-fun res!93102 () Bool)

(declare-fun e!73969 () Bool)

(assert (=> d!36340 (=> res!93102 e!73969)))

(assert (=> d!36340 (= res!93102 (bvsge lt!170924 lt!170908))))

(assert (=> d!36340 (= (arrayBitRangesEq!0 (buf!2717 (_2!4886 lt!169807)) (buf!2717 thiss!1305) lt!170924 lt!170908) e!73969)))

(declare-fun b!112747 () Bool)

(assert (=> b!112747 (= e!73967 call!1439)))

(declare-fun b!112749 () Bool)

(declare-fun e!73970 () Bool)

(assert (=> b!112749 (= e!73969 e!73970)))

(declare-fun res!93100 () Bool)

(assert (=> b!112749 (=> (not res!93100) (not e!73970))))

(assert (=> b!112749 (= res!93100 e!73968)))

(declare-fun res!93101 () Bool)

(assert (=> b!112749 (=> res!93101 e!73968)))

(assert (=> b!112749 (= res!93101 (bvsge (_1!4905 lt!171800) (_2!4905 lt!171800)))))

(assert (=> b!112749 (= lt!171802 ((_ extract 31 0) (bvsrem lt!170908 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112749 (= lt!171801 ((_ extract 31 0) (bvsrem lt!170924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112749 (= lt!171800 (arrayBitIndices!0 lt!170924 lt!170908))))

(declare-fun b!112750 () Bool)

(declare-fun res!93099 () Bool)

(assert (=> b!112750 (= res!93099 (= lt!171802 #b00000000000000000000000000000000))))

(declare-fun e!73966 () Bool)

(assert (=> b!112750 (=> res!93099 e!73966)))

(assert (=> b!112750 (= e!73965 e!73966)))

(declare-fun b!112751 () Bool)

(assert (=> b!112751 (= e!73970 e!73967)))

(assert (=> b!112751 (= c!6871 (= (_3!261 lt!171800) (_4!40 lt!171800)))))

(declare-fun b!112752 () Bool)

(assert (=> b!112752 (= e!73966 call!1439)))

(assert (= (and d!36340 (not res!93102)) b!112749))

(assert (= (and b!112749 (not res!93101)) b!112746))

(assert (= (and b!112749 res!93100) b!112751))

(assert (= (and b!112751 c!6871) b!112747))

(assert (= (and b!112751 (not c!6871)) b!112748))

(assert (= (and b!112748 res!93103) b!112750))

(assert (= (and b!112750 (not res!93099)) b!112752))

(assert (= (or b!112747 b!112752) bm!1436))

(declare-fun m!168857 () Bool)

(assert (=> b!112746 m!168857))

(declare-fun m!168859 () Bool)

(assert (=> bm!1436 m!168859))

(declare-fun m!168861 () Bool)

(assert (=> bm!1436 m!168861))

(declare-fun m!168863 () Bool)

(assert (=> bm!1436 m!168863))

(declare-fun m!168865 () Bool)

(assert (=> bm!1436 m!168865))

(declare-fun m!168867 () Bool)

(assert (=> bm!1436 m!168867))

(assert (=> b!112748 m!168859))

(assert (=> b!112748 m!168861))

(assert (=> b!112748 m!168859))

(assert (=> b!112748 m!168861))

(declare-fun m!168869 () Bool)

(assert (=> b!112748 m!168869))

(declare-fun m!168871 () Bool)

(assert (=> b!112749 m!168871))

(assert (=> b!112238 d!36340))

(declare-fun d!36342 () Bool)

(assert (=> d!36342 (= (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))) ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810)))) (bvsub (bvmul ((_ sign_extend 32) (size!2314 (buf!2717 (_2!4886 lt!169810)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_2!4886 lt!169810))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_2!4886 lt!169810))))))))

(assert (=> d!35828 d!36342))

(assert (=> d!35828 d!36194))

(declare-fun d!36344 () Bool)

(declare-fun e!73971 () Bool)

(assert (=> d!36344 e!73971))

(declare-fun res!93104 () Bool)

(assert (=> d!36344 (=> (not res!93104) (not e!73971))))

(declare-fun lt!171806 () (_ BitVec 64))

(declare-fun lt!171803 () (_ BitVec 64))

(declare-fun lt!171808 () (_ BitVec 64))

(assert (=> d!36344 (= res!93104 (= lt!171806 (bvsub lt!171808 lt!171803)))))

(assert (=> d!36344 (or (= (bvand lt!171808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171803 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171808 lt!171803) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36344 (= lt!171803 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170946))) ((_ sign_extend 32) (currentByte!5283 lt!170946)) ((_ sign_extend 32) (currentBit!5278 lt!170946))))))

(declare-fun lt!171807 () (_ BitVec 64))

(declare-fun lt!171805 () (_ BitVec 64))

(assert (=> d!36344 (= lt!171808 (bvmul lt!171807 lt!171805))))

(assert (=> d!36344 (or (= lt!171807 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171805 (bvsdiv (bvmul lt!171807 lt!171805) lt!171807)))))

(assert (=> d!36344 (= lt!171805 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36344 (= lt!171807 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170946))))))

(assert (=> d!36344 (= lt!171806 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 lt!170946)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 lt!170946))))))

(assert (=> d!36344 (invariant!0 (currentBit!5278 lt!170946) (currentByte!5283 lt!170946) (size!2314 (buf!2717 lt!170946)))))

(assert (=> d!36344 (= (bitIndex!0 (size!2314 (buf!2717 lt!170946)) (currentByte!5283 lt!170946) (currentBit!5278 lt!170946)) lt!171806)))

(declare-fun b!112753 () Bool)

(declare-fun res!93105 () Bool)

(assert (=> b!112753 (=> (not res!93105) (not e!73971))))

(assert (=> b!112753 (= res!93105 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171806))))

(declare-fun b!112754 () Bool)

(declare-fun lt!171804 () (_ BitVec 64))

(assert (=> b!112754 (= e!73971 (bvsle lt!171806 (bvmul lt!171804 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112754 (or (= lt!171804 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171804 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171804)))))

(assert (=> b!112754 (= lt!171804 ((_ sign_extend 32) (size!2314 (buf!2717 lt!170946))))))

(assert (= (and d!36344 res!93104) b!112753))

(assert (= (and b!112753 res!93105) b!112754))

(declare-fun m!168873 () Bool)

(assert (=> d!36344 m!168873))

(declare-fun m!168875 () Bool)

(assert (=> d!36344 m!168875))

(assert (=> d!35834 d!36344))

(declare-fun d!36346 () Bool)

(declare-fun e!73972 () Bool)

(assert (=> d!36346 e!73972))

(declare-fun res!93106 () Bool)

(assert (=> d!36346 (=> (not res!93106) (not e!73972))))

(declare-fun lt!171809 () (_ BitVec 64))

(declare-fun lt!171814 () (_ BitVec 64))

(declare-fun lt!171812 () (_ BitVec 64))

(assert (=> d!36346 (= res!93106 (= lt!171812 (bvsub lt!171814 lt!171809)))))

(assert (=> d!36346 (or (= (bvand lt!171814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171809 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171814 lt!171809) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36346 (= lt!171809 (remainingBits!0 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4888 lt!169797)))) ((_ sign_extend 32) (currentByte!5283 (_1!4888 lt!169797))) ((_ sign_extend 32) (currentBit!5278 (_1!4888 lt!169797)))))))

(declare-fun lt!171813 () (_ BitVec 64))

(declare-fun lt!171811 () (_ BitVec 64))

(assert (=> d!36346 (= lt!171814 (bvmul lt!171813 lt!171811))))

(assert (=> d!36346 (or (= lt!171813 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171811 (bvsdiv (bvmul lt!171813 lt!171811) lt!171813)))))

(assert (=> d!36346 (= lt!171811 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36346 (= lt!171813 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4888 lt!169797)))))))

(assert (=> d!36346 (= lt!171812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5283 (_1!4888 lt!169797))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5278 (_1!4888 lt!169797)))))))

(assert (=> d!36346 (invariant!0 (currentBit!5278 (_1!4888 lt!169797)) (currentByte!5283 (_1!4888 lt!169797)) (size!2314 (buf!2717 (_1!4888 lt!169797))))))

(assert (=> d!36346 (= (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)) (currentBit!5278 (_1!4888 lt!169797))) lt!171812)))

(declare-fun b!112755 () Bool)

(declare-fun res!93107 () Bool)

(assert (=> b!112755 (=> (not res!93107) (not e!73972))))

(assert (=> b!112755 (= res!93107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171812))))

(declare-fun b!112756 () Bool)

(declare-fun lt!171810 () (_ BitVec 64))

(assert (=> b!112756 (= e!73972 (bvsle lt!171812 (bvmul lt!171810 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112756 (or (= lt!171810 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171810 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171810)))))

(assert (=> b!112756 (= lt!171810 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4888 lt!169797)))))))

(assert (= (and d!36346 res!93106) b!112755))

(assert (= (and b!112755 res!93107) b!112756))

(declare-fun m!168877 () Bool)

(assert (=> d!36346 m!168877))

(declare-fun m!168879 () Bool)

(assert (=> d!36346 m!168879))

(assert (=> d!35834 d!36346))

(declare-fun d!36348 () Bool)

(declare-fun lt!171816 () (_ BitVec 32))

(assert (=> d!36348 (= lt!171816 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171818 () (_ BitVec 32))

(assert (=> d!36348 (= lt!171818 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!73973 () Bool)

(assert (=> d!36348 e!73973))

(declare-fun res!93108 () Bool)

(assert (=> d!36348 (=> (not res!93108) (not e!73973))))

(assert (=> d!36348 (= res!93108 (moveBitIndexPrecond!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!6925 () Unit!6847)

(declare-fun Unit!6926 () Unit!6847)

(declare-fun Unit!6927 () Unit!6847)

(assert (=> d!36348 (= (moveBitIndex!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!5278 (_1!4888 lt!169797)) lt!171816) #b00000000000000000000000000000000) (tuple2!9253 Unit!6925 (BitStream!4103 (buf!2717 (_1!4888 lt!169797)) (bvsub (bvadd (currentByte!5283 (_1!4888 lt!169797)) lt!171818) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171816 (currentBit!5278 (_1!4888 lt!169797))))) (ite (bvsge (bvadd (currentBit!5278 (_1!4888 lt!169797)) lt!171816) #b00000000000000000000000000001000) (tuple2!9253 Unit!6926 (BitStream!4103 (buf!2717 (_1!4888 lt!169797)) (bvadd (currentByte!5283 (_1!4888 lt!169797)) lt!171818 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5278 (_1!4888 lt!169797)) lt!171816) #b00000000000000000000000000001000))) (tuple2!9253 Unit!6927 (BitStream!4103 (buf!2717 (_1!4888 lt!169797)) (bvadd (currentByte!5283 (_1!4888 lt!169797)) lt!171818) (bvadd (currentBit!5278 (_1!4888 lt!169797)) lt!171816))))))))

(declare-fun b!112757 () Bool)

(declare-fun e!73974 () Bool)

(assert (=> b!112757 (= e!73973 e!73974)))

(declare-fun res!93109 () Bool)

(assert (=> b!112757 (=> (not res!93109) (not e!73974))))

(declare-fun lt!171819 () (_ BitVec 64))

(declare-fun lt!171815 () tuple2!9252)

(assert (=> b!112757 (= res!93109 (= (bvadd lt!171819 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2314 (buf!2717 (_2!4886 lt!171815))) (currentByte!5283 (_2!4886 lt!171815)) (currentBit!5278 (_2!4886 lt!171815)))))))

(assert (=> b!112757 (or (not (= (bvand lt!171819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171819 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112757 (= lt!171819 (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)) (currentBit!5278 (_1!4888 lt!169797))))))

(declare-fun lt!171817 () (_ BitVec 32))

(declare-fun lt!171820 () (_ BitVec 32))

(declare-fun Unit!6928 () Unit!6847)

(declare-fun Unit!6929 () Unit!6847)

(declare-fun Unit!6930 () Unit!6847)

(assert (=> b!112757 (= lt!171815 (ite (bvslt (bvadd (currentBit!5278 (_1!4888 lt!169797)) lt!171817) #b00000000000000000000000000000000) (tuple2!9253 Unit!6928 (BitStream!4103 (buf!2717 (_1!4888 lt!169797)) (bvsub (bvadd (currentByte!5283 (_1!4888 lt!169797)) lt!171820) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171817 (currentBit!5278 (_1!4888 lt!169797))))) (ite (bvsge (bvadd (currentBit!5278 (_1!4888 lt!169797)) lt!171817) #b00000000000000000000000000001000) (tuple2!9253 Unit!6929 (BitStream!4103 (buf!2717 (_1!4888 lt!169797)) (bvadd (currentByte!5283 (_1!4888 lt!169797)) lt!171820 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5278 (_1!4888 lt!169797)) lt!171817) #b00000000000000000000000000001000))) (tuple2!9253 Unit!6930 (BitStream!4103 (buf!2717 (_1!4888 lt!169797)) (bvadd (currentByte!5283 (_1!4888 lt!169797)) lt!171820) (bvadd (currentBit!5278 (_1!4888 lt!169797)) lt!171817))))))))

(assert (=> b!112757 (= lt!171817 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112757 (= lt!171820 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!112758 () Bool)

(assert (=> b!112758 (= e!73974 (and (= (size!2314 (buf!2717 (_1!4888 lt!169797))) (size!2314 (buf!2717 (_2!4886 lt!171815)))) (= (buf!2717 (_1!4888 lt!169797)) (buf!2717 (_2!4886 lt!171815)))))))

(assert (= (and d!36348 res!93108) b!112757))

(assert (= (and b!112757 res!93109) b!112758))

(assert (=> d!36348 m!167707))

(declare-fun m!168881 () Bool)

(assert (=> b!112757 m!168881))

(assert (=> b!112757 m!167703))

(assert (=> d!35834 d!36348))

(declare-fun d!36350 () Bool)

(declare-fun res!93110 () Bool)

(declare-fun e!73975 () Bool)

(assert (=> d!36350 (=> (not res!93110) (not e!73975))))

(assert (=> d!36350 (= res!93110 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4888 lt!169797))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4888 lt!169797))))))))))

(assert (=> d!36350 (= (moveBitIndexPrecond!0 (_1!4888 lt!169797) #b0000000000000000000000000000000000000000000000000000000000000001) e!73975)))

(declare-fun b!112759 () Bool)

(declare-fun lt!171821 () (_ BitVec 64))

(assert (=> b!112759 (= e!73975 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171821) (bvsle lt!171821 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2314 (buf!2717 (_1!4888 lt!169797))))))))))

(assert (=> b!112759 (= lt!171821 (bvadd (bitIndex!0 (size!2314 (buf!2717 (_1!4888 lt!169797))) (currentByte!5283 (_1!4888 lt!169797)) (currentBit!5278 (_1!4888 lt!169797))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!36350 res!93110) b!112759))

(assert (=> b!112759 m!167703))

(assert (=> d!35834 d!36350))

(declare-fun d!36352 () Bool)

(declare-fun res!93113 () Bool)

(declare-fun e!73977 () Bool)

(assert (=> d!36352 (=> (not res!93113) (not e!73977))))

(assert (=> d!36352 (= res!93113 (= (size!2314 (buf!2717 (ite c!6829 (_2!4886 lt!169810) lt!170777))) (size!2314 (buf!2717 (ite c!6829 (_2!4886 lt!170774) lt!170777)))))))

(assert (=> d!36352 (= (isPrefixOf!0 (ite c!6829 (_2!4886 lt!169810) lt!170777) (ite c!6829 (_2!4886 lt!170774) lt!170777)) e!73977)))

(declare-fun b!112760 () Bool)

(declare-fun res!93111 () Bool)

(assert (=> b!112760 (=> (not res!93111) (not e!73977))))

(assert (=> b!112760 (= res!93111 (bvsle (bitIndex!0 (size!2314 (buf!2717 (ite c!6829 (_2!4886 lt!169810) lt!170777))) (currentByte!5283 (ite c!6829 (_2!4886 lt!169810) lt!170777)) (currentBit!5278 (ite c!6829 (_2!4886 lt!169810) lt!170777))) (bitIndex!0 (size!2314 (buf!2717 (ite c!6829 (_2!4886 lt!170774) lt!170777))) (currentByte!5283 (ite c!6829 (_2!4886 lt!170774) lt!170777)) (currentBit!5278 (ite c!6829 (_2!4886 lt!170774) lt!170777)))))))

(declare-fun b!112761 () Bool)

(declare-fun e!73976 () Bool)

(assert (=> b!112761 (= e!73977 e!73976)))

(declare-fun res!93112 () Bool)

(assert (=> b!112761 (=> res!93112 e!73976)))

(assert (=> b!112761 (= res!93112 (= (size!2314 (buf!2717 (ite c!6829 (_2!4886 lt!169810) lt!170777))) #b00000000000000000000000000000000))))

(declare-fun b!112762 () Bool)

(assert (=> b!112762 (= e!73976 (arrayBitRangesEq!0 (buf!2717 (ite c!6829 (_2!4886 lt!169810) lt!170777)) (buf!2717 (ite c!6829 (_2!4886 lt!170774) lt!170777)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2314 (buf!2717 (ite c!6829 (_2!4886 lt!169810) lt!170777))) (currentByte!5283 (ite c!6829 (_2!4886 lt!169810) lt!170777)) (currentBit!5278 (ite c!6829 (_2!4886 lt!169810) lt!170777)))))))

(assert (= (and d!36352 res!93113) b!112760))

(assert (= (and b!112760 res!93111) b!112761))

(assert (= (and b!112761 (not res!93112)) b!112762))

(declare-fun m!168883 () Bool)

(assert (=> b!112760 m!168883))

(declare-fun m!168885 () Bool)

(assert (=> b!112760 m!168885))

(assert (=> b!112762 m!168883))

(assert (=> b!112762 m!168883))

(declare-fun m!168887 () Bool)

(assert (=> b!112762 m!168887))

(assert (=> bm!1422 d!36352))

(push 1)

(assert (not b!112711))

(assert (not bm!1433))

(assert (not b!112706))

(assert (not b!112722))

(assert (not b!112635))

(assert (not d!36314))

(assert (not b!112733))

(assert (not d!36316))

(assert (not b!112703))

(assert (not d!36238))

(assert (not d!36210))

(assert (not d!36186))

(assert (not b!112584))

(assert (not b!112695))

(assert (not d!36332))

(assert (not d!36320))

(assert (not b!112725))

(assert (not d!36198))

(assert (not d!36218))

(assert (not b!112612))

(assert (not d!36122))

(assert (not b!112611))

(assert (not d!36348))

(assert (not b!112625))

(assert (not bm!1432))

(assert (not d!36146))

(assert (not b!112721))

(assert (not d!36220))

(assert (not b!112732))

(assert (not b!112735))

(assert (not b!112615))

(assert (not d!36130))

(assert (not d!36294))

(assert (not d!36280))

(assert (not d!36126))

(assert (not b!112562))

(assert (not d!36328))

(assert (not b!112622))

(assert (not b!112540))

(assert (not b!112634))

(assert (not d!36128))

(assert (not d!36290))

(assert (not b!112667))

(assert (not b!112718))

(assert (not b!112663))

(assert (not b!112647))

(assert (not d!36110))

(assert (not b!112748))

(assert (not b!112749))

(assert (not b!112710))

(assert (not d!36216))

(assert (not b!112613))

(assert (not b!112666))

(assert (not b!112712))

(assert (not b!112757))

(assert (not d!36204))

(assert (not b!112623))

(assert (not b!112531))

(assert (not d!36308))

(assert (not b!112729))

(assert (not d!36248))

(assert (not d!36184))

(assert (not b!112684))

(assert (not b!112565))

(assert (not b!112538))

(assert (not b!112640))

(assert (not b!112719))

(assert (not b!112730))

(assert (not b!112670))

(assert (not b!112541))

(assert (not d!36272))

(assert (not b!112679))

(assert (not d!36246))

(assert (not b!112624))

(assert (not d!36324))

(assert (not b!112707))

(assert (not b!112529))

(assert (not d!36338))

(assert (not d!36288))

(assert (not b!112628))

(assert (not d!36236))

(assert (not b!112530))

(assert (not b!112658))

(assert (not d!36252))

(assert (not b!112641))

(assert (not b!112552))

(assert (not d!36154))

(assert (not b!112762))

(assert (not d!36124))

(assert (not b!112586))

(assert (not b!112742))

(assert (not b!112534))

(assert (not b!112533))

(assert (not b!112632))

(assert (not b!112543))

(assert (not b!112731))

(assert (not d!36182))

(assert (not d!36296))

(assert (not d!36192))

(assert (not b!112675))

(assert (not bm!1434))

(assert (not b!112698))

(assert (not b!112621))

(assert (not d!36112))

(assert (not b!112669))

(assert (not b!112682))

(assert (not b!112690))

(assert (not d!36326))

(assert (not b!112672))

(assert (not d!36268))

(assert (not b!112760))

(assert (not b!112557))

(assert (not d!36298))

(assert (not b!112532))

(assert (not b!112643))

(assert (not b!112688))

(assert (not b!112646))

(assert (not b!112744))

(assert (not b!112681))

(assert (not d!36312))

(assert (not b!112685))

(assert (not d!36330))

(assert (not b!112536))

(assert (not d!36260))

(assert (not d!36174))

(assert (not d!36278))

(assert (not b!112537))

(assert (not b!112709))

(assert (not b!112627))

(assert (not b!112724))

(assert (not b!112759))

(assert (not b!112691))

(assert (not b!112746))

(assert (not b!112728))

(assert (not b!112704))

(assert (not d!36310))

(assert (not b!112567))

(assert (not b!112528))

(assert (not d!36208))

(assert (not b!112593))

(assert (not bm!1435))

(assert (not b!112660))

(assert (not b!112727))

(assert (not b!112745))

(assert (not b!112696))

(assert (not d!36152))

(assert (not d!36292))

(assert (not b!112564))

(assert (not d!36282))

(assert (not d!36178))

(assert (not d!36156))

(assert (not d!36144))

(assert (not d!36118))

(assert (not b!112636))

(assert (not b!112673))

(assert (not d!36270))

(assert (not b!112644))

(assert (not d!36306))

(assert (not d!36114))

(assert (not d!36336))

(assert (not b!112693))

(assert (not d!36346))

(assert (not b!112661))

(assert (not d!36304))

(assert (not d!36256))

(assert (not d!36206))

(assert (not d!36226))

(assert (not d!36344))

(assert (not d!36116))

(assert (not b!112642))

(assert (not b!112664))

(assert (not d!36224))

(assert (not d!36284))

(assert (not d!36142))

(assert (not d!36300))

(assert (not d!36168))

(assert (not b!112614))

(assert (not d!36244))

(assert (not d!36254))

(assert (not bm!1436))

(assert (not b!112587))

(assert (not d!36318))

(assert (not b!112687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

