; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23220 () Bool)

(assert start!23220)

(declare-fun b!117875 () Bool)

(declare-fun e!77263 () Bool)

(declare-datatypes ((array!5298 0))(
  ( (array!5299 (arr!2996 (Array (_ BitVec 32) (_ BitVec 8))) (size!2403 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4280 0))(
  ( (BitStream!4281 (buf!2819 array!5298) (currentByte!5468 (_ BitVec 32)) (currentBit!5463 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9848 0))(
  ( (tuple2!9849 (_1!5189 BitStream!4280) (_2!5189 Bool)) )
))
(declare-fun lt!180884 () tuple2!9848)

(declare-fun lt!180900 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117875 (= e!77263 (= (bitIndex!0 (size!2403 (buf!2819 (_1!5189 lt!180884))) (currentByte!5468 (_1!5189 lt!180884)) (currentBit!5463 (_1!5189 lt!180884))) lt!180900))))

(declare-fun b!117876 () Bool)

(declare-fun e!77268 () Bool)

(assert (=> b!117876 (= e!77268 e!77263)))

(declare-fun res!97524 () Bool)

(assert (=> b!117876 (=> (not res!97524) (not e!77263))))

(declare-datatypes ((Unit!7253 0))(
  ( (Unit!7254) )
))
(declare-datatypes ((tuple2!9850 0))(
  ( (tuple2!9851 (_1!5190 Unit!7253) (_2!5190 BitStream!4280)) )
))
(declare-fun lt!180887 () tuple2!9850)

(declare-fun lt!180885 () Bool)

(assert (=> b!117876 (= res!97524 (and (= (_2!5189 lt!180884) lt!180885) (= (_1!5189 lt!180884) (_2!5190 lt!180887))))))

(declare-fun thiss!1305 () BitStream!4280)

(declare-fun readBitPure!0 (BitStream!4280) tuple2!9848)

(declare-fun readerFrom!0 (BitStream!4280 (_ BitVec 32) (_ BitVec 32)) BitStream!4280)

(assert (=> b!117876 (= lt!180884 (readBitPure!0 (readerFrom!0 (_2!5190 lt!180887) (currentBit!5463 thiss!1305) (currentByte!5468 thiss!1305))))))

(declare-fun res!97528 () Bool)

(declare-fun e!77265 () Bool)

(assert (=> start!23220 (=> (not res!97528) (not e!77265))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23220 (= res!97528 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23220 e!77265))

(assert (=> start!23220 true))

(declare-fun e!77264 () Bool)

(declare-fun inv!12 (BitStream!4280) Bool)

(assert (=> start!23220 (and (inv!12 thiss!1305) e!77264)))

(declare-fun b!117877 () Bool)

(declare-fun res!97521 () Bool)

(declare-fun e!77266 () Bool)

(assert (=> b!117877 (=> (not res!97521) (not e!77266))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117877 (= res!97521 (invariant!0 (currentBit!5463 thiss!1305) (currentByte!5468 thiss!1305) (size!2403 (buf!2819 (_2!5190 lt!180887)))))))

(declare-fun b!117878 () Bool)

(declare-fun res!97520 () Bool)

(declare-fun e!77270 () Bool)

(assert (=> b!117878 (=> (not res!97520) (not e!77270))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117878 (= res!97520 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117879 () Bool)

(declare-fun res!97525 () Bool)

(assert (=> b!117879 (=> (not res!97525) (not e!77270))))

(assert (=> b!117879 (= res!97525 (bvslt i!615 nBits!396))))

(declare-fun b!117880 () Bool)

(declare-fun e!77271 () Bool)

(assert (=> b!117880 (= e!77271 e!77268)))

(declare-fun res!97527 () Bool)

(assert (=> b!117880 (=> (not res!97527) (not e!77268))))

(declare-fun lt!180898 () (_ BitVec 64))

(assert (=> b!117880 (= res!97527 (= lt!180900 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!180898)))))

(assert (=> b!117880 (= lt!180900 (bitIndex!0 (size!2403 (buf!2819 (_2!5190 lt!180887))) (currentByte!5468 (_2!5190 lt!180887)) (currentBit!5463 (_2!5190 lt!180887))))))

(assert (=> b!117880 (= lt!180898 (bitIndex!0 (size!2403 (buf!2819 thiss!1305)) (currentByte!5468 thiss!1305) (currentBit!5463 thiss!1305)))))

(declare-fun b!117881 () Bool)

(declare-fun res!97530 () Bool)

(assert (=> b!117881 (=> (not res!97530) (not e!77268))))

(declare-fun isPrefixOf!0 (BitStream!4280 BitStream!4280) Bool)

(assert (=> b!117881 (= res!97530 (isPrefixOf!0 thiss!1305 (_2!5190 lt!180887)))))

(declare-fun b!117882 () Bool)

(declare-fun array_inv!2205 (array!5298) Bool)

(assert (=> b!117882 (= e!77264 (array_inv!2205 (buf!2819 thiss!1305)))))

(declare-fun b!117883 () Bool)

(declare-fun lt!180883 () tuple2!9850)

(assert (=> b!117883 (= e!77266 (invariant!0 (currentBit!5463 thiss!1305) (currentByte!5468 thiss!1305) (size!2403 (buf!2819 (_2!5190 lt!180883)))))))

(declare-fun b!117884 () Bool)

(declare-fun e!77269 () Bool)

(declare-fun lt!180903 () tuple2!9848)

(declare-fun lt!180888 () tuple2!9848)

(assert (=> b!117884 (= e!77269 (= (_2!5189 lt!180903) (_2!5189 lt!180888)))))

(declare-fun b!117885 () Bool)

(assert (=> b!117885 (= e!77265 e!77270)))

(declare-fun res!97523 () Bool)

(assert (=> b!117885 (=> (not res!97523) (not e!77270))))

(declare-fun lt!180899 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117885 (= res!97523 (validate_offset_bits!1 ((_ sign_extend 32) (size!2403 (buf!2819 thiss!1305))) ((_ sign_extend 32) (currentByte!5468 thiss!1305)) ((_ sign_extend 32) (currentBit!5463 thiss!1305)) lt!180899))))

(assert (=> b!117885 (= lt!180899 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117886 () Bool)

(assert (=> b!117886 (= e!77270 (not true))))

(declare-fun lt!180901 () (_ BitVec 64))

(declare-datatypes ((tuple2!9852 0))(
  ( (tuple2!9853 (_1!5191 BitStream!4280) (_2!5191 BitStream!4280)) )
))
(declare-fun lt!180902 () tuple2!9852)

(declare-datatypes ((tuple2!9854 0))(
  ( (tuple2!9855 (_1!5192 BitStream!4280) (_2!5192 (_ BitVec 64))) )
))
(declare-fun lt!180895 () tuple2!9854)

(declare-fun lt!180897 () tuple2!9848)

(declare-fun lt!180882 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9854)

(assert (=> b!117886 (= lt!180895 (readNLeastSignificantBitsLoopPure!0 (_1!5191 lt!180902) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!180901 (ite (_2!5189 lt!180897) lt!180882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!180886 () (_ BitVec 64))

(assert (=> b!117886 (validate_offset_bits!1 ((_ sign_extend 32) (size!2403 (buf!2819 (_2!5190 lt!180883)))) ((_ sign_extend 32) (currentByte!5468 (_2!5190 lt!180887))) ((_ sign_extend 32) (currentBit!5463 (_2!5190 lt!180887))) lt!180886)))

(declare-fun lt!180892 () Unit!7253)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4280 array!5298 (_ BitVec 64)) Unit!7253)

(assert (=> b!117886 (= lt!180892 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5190 lt!180887) (buf!2819 (_2!5190 lt!180883)) lt!180886))))

(assert (=> b!117886 (= lt!180886 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!180894 () tuple2!9854)

(declare-fun lt!180891 () tuple2!9852)

(assert (=> b!117886 (= lt!180894 (readNLeastSignificantBitsLoopPure!0 (_1!5191 lt!180891) nBits!396 i!615 lt!180901))))

(assert (=> b!117886 (validate_offset_bits!1 ((_ sign_extend 32) (size!2403 (buf!2819 (_2!5190 lt!180883)))) ((_ sign_extend 32) (currentByte!5468 thiss!1305)) ((_ sign_extend 32) (currentBit!5463 thiss!1305)) lt!180899)))

(declare-fun lt!180890 () Unit!7253)

(assert (=> b!117886 (= lt!180890 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2819 (_2!5190 lt!180883)) lt!180899))))

(assert (=> b!117886 (= lt!180901 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!117886 (= (_2!5189 lt!180897) lt!180885)))

(assert (=> b!117886 (= lt!180897 (readBitPure!0 (_1!5191 lt!180891)))))

(declare-fun reader!0 (BitStream!4280 BitStream!4280) tuple2!9852)

(assert (=> b!117886 (= lt!180902 (reader!0 (_2!5190 lt!180887) (_2!5190 lt!180883)))))

(assert (=> b!117886 (= lt!180891 (reader!0 thiss!1305 (_2!5190 lt!180883)))))

(assert (=> b!117886 e!77269))

(declare-fun res!97529 () Bool)

(assert (=> b!117886 (=> (not res!97529) (not e!77269))))

(assert (=> b!117886 (= res!97529 (= (bitIndex!0 (size!2403 (buf!2819 (_1!5189 lt!180903))) (currentByte!5468 (_1!5189 lt!180903)) (currentBit!5463 (_1!5189 lt!180903))) (bitIndex!0 (size!2403 (buf!2819 (_1!5189 lt!180888))) (currentByte!5468 (_1!5189 lt!180888)) (currentBit!5463 (_1!5189 lt!180888)))))))

(declare-fun lt!180896 () Unit!7253)

(declare-fun lt!180889 () BitStream!4280)

(declare-fun readBitPrefixLemma!0 (BitStream!4280 BitStream!4280) Unit!7253)

(assert (=> b!117886 (= lt!180896 (readBitPrefixLemma!0 lt!180889 (_2!5190 lt!180883)))))

(assert (=> b!117886 (= lt!180888 (readBitPure!0 (BitStream!4281 (buf!2819 (_2!5190 lt!180883)) (currentByte!5468 thiss!1305) (currentBit!5463 thiss!1305))))))

(assert (=> b!117886 (= lt!180903 (readBitPure!0 lt!180889))))

(assert (=> b!117886 (= lt!180889 (BitStream!4281 (buf!2819 (_2!5190 lt!180887)) (currentByte!5468 thiss!1305) (currentBit!5463 thiss!1305)))))

(assert (=> b!117886 e!77266))

(declare-fun res!97526 () Bool)

(assert (=> b!117886 (=> (not res!97526) (not e!77266))))

(assert (=> b!117886 (= res!97526 (isPrefixOf!0 thiss!1305 (_2!5190 lt!180883)))))

(declare-fun lt!180893 () Unit!7253)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4280 BitStream!4280 BitStream!4280) Unit!7253)

(assert (=> b!117886 (= lt!180893 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5190 lt!180887) (_2!5190 lt!180883)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4280 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9850)

(assert (=> b!117886 (= lt!180883 (appendNLeastSignificantBitsLoop!0 (_2!5190 lt!180887) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117886 e!77271))

(declare-fun res!97522 () Bool)

(assert (=> b!117886 (=> (not res!97522) (not e!77271))))

(assert (=> b!117886 (= res!97522 (= (size!2403 (buf!2819 thiss!1305)) (size!2403 (buf!2819 (_2!5190 lt!180887)))))))

(declare-fun appendBit!0 (BitStream!4280 Bool) tuple2!9850)

(assert (=> b!117886 (= lt!180887 (appendBit!0 thiss!1305 lt!180885))))

(assert (=> b!117886 (= lt!180885 (not (= (bvand v!199 lt!180882) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117886 (= lt!180882 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!23220 res!97528) b!117885))

(assert (= (and b!117885 res!97523) b!117878))

(assert (= (and b!117878 res!97520) b!117879))

(assert (= (and b!117879 res!97525) b!117886))

(assert (= (and b!117886 res!97522) b!117880))

(assert (= (and b!117880 res!97527) b!117881))

(assert (= (and b!117881 res!97530) b!117876))

(assert (= (and b!117876 res!97524) b!117875))

(assert (= (and b!117886 res!97526) b!117877))

(assert (= (and b!117877 res!97521) b!117883))

(assert (= (and b!117886 res!97529) b!117884))

(assert (= start!23220 b!117882))

(declare-fun m!176877 () Bool)

(assert (=> b!117882 m!176877))

(declare-fun m!176879 () Bool)

(assert (=> b!117883 m!176879))

(declare-fun m!176881 () Bool)

(assert (=> b!117878 m!176881))

(declare-fun m!176883 () Bool)

(assert (=> start!23220 m!176883))

(declare-fun m!176885 () Bool)

(assert (=> b!117885 m!176885))

(declare-fun m!176887 () Bool)

(assert (=> b!117886 m!176887))

(declare-fun m!176889 () Bool)

(assert (=> b!117886 m!176889))

(declare-fun m!176891 () Bool)

(assert (=> b!117886 m!176891))

(declare-fun m!176893 () Bool)

(assert (=> b!117886 m!176893))

(declare-fun m!176895 () Bool)

(assert (=> b!117886 m!176895))

(declare-fun m!176897 () Bool)

(assert (=> b!117886 m!176897))

(declare-fun m!176899 () Bool)

(assert (=> b!117886 m!176899))

(declare-fun m!176901 () Bool)

(assert (=> b!117886 m!176901))

(declare-fun m!176903 () Bool)

(assert (=> b!117886 m!176903))

(declare-fun m!176905 () Bool)

(assert (=> b!117886 m!176905))

(declare-fun m!176907 () Bool)

(assert (=> b!117886 m!176907))

(declare-fun m!176909 () Bool)

(assert (=> b!117886 m!176909))

(declare-fun m!176911 () Bool)

(assert (=> b!117886 m!176911))

(declare-fun m!176913 () Bool)

(assert (=> b!117886 m!176913))

(declare-fun m!176915 () Bool)

(assert (=> b!117886 m!176915))

(declare-fun m!176917 () Bool)

(assert (=> b!117886 m!176917))

(declare-fun m!176919 () Bool)

(assert (=> b!117886 m!176919))

(declare-fun m!176921 () Bool)

(assert (=> b!117886 m!176921))

(declare-fun m!176923 () Bool)

(assert (=> b!117886 m!176923))

(declare-fun m!176925 () Bool)

(assert (=> b!117876 m!176925))

(assert (=> b!117876 m!176925))

(declare-fun m!176927 () Bool)

(assert (=> b!117876 m!176927))

(declare-fun m!176929 () Bool)

(assert (=> b!117875 m!176929))

(declare-fun m!176931 () Bool)

(assert (=> b!117880 m!176931))

(declare-fun m!176933 () Bool)

(assert (=> b!117880 m!176933))

(declare-fun m!176935 () Bool)

(assert (=> b!117881 m!176935))

(declare-fun m!176937 () Bool)

(assert (=> b!117877 m!176937))

(push 1)

(assert (not b!117877))

(assert (not b!117886))

(assert (not b!117883))

(assert (not b!117880))

(assert (not b!117885))

(assert (not start!23220))

(assert (not b!117875))

(assert (not b!117881))

(assert (not b!117882))

(assert (not b!117876))

(assert (not b!117878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

