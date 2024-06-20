; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23218 () Bool)

(assert start!23218)

(declare-fun b!117839 () Bool)

(declare-fun res!97490 () Bool)

(declare-fun e!77241 () Bool)

(assert (=> b!117839 (=> (not res!97490) (not e!77241))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117839 (= res!97490 (bvslt i!615 nBits!396))))

(declare-fun b!117840 () Bool)

(declare-fun res!97496 () Bool)

(declare-fun e!77237 () Bool)

(assert (=> b!117840 (=> (not res!97496) (not e!77237))))

(declare-datatypes ((array!5296 0))(
  ( (array!5297 (arr!2995 (Array (_ BitVec 32) (_ BitVec 8))) (size!2402 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4278 0))(
  ( (BitStream!4279 (buf!2818 array!5296) (currentByte!5467 (_ BitVec 32)) (currentBit!5462 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4278)

(declare-datatypes ((Unit!7251 0))(
  ( (Unit!7252) )
))
(declare-datatypes ((tuple2!9840 0))(
  ( (tuple2!9841 (_1!5185 Unit!7251) (_2!5185 BitStream!4278)) )
))
(declare-fun lt!180827 () tuple2!9840)

(declare-fun isPrefixOf!0 (BitStream!4278 BitStream!4278) Bool)

(assert (=> b!117840 (= res!97496 (isPrefixOf!0 thiss!1305 (_2!5185 lt!180827)))))

(declare-fun b!117841 () Bool)

(declare-fun e!77244 () Bool)

(assert (=> b!117841 (= e!77237 e!77244)))

(declare-fun res!97497 () Bool)

(assert (=> b!117841 (=> (not res!97497) (not e!77244))))

(declare-datatypes ((tuple2!9842 0))(
  ( (tuple2!9843 (_1!5186 BitStream!4278) (_2!5186 Bool)) )
))
(declare-fun lt!180821 () tuple2!9842)

(declare-fun lt!180829 () Bool)

(assert (=> b!117841 (= res!97497 (and (= (_2!5186 lt!180821) lt!180829) (= (_1!5186 lt!180821) (_2!5185 lt!180827))))))

(declare-fun readBitPure!0 (BitStream!4278) tuple2!9842)

(declare-fun readerFrom!0 (BitStream!4278 (_ BitVec 32) (_ BitVec 32)) BitStream!4278)

(assert (=> b!117841 (= lt!180821 (readBitPure!0 (readerFrom!0 (_2!5185 lt!180827) (currentBit!5462 thiss!1305) (currentByte!5467 thiss!1305))))))

(declare-fun b!117842 () Bool)

(declare-fun e!77236 () Bool)

(declare-fun lt!180830 () tuple2!9840)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117842 (= e!77236 (invariant!0 (currentBit!5462 thiss!1305) (currentByte!5467 thiss!1305) (size!2402 (buf!2818 (_2!5185 lt!180830)))))))

(declare-fun b!117843 () Bool)

(declare-fun e!77242 () Bool)

(declare-fun array_inv!2204 (array!5296) Bool)

(assert (=> b!117843 (= e!77242 (array_inv!2204 (buf!2818 thiss!1305)))))

(declare-fun b!117844 () Bool)

(declare-fun e!77243 () Bool)

(assert (=> b!117844 (= e!77243 e!77237)))

(declare-fun res!97488 () Bool)

(assert (=> b!117844 (=> (not res!97488) (not e!77237))))

(declare-fun lt!180837 () (_ BitVec 64))

(declare-fun lt!180836 () (_ BitVec 64))

(assert (=> b!117844 (= res!97488 (= lt!180837 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!180836)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117844 (= lt!180837 (bitIndex!0 (size!2402 (buf!2818 (_2!5185 lt!180827))) (currentByte!5467 (_2!5185 lt!180827)) (currentBit!5462 (_2!5185 lt!180827))))))

(assert (=> b!117844 (= lt!180836 (bitIndex!0 (size!2402 (buf!2818 thiss!1305)) (currentByte!5467 thiss!1305) (currentBit!5462 thiss!1305)))))

(declare-fun b!117846 () Bool)

(declare-fun res!97493 () Bool)

(assert (=> b!117846 (=> (not res!97493) (not e!77241))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117846 (= res!97493 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117847 () Bool)

(declare-fun e!77239 () Bool)

(assert (=> b!117847 (= e!77239 e!77241)))

(declare-fun res!97494 () Bool)

(assert (=> b!117847 (=> (not res!97494) (not e!77241))))

(declare-fun lt!180826 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117847 (= res!97494 (validate_offset_bits!1 ((_ sign_extend 32) (size!2402 (buf!2818 thiss!1305))) ((_ sign_extend 32) (currentByte!5467 thiss!1305)) ((_ sign_extend 32) (currentBit!5462 thiss!1305)) lt!180826))))

(assert (=> b!117847 (= lt!180826 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117848 () Bool)

(assert (=> b!117848 (= e!77241 (not true))))

(declare-fun lt!180823 () (_ BitVec 64))

(declare-fun lt!180817 () (_ BitVec 64))

(declare-datatypes ((tuple2!9844 0))(
  ( (tuple2!9845 (_1!5187 BitStream!4278) (_2!5187 BitStream!4278)) )
))
(declare-fun lt!180825 () tuple2!9844)

(declare-datatypes ((tuple2!9846 0))(
  ( (tuple2!9847 (_1!5188 BitStream!4278) (_2!5188 (_ BitVec 64))) )
))
(declare-fun lt!180828 () tuple2!9846)

(declare-fun lt!180834 () tuple2!9842)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9846)

(assert (=> b!117848 (= lt!180828 (readNLeastSignificantBitsLoopPure!0 (_1!5187 lt!180825) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!180817 (ite (_2!5186 lt!180834) lt!180823 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!180822 () (_ BitVec 64))

(assert (=> b!117848 (validate_offset_bits!1 ((_ sign_extend 32) (size!2402 (buf!2818 (_2!5185 lt!180830)))) ((_ sign_extend 32) (currentByte!5467 (_2!5185 lt!180827))) ((_ sign_extend 32) (currentBit!5462 (_2!5185 lt!180827))) lt!180822)))

(declare-fun lt!180831 () Unit!7251)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4278 array!5296 (_ BitVec 64)) Unit!7251)

(assert (=> b!117848 (= lt!180831 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5185 lt!180827) (buf!2818 (_2!5185 lt!180830)) lt!180822))))

(assert (=> b!117848 (= lt!180822 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!180832 () tuple2!9844)

(declare-fun lt!180833 () tuple2!9846)

(assert (=> b!117848 (= lt!180833 (readNLeastSignificantBitsLoopPure!0 (_1!5187 lt!180832) nBits!396 i!615 lt!180817))))

(assert (=> b!117848 (validate_offset_bits!1 ((_ sign_extend 32) (size!2402 (buf!2818 (_2!5185 lt!180830)))) ((_ sign_extend 32) (currentByte!5467 thiss!1305)) ((_ sign_extend 32) (currentBit!5462 thiss!1305)) lt!180826)))

(declare-fun lt!180816 () Unit!7251)

(assert (=> b!117848 (= lt!180816 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2818 (_2!5185 lt!180830)) lt!180826))))

(assert (=> b!117848 (= lt!180817 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!117848 (= (_2!5186 lt!180834) lt!180829)))

(assert (=> b!117848 (= lt!180834 (readBitPure!0 (_1!5187 lt!180832)))))

(declare-fun reader!0 (BitStream!4278 BitStream!4278) tuple2!9844)

(assert (=> b!117848 (= lt!180825 (reader!0 (_2!5185 lt!180827) (_2!5185 lt!180830)))))

(assert (=> b!117848 (= lt!180832 (reader!0 thiss!1305 (_2!5185 lt!180830)))))

(declare-fun e!77240 () Bool)

(assert (=> b!117848 e!77240))

(declare-fun res!97487 () Bool)

(assert (=> b!117848 (=> (not res!97487) (not e!77240))))

(declare-fun lt!180835 () tuple2!9842)

(declare-fun lt!180824 () tuple2!9842)

(assert (=> b!117848 (= res!97487 (= (bitIndex!0 (size!2402 (buf!2818 (_1!5186 lt!180835))) (currentByte!5467 (_1!5186 lt!180835)) (currentBit!5462 (_1!5186 lt!180835))) (bitIndex!0 (size!2402 (buf!2818 (_1!5186 lt!180824))) (currentByte!5467 (_1!5186 lt!180824)) (currentBit!5462 (_1!5186 lt!180824)))))))

(declare-fun lt!180819 () Unit!7251)

(declare-fun lt!180820 () BitStream!4278)

(declare-fun readBitPrefixLemma!0 (BitStream!4278 BitStream!4278) Unit!7251)

(assert (=> b!117848 (= lt!180819 (readBitPrefixLemma!0 lt!180820 (_2!5185 lt!180830)))))

(assert (=> b!117848 (= lt!180824 (readBitPure!0 (BitStream!4279 (buf!2818 (_2!5185 lt!180830)) (currentByte!5467 thiss!1305) (currentBit!5462 thiss!1305))))))

(assert (=> b!117848 (= lt!180835 (readBitPure!0 lt!180820))))

(assert (=> b!117848 (= lt!180820 (BitStream!4279 (buf!2818 (_2!5185 lt!180827)) (currentByte!5467 thiss!1305) (currentBit!5462 thiss!1305)))))

(assert (=> b!117848 e!77236))

(declare-fun res!97491 () Bool)

(assert (=> b!117848 (=> (not res!97491) (not e!77236))))

(assert (=> b!117848 (= res!97491 (isPrefixOf!0 thiss!1305 (_2!5185 lt!180830)))))

(declare-fun lt!180818 () Unit!7251)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4278 BitStream!4278 BitStream!4278) Unit!7251)

(assert (=> b!117848 (= lt!180818 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5185 lt!180827) (_2!5185 lt!180830)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4278 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9840)

(assert (=> b!117848 (= lt!180830 (appendNLeastSignificantBitsLoop!0 (_2!5185 lt!180827) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117848 e!77243))

(declare-fun res!97492 () Bool)

(assert (=> b!117848 (=> (not res!97492) (not e!77243))))

(assert (=> b!117848 (= res!97492 (= (size!2402 (buf!2818 thiss!1305)) (size!2402 (buf!2818 (_2!5185 lt!180827)))))))

(declare-fun appendBit!0 (BitStream!4278 Bool) tuple2!9840)

(assert (=> b!117848 (= lt!180827 (appendBit!0 thiss!1305 lt!180829))))

(assert (=> b!117848 (= lt!180829 (not (= (bvand v!199 lt!180823) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117848 (= lt!180823 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!117849 () Bool)

(declare-fun res!97489 () Bool)

(assert (=> b!117849 (=> (not res!97489) (not e!77236))))

(assert (=> b!117849 (= res!97489 (invariant!0 (currentBit!5462 thiss!1305) (currentByte!5467 thiss!1305) (size!2402 (buf!2818 (_2!5185 lt!180827)))))))

(declare-fun b!117850 () Bool)

(assert (=> b!117850 (= e!77240 (= (_2!5186 lt!180835) (_2!5186 lt!180824)))))

(declare-fun res!97495 () Bool)

(assert (=> start!23218 (=> (not res!97495) (not e!77239))))

(assert (=> start!23218 (= res!97495 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23218 e!77239))

(assert (=> start!23218 true))

(declare-fun inv!12 (BitStream!4278) Bool)

(assert (=> start!23218 (and (inv!12 thiss!1305) e!77242)))

(declare-fun b!117845 () Bool)

(assert (=> b!117845 (= e!77244 (= (bitIndex!0 (size!2402 (buf!2818 (_1!5186 lt!180821))) (currentByte!5467 (_1!5186 lt!180821)) (currentBit!5462 (_1!5186 lt!180821))) lt!180837))))

(assert (= (and start!23218 res!97495) b!117847))

(assert (= (and b!117847 res!97494) b!117846))

(assert (= (and b!117846 res!97493) b!117839))

(assert (= (and b!117839 res!97490) b!117848))

(assert (= (and b!117848 res!97492) b!117844))

(assert (= (and b!117844 res!97488) b!117840))

(assert (= (and b!117840 res!97496) b!117841))

(assert (= (and b!117841 res!97497) b!117845))

(assert (= (and b!117848 res!97491) b!117849))

(assert (= (and b!117849 res!97489) b!117842))

(assert (= (and b!117848 res!97487) b!117850))

(assert (= start!23218 b!117843))

(declare-fun m!176815 () Bool)

(assert (=> b!117844 m!176815))

(declare-fun m!176817 () Bool)

(assert (=> b!117844 m!176817))

(declare-fun m!176819 () Bool)

(assert (=> b!117840 m!176819))

(declare-fun m!176821 () Bool)

(assert (=> b!117846 m!176821))

(declare-fun m!176823 () Bool)

(assert (=> b!117841 m!176823))

(assert (=> b!117841 m!176823))

(declare-fun m!176825 () Bool)

(assert (=> b!117841 m!176825))

(declare-fun m!176827 () Bool)

(assert (=> b!117845 m!176827))

(declare-fun m!176829 () Bool)

(assert (=> b!117843 m!176829))

(declare-fun m!176831 () Bool)

(assert (=> b!117847 m!176831))

(declare-fun m!176833 () Bool)

(assert (=> start!23218 m!176833))

(declare-fun m!176835 () Bool)

(assert (=> b!117842 m!176835))

(declare-fun m!176837 () Bool)

(assert (=> b!117848 m!176837))

(declare-fun m!176839 () Bool)

(assert (=> b!117848 m!176839))

(declare-fun m!176841 () Bool)

(assert (=> b!117848 m!176841))

(declare-fun m!176843 () Bool)

(assert (=> b!117848 m!176843))

(declare-fun m!176845 () Bool)

(assert (=> b!117848 m!176845))

(declare-fun m!176847 () Bool)

(assert (=> b!117848 m!176847))

(declare-fun m!176849 () Bool)

(assert (=> b!117848 m!176849))

(declare-fun m!176851 () Bool)

(assert (=> b!117848 m!176851))

(declare-fun m!176853 () Bool)

(assert (=> b!117848 m!176853))

(declare-fun m!176855 () Bool)

(assert (=> b!117848 m!176855))

(declare-fun m!176857 () Bool)

(assert (=> b!117848 m!176857))

(declare-fun m!176859 () Bool)

(assert (=> b!117848 m!176859))

(declare-fun m!176861 () Bool)

(assert (=> b!117848 m!176861))

(declare-fun m!176863 () Bool)

(assert (=> b!117848 m!176863))

(declare-fun m!176865 () Bool)

(assert (=> b!117848 m!176865))

(declare-fun m!176867 () Bool)

(assert (=> b!117848 m!176867))

(declare-fun m!176869 () Bool)

(assert (=> b!117848 m!176869))

(declare-fun m!176871 () Bool)

(assert (=> b!117848 m!176871))

(declare-fun m!176873 () Bool)

(assert (=> b!117848 m!176873))

(declare-fun m!176875 () Bool)

(assert (=> b!117849 m!176875))

(check-sat (not start!23218) (not b!117842) (not b!117840) (not b!117843) (not b!117845) (not b!117844) (not b!117849) (not b!117846) (not b!117848) (not b!117847) (not b!117841))
