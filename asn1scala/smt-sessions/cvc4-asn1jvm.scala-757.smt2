; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21740 () Bool)

(assert start!21740)

(declare-fun b!109864 () Bool)

(declare-fun res!90674 () Bool)

(declare-fun e!71992 () Bool)

(assert (=> b!109864 (=> (not res!90674) (not e!71992))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109864 (= res!90674 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109865 () Bool)

(declare-fun e!71991 () Bool)

(declare-datatypes ((array!4998 0))(
  ( (array!4999 (arr!2867 (Array (_ BitVec 32) (_ BitVec 8))) (size!2274 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4022 0))(
  ( (BitStream!4023 (buf!2668 array!4998) (currentByte!5210 (_ BitVec 32)) (currentBit!5205 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9136 0))(
  ( (tuple2!9137 (_1!4825 BitStream!4022) (_2!4825 Bool)) )
))
(declare-fun lt!166637 () tuple2!9136)

(declare-fun lt!166627 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109865 (= e!71991 (= (bitIndex!0 (size!2274 (buf!2668 (_1!4825 lt!166637))) (currentByte!5210 (_1!4825 lt!166637)) (currentBit!5205 (_1!4825 lt!166637))) lt!166627))))

(declare-fun b!109866 () Bool)

(declare-fun e!71988 () Bool)

(declare-fun thiss!1305 () BitStream!4022)

(declare-datatypes ((Unit!6713 0))(
  ( (Unit!6714) )
))
(declare-datatypes ((tuple2!9138 0))(
  ( (tuple2!9139 (_1!4826 Unit!6713) (_2!4826 BitStream!4022)) )
))
(declare-fun lt!166612 () tuple2!9138)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109866 (= e!71988 (invariant!0 (currentBit!5205 thiss!1305) (currentByte!5210 thiss!1305) (size!2274 (buf!2668 (_2!4826 lt!166612)))))))

(declare-fun b!109867 () Bool)

(declare-fun res!90671 () Bool)

(assert (=> b!109867 (=> (not res!90671) (not e!71992))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!109867 (= res!90671 (bvslt i!615 nBits!396))))

(declare-fun b!109868 () Bool)

(declare-fun res!90679 () Bool)

(assert (=> b!109868 (=> (not res!90679) (not e!71988))))

(declare-fun lt!166617 () tuple2!9138)

(assert (=> b!109868 (= res!90679 (invariant!0 (currentBit!5205 thiss!1305) (currentByte!5210 thiss!1305) (size!2274 (buf!2668 (_2!4826 lt!166617)))))))

(declare-fun b!109869 () Bool)

(declare-fun e!71995 () Bool)

(declare-fun array_inv!2076 (array!4998) Bool)

(assert (=> b!109869 (= e!71995 (array_inv!2076 (buf!2668 thiss!1305)))))

(declare-fun b!109870 () Bool)

(declare-fun e!71994 () Bool)

(declare-fun e!71996 () Bool)

(assert (=> b!109870 (= e!71994 e!71996)))

(declare-fun res!90680 () Bool)

(assert (=> b!109870 (=> (not res!90680) (not e!71996))))

(declare-fun lt!166616 () (_ BitVec 64))

(assert (=> b!109870 (= res!90680 (= lt!166627 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!166616)))))

(assert (=> b!109870 (= lt!166627 (bitIndex!0 (size!2274 (buf!2668 (_2!4826 lt!166617))) (currentByte!5210 (_2!4826 lt!166617)) (currentBit!5205 (_2!4826 lt!166617))))))

(assert (=> b!109870 (= lt!166616 (bitIndex!0 (size!2274 (buf!2668 thiss!1305)) (currentByte!5210 thiss!1305) (currentBit!5205 thiss!1305)))))

(declare-fun b!109871 () Bool)

(assert (=> b!109871 (= e!71996 e!71991)))

(declare-fun res!90676 () Bool)

(assert (=> b!109871 (=> (not res!90676) (not e!71991))))

(declare-fun lt!166635 () Bool)

(assert (=> b!109871 (= res!90676 (and (= (_2!4825 lt!166637) lt!166635) (= (_1!4825 lt!166637) (_2!4826 lt!166617))))))

(declare-fun readBitPure!0 (BitStream!4022) tuple2!9136)

(declare-fun readerFrom!0 (BitStream!4022 (_ BitVec 32) (_ BitVec 32)) BitStream!4022)

(assert (=> b!109871 (= lt!166637 (readBitPure!0 (readerFrom!0 (_2!4826 lt!166617) (currentBit!5205 thiss!1305) (currentByte!5210 thiss!1305))))))

(declare-fun b!109872 () Bool)

(declare-fun e!71999 () Bool)

(declare-fun e!71993 () Bool)

(assert (=> b!109872 (= e!71999 e!71993)))

(declare-fun res!90669 () Bool)

(assert (=> b!109872 (=> res!90669 e!71993)))

(declare-fun lt!166636 () (_ BitVec 64))

(declare-fun lt!166624 () BitStream!4022)

(declare-fun lt!166631 () (_ BitVec 64))

(declare-fun lt!166619 () (_ BitVec 64))

(declare-datatypes ((tuple2!9140 0))(
  ( (tuple2!9141 (_1!4827 BitStream!4022) (_2!4827 BitStream!4022)) )
))
(declare-fun lt!166629 () tuple2!9140)

(assert (=> b!109872 (= res!90669 (or (not (= (_1!4827 lt!166629) lt!166624)) (not (= (size!2274 (buf!2668 thiss!1305)) (size!2274 (buf!2668 (_2!4826 lt!166612))))) (not (= lt!166636 (bvadd lt!166619 lt!166631)))))))

(declare-fun e!71998 () Bool)

(assert (=> b!109872 e!71998))

(declare-fun res!90673 () Bool)

(assert (=> b!109872 (=> (not res!90673) (not e!71998))))

(declare-fun lt!166632 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4022 (_ BitVec 64)) BitStream!4022)

(assert (=> b!109872 (= res!90673 (= (_1!4827 lt!166629) (withMovedBitIndex!0 (_2!4827 lt!166629) (bvsub lt!166632 lt!166636))))))

(assert (=> b!109872 (= lt!166632 (bitIndex!0 (size!2274 (buf!2668 (_2!4826 lt!166617))) (currentByte!5210 (_2!4826 lt!166617)) (currentBit!5205 (_2!4826 lt!166617))))))

(declare-fun lt!166609 () tuple2!9140)

(assert (=> b!109872 (= (_1!4827 lt!166609) (withMovedBitIndex!0 (_2!4827 lt!166609) (bvsub lt!166619 lt!166636)))))

(assert (=> b!109872 (= lt!166636 (bitIndex!0 (size!2274 (buf!2668 (_2!4826 lt!166612))) (currentByte!5210 (_2!4826 lt!166612)) (currentBit!5205 (_2!4826 lt!166612))))))

(assert (=> b!109872 (= lt!166619 (bitIndex!0 (size!2274 (buf!2668 thiss!1305)) (currentByte!5210 thiss!1305) (currentBit!5205 thiss!1305)))))

(declare-datatypes ((tuple2!9142 0))(
  ( (tuple2!9143 (_1!4828 BitStream!4022) (_2!4828 (_ BitVec 64))) )
))
(declare-fun lt!166625 () tuple2!9142)

(declare-fun lt!166614 () tuple2!9142)

(assert (=> b!109872 (and (= (_2!4828 lt!166625) (_2!4828 lt!166614)) (= (_1!4828 lt!166625) (_1!4828 lt!166614)))))

(declare-fun lt!166630 () (_ BitVec 64))

(declare-fun lt!166610 () Unit!6713)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6713)

(assert (=> b!109872 (= lt!166610 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4827 lt!166609) nBits!396 i!615 lt!166630))))

(declare-fun lt!166633 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9142)

(assert (=> b!109872 (= lt!166614 (readNLeastSignificantBitsLoopPure!0 lt!166624 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166633))))

(assert (=> b!109872 (= lt!166624 (withMovedBitIndex!0 (_1!4827 lt!166609) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!166621 () tuple2!9142)

(declare-fun b!109873 () Bool)

(assert (=> b!109873 (= e!71998 (and (= lt!166619 (bvsub lt!166632 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4827 lt!166629) lt!166624)) (and (= (_2!4828 lt!166625) (_2!4828 lt!166621)) (= (_1!4828 lt!166625) (_2!4827 lt!166609))))))))

(declare-fun b!109874 () Bool)

(declare-fun e!71990 () Bool)

(declare-fun lt!166611 () tuple2!9136)

(declare-fun lt!166623 () tuple2!9136)

(assert (=> b!109874 (= e!71990 (= (_2!4825 lt!166611) (_2!4825 lt!166623)))))

(declare-fun b!109876 () Bool)

(declare-fun e!71997 () Bool)

(assert (=> b!109876 (= e!71997 e!71992)))

(declare-fun res!90677 () Bool)

(assert (=> b!109876 (=> (not res!90677) (not e!71992))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109876 (= res!90677 (validate_offset_bits!1 ((_ sign_extend 32) (size!2274 (buf!2668 thiss!1305))) ((_ sign_extend 32) (currentByte!5210 thiss!1305)) ((_ sign_extend 32) (currentBit!5205 thiss!1305)) lt!166631))))

(assert (=> b!109876 (= lt!166631 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109877 () Bool)

(declare-fun res!90678 () Bool)

(assert (=> b!109877 (=> res!90678 e!71993)))

(assert (=> b!109877 (= res!90678 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2274 (buf!2668 (_1!4827 lt!166609)))) ((_ sign_extend 32) (currentByte!5210 (_1!4827 lt!166609))) ((_ sign_extend 32) (currentBit!5205 (_1!4827 lt!166609))) lt!166631)))))

(declare-fun b!109878 () Bool)

(assert (=> b!109878 (= e!71992 (not e!71999))))

(declare-fun res!90675 () Bool)

(assert (=> b!109878 (=> res!90675 e!71999)))

(assert (=> b!109878 (= res!90675 (not (= (_1!4828 lt!166621) (_2!4827 lt!166629))))))

(assert (=> b!109878 (= lt!166621 (readNLeastSignificantBitsLoopPure!0 (_1!4827 lt!166629) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166633))))

(declare-fun lt!166618 () (_ BitVec 64))

(assert (=> b!109878 (validate_offset_bits!1 ((_ sign_extend 32) (size!2274 (buf!2668 (_2!4826 lt!166612)))) ((_ sign_extend 32) (currentByte!5210 (_2!4826 lt!166617))) ((_ sign_extend 32) (currentBit!5205 (_2!4826 lt!166617))) lt!166618)))

(declare-fun lt!166622 () Unit!6713)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4022 array!4998 (_ BitVec 64)) Unit!6713)

(assert (=> b!109878 (= lt!166622 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4826 lt!166617) (buf!2668 (_2!4826 lt!166612)) lt!166618))))

(assert (=> b!109878 (= lt!166618 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!166613 () tuple2!9136)

(declare-fun lt!166628 () (_ BitVec 64))

(assert (=> b!109878 (= lt!166633 (bvor lt!166630 (ite (_2!4825 lt!166613) lt!166628 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109878 (= lt!166625 (readNLeastSignificantBitsLoopPure!0 (_1!4827 lt!166609) nBits!396 i!615 lt!166630))))

(assert (=> b!109878 (validate_offset_bits!1 ((_ sign_extend 32) (size!2274 (buf!2668 (_2!4826 lt!166612)))) ((_ sign_extend 32) (currentByte!5210 thiss!1305)) ((_ sign_extend 32) (currentBit!5205 thiss!1305)) lt!166631)))

(declare-fun lt!166615 () Unit!6713)

(assert (=> b!109878 (= lt!166615 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2668 (_2!4826 lt!166612)) lt!166631))))

(declare-fun lt!166626 () (_ BitVec 64))

(assert (=> b!109878 (= lt!166630 (bvand v!199 (bvnot lt!166626)))))

(assert (=> b!109878 (= lt!166626 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!109878 (= (_2!4825 lt!166613) lt!166635)))

(assert (=> b!109878 (= lt!166613 (readBitPure!0 (_1!4827 lt!166609)))))

(declare-fun reader!0 (BitStream!4022 BitStream!4022) tuple2!9140)

(assert (=> b!109878 (= lt!166629 (reader!0 (_2!4826 lt!166617) (_2!4826 lt!166612)))))

(assert (=> b!109878 (= lt!166609 (reader!0 thiss!1305 (_2!4826 lt!166612)))))

(assert (=> b!109878 e!71990))

(declare-fun res!90670 () Bool)

(assert (=> b!109878 (=> (not res!90670) (not e!71990))))

(assert (=> b!109878 (= res!90670 (= (bitIndex!0 (size!2274 (buf!2668 (_1!4825 lt!166611))) (currentByte!5210 (_1!4825 lt!166611)) (currentBit!5205 (_1!4825 lt!166611))) (bitIndex!0 (size!2274 (buf!2668 (_1!4825 lt!166623))) (currentByte!5210 (_1!4825 lt!166623)) (currentBit!5205 (_1!4825 lt!166623)))))))

(declare-fun lt!166634 () Unit!6713)

(declare-fun lt!166620 () BitStream!4022)

(declare-fun readBitPrefixLemma!0 (BitStream!4022 BitStream!4022) Unit!6713)

(assert (=> b!109878 (= lt!166634 (readBitPrefixLemma!0 lt!166620 (_2!4826 lt!166612)))))

(assert (=> b!109878 (= lt!166623 (readBitPure!0 (BitStream!4023 (buf!2668 (_2!4826 lt!166612)) (currentByte!5210 thiss!1305) (currentBit!5205 thiss!1305))))))

(assert (=> b!109878 (= lt!166611 (readBitPure!0 lt!166620))))

(assert (=> b!109878 (= lt!166620 (BitStream!4023 (buf!2668 (_2!4826 lt!166617)) (currentByte!5210 thiss!1305) (currentBit!5205 thiss!1305)))))

(assert (=> b!109878 e!71988))

(declare-fun res!90681 () Bool)

(assert (=> b!109878 (=> (not res!90681) (not e!71988))))

(declare-fun isPrefixOf!0 (BitStream!4022 BitStream!4022) Bool)

(assert (=> b!109878 (= res!90681 (isPrefixOf!0 thiss!1305 (_2!4826 lt!166612)))))

(declare-fun lt!166608 () Unit!6713)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4022 BitStream!4022 BitStream!4022) Unit!6713)

(assert (=> b!109878 (= lt!166608 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4826 lt!166617) (_2!4826 lt!166612)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4022 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9138)

(assert (=> b!109878 (= lt!166612 (appendNLeastSignificantBitsLoop!0 (_2!4826 lt!166617) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!109878 e!71994))

(declare-fun res!90668 () Bool)

(assert (=> b!109878 (=> (not res!90668) (not e!71994))))

(assert (=> b!109878 (= res!90668 (= (size!2274 (buf!2668 thiss!1305)) (size!2274 (buf!2668 (_2!4826 lt!166617)))))))

(declare-fun appendBit!0 (BitStream!4022 Bool) tuple2!9138)

(assert (=> b!109878 (= lt!166617 (appendBit!0 thiss!1305 lt!166635))))

(assert (=> b!109878 (= lt!166635 (not (= (bvand v!199 lt!166628) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109878 (= lt!166628 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109879 () Bool)

(declare-fun res!90672 () Bool)

(assert (=> b!109879 (=> (not res!90672) (not e!71996))))

(assert (=> b!109879 (= res!90672 (isPrefixOf!0 thiss!1305 (_2!4826 lt!166617)))))

(declare-fun b!109875 () Bool)

(assert (=> b!109875 (= e!71993 (= (bvand lt!166630 lt!166626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!90682 () Bool)

(assert (=> start!21740 (=> (not res!90682) (not e!71997))))

(assert (=> start!21740 (= res!90682 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21740 e!71997))

(assert (=> start!21740 true))

(declare-fun inv!12 (BitStream!4022) Bool)

(assert (=> start!21740 (and (inv!12 thiss!1305) e!71995)))

(assert (= (and start!21740 res!90682) b!109876))

(assert (= (and b!109876 res!90677) b!109864))

(assert (= (and b!109864 res!90674) b!109867))

(assert (= (and b!109867 res!90671) b!109878))

(assert (= (and b!109878 res!90668) b!109870))

(assert (= (and b!109870 res!90680) b!109879))

(assert (= (and b!109879 res!90672) b!109871))

(assert (= (and b!109871 res!90676) b!109865))

(assert (= (and b!109878 res!90681) b!109868))

(assert (= (and b!109868 res!90679) b!109866))

(assert (= (and b!109878 res!90670) b!109874))

(assert (= (and b!109878 (not res!90675)) b!109872))

(assert (= (and b!109872 res!90673) b!109873))

(assert (= (and b!109872 (not res!90669)) b!109877))

(assert (= (and b!109877 (not res!90678)) b!109875))

(assert (= start!21740 b!109869))

(declare-fun m!163327 () Bool)

(assert (=> b!109864 m!163327))

(declare-fun m!163329 () Bool)

(assert (=> b!109869 m!163329))

(declare-fun m!163331 () Bool)

(assert (=> b!109876 m!163331))

(declare-fun m!163333 () Bool)

(assert (=> b!109871 m!163333))

(assert (=> b!109871 m!163333))

(declare-fun m!163335 () Bool)

(assert (=> b!109871 m!163335))

(declare-fun m!163337 () Bool)

(assert (=> b!109870 m!163337))

(declare-fun m!163339 () Bool)

(assert (=> b!109870 m!163339))

(declare-fun m!163341 () Bool)

(assert (=> b!109868 m!163341))

(declare-fun m!163343 () Bool)

(assert (=> b!109866 m!163343))

(declare-fun m!163345 () Bool)

(assert (=> b!109877 m!163345))

(declare-fun m!163347 () Bool)

(assert (=> b!109879 m!163347))

(declare-fun m!163349 () Bool)

(assert (=> start!21740 m!163349))

(declare-fun m!163351 () Bool)

(assert (=> b!109878 m!163351))

(declare-fun m!163353 () Bool)

(assert (=> b!109878 m!163353))

(declare-fun m!163355 () Bool)

(assert (=> b!109878 m!163355))

(declare-fun m!163357 () Bool)

(assert (=> b!109878 m!163357))

(declare-fun m!163359 () Bool)

(assert (=> b!109878 m!163359))

(declare-fun m!163361 () Bool)

(assert (=> b!109878 m!163361))

(declare-fun m!163363 () Bool)

(assert (=> b!109878 m!163363))

(declare-fun m!163365 () Bool)

(assert (=> b!109878 m!163365))

(declare-fun m!163367 () Bool)

(assert (=> b!109878 m!163367))

(declare-fun m!163369 () Bool)

(assert (=> b!109878 m!163369))

(declare-fun m!163371 () Bool)

(assert (=> b!109878 m!163371))

(declare-fun m!163373 () Bool)

(assert (=> b!109878 m!163373))

(declare-fun m!163375 () Bool)

(assert (=> b!109878 m!163375))

(declare-fun m!163377 () Bool)

(assert (=> b!109878 m!163377))

(declare-fun m!163379 () Bool)

(assert (=> b!109878 m!163379))

(declare-fun m!163381 () Bool)

(assert (=> b!109878 m!163381))

(declare-fun m!163383 () Bool)

(assert (=> b!109878 m!163383))

(declare-fun m!163385 () Bool)

(assert (=> b!109878 m!163385))

(declare-fun m!163387 () Bool)

(assert (=> b!109878 m!163387))

(assert (=> b!109872 m!163337))

(declare-fun m!163389 () Bool)

(assert (=> b!109872 m!163389))

(declare-fun m!163391 () Bool)

(assert (=> b!109872 m!163391))

(declare-fun m!163393 () Bool)

(assert (=> b!109872 m!163393))

(declare-fun m!163395 () Bool)

(assert (=> b!109872 m!163395))

(assert (=> b!109872 m!163339))

(declare-fun m!163397 () Bool)

(assert (=> b!109872 m!163397))

(declare-fun m!163399 () Bool)

(assert (=> b!109872 m!163399))

(declare-fun m!163401 () Bool)

(assert (=> b!109865 m!163401))

(push 1)

(assert (not b!109868))

(assert (not b!109879))

(assert (not b!109871))

(assert (not b!109866))

(assert (not b!109877))

(assert (not b!109878))

(assert (not start!21740))

(assert (not b!109876))

(assert (not b!109865))

(assert (not b!109864))

(assert (not b!109872))

(assert (not b!109870))

(assert (not b!109869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

