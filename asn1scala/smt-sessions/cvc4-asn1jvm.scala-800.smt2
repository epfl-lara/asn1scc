; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23214 () Bool)

(assert start!23214)

(declare-fun b!117767 () Bool)

(declare-fun e!77189 () Bool)

(declare-datatypes ((array!5292 0))(
  ( (array!5293 (arr!2993 (Array (_ BitVec 32) (_ BitVec 8))) (size!2400 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4274 0))(
  ( (BitStream!4275 (buf!2816 array!5292) (currentByte!5465 (_ BitVec 32)) (currentBit!5460 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4274)

(declare-datatypes ((Unit!7247 0))(
  ( (Unit!7248) )
))
(declare-datatypes ((tuple2!9824 0))(
  ( (tuple2!9825 (_1!5177 Unit!7247) (_2!5177 BitStream!4274)) )
))
(declare-fun lt!180688 () tuple2!9824)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117767 (= e!77189 (invariant!0 (currentBit!5460 thiss!1305) (currentByte!5465 thiss!1305) (size!2400 (buf!2816 (_2!5177 lt!180688)))))))

(declare-fun b!117768 () Bool)

(declare-fun res!97422 () Bool)

(declare-fun e!77185 () Bool)

(assert (=> b!117768 (=> (not res!97422) (not e!77185))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117768 (= res!97422 (bvslt i!615 nBits!396))))

(declare-fun b!117769 () Bool)

(declare-fun e!77186 () Bool)

(declare-fun e!77187 () Bool)

(assert (=> b!117769 (= e!77186 e!77187)))

(declare-fun res!97429 () Bool)

(assert (=> b!117769 (=> (not res!97429) (not e!77187))))

(declare-fun lt!180698 () (_ BitVec 64))

(declare-fun lt!180692 () (_ BitVec 64))

(assert (=> b!117769 (= res!97429 (= lt!180698 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!180692)))))

(declare-fun lt!180701 () tuple2!9824)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117769 (= lt!180698 (bitIndex!0 (size!2400 (buf!2816 (_2!5177 lt!180701))) (currentByte!5465 (_2!5177 lt!180701)) (currentBit!5460 (_2!5177 lt!180701))))))

(assert (=> b!117769 (= lt!180692 (bitIndex!0 (size!2400 (buf!2816 thiss!1305)) (currentByte!5465 thiss!1305) (currentBit!5460 thiss!1305)))))

(declare-fun b!117770 () Bool)

(declare-fun e!77190 () Bool)

(declare-fun array_inv!2202 (array!5292) Bool)

(assert (=> b!117770 (= e!77190 (array_inv!2202 (buf!2816 thiss!1305)))))

(declare-fun b!117771 () Bool)

(assert (=> b!117771 (= e!77185 (not (or (not (= (bvand i!615 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!615 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)))))))

(declare-fun lt!180702 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117771 (validate_offset_bits!1 ((_ sign_extend 32) (size!2400 (buf!2816 (_2!5177 lt!180688)))) ((_ sign_extend 32) (currentByte!5465 (_2!5177 lt!180701))) ((_ sign_extend 32) (currentBit!5460 (_2!5177 lt!180701))) lt!180702)))

(declare-fun lt!180691 () Unit!7247)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4274 array!5292 (_ BitVec 64)) Unit!7247)

(assert (=> b!117771 (= lt!180691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5177 lt!180701) (buf!2816 (_2!5177 lt!180688)) lt!180702))))

(assert (=> b!117771 (= lt!180702 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!9826 0))(
  ( (tuple2!9827 (_1!5178 BitStream!4274) (_2!5178 BitStream!4274)) )
))
(declare-fun lt!180705 () tuple2!9826)

(declare-datatypes ((tuple2!9828 0))(
  ( (tuple2!9829 (_1!5179 BitStream!4274) (_2!5179 (_ BitVec 64))) )
))
(declare-fun lt!180694 () tuple2!9828)

(declare-fun v!199 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9828)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117771 (= lt!180694 (readNLeastSignificantBitsLoopPure!0 (_1!5178 lt!180705) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!180689 () (_ BitVec 64))

(assert (=> b!117771 (validate_offset_bits!1 ((_ sign_extend 32) (size!2400 (buf!2816 (_2!5177 lt!180688)))) ((_ sign_extend 32) (currentByte!5465 thiss!1305)) ((_ sign_extend 32) (currentBit!5460 thiss!1305)) lt!180689)))

(declare-fun lt!180693 () Unit!7247)

(assert (=> b!117771 (= lt!180693 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2816 (_2!5177 lt!180688)) lt!180689))))

(declare-fun lt!180697 () Bool)

(declare-datatypes ((tuple2!9830 0))(
  ( (tuple2!9831 (_1!5180 BitStream!4274) (_2!5180 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4274) tuple2!9830)

(assert (=> b!117771 (= (_2!5180 (readBitPure!0 (_1!5178 lt!180705))) lt!180697)))

(declare-fun lt!180700 () tuple2!9826)

(declare-fun reader!0 (BitStream!4274 BitStream!4274) tuple2!9826)

(assert (=> b!117771 (= lt!180700 (reader!0 (_2!5177 lt!180701) (_2!5177 lt!180688)))))

(assert (=> b!117771 (= lt!180705 (reader!0 thiss!1305 (_2!5177 lt!180688)))))

(declare-fun e!77184 () Bool)

(assert (=> b!117771 e!77184))

(declare-fun res!97427 () Bool)

(assert (=> b!117771 (=> (not res!97427) (not e!77184))))

(declare-fun lt!180699 () tuple2!9830)

(declare-fun lt!180704 () tuple2!9830)

(assert (=> b!117771 (= res!97427 (= (bitIndex!0 (size!2400 (buf!2816 (_1!5180 lt!180699))) (currentByte!5465 (_1!5180 lt!180699)) (currentBit!5460 (_1!5180 lt!180699))) (bitIndex!0 (size!2400 (buf!2816 (_1!5180 lt!180704))) (currentByte!5465 (_1!5180 lt!180704)) (currentBit!5460 (_1!5180 lt!180704)))))))

(declare-fun lt!180690 () Unit!7247)

(declare-fun lt!180696 () BitStream!4274)

(declare-fun readBitPrefixLemma!0 (BitStream!4274 BitStream!4274) Unit!7247)

(assert (=> b!117771 (= lt!180690 (readBitPrefixLemma!0 lt!180696 (_2!5177 lt!180688)))))

(assert (=> b!117771 (= lt!180704 (readBitPure!0 (BitStream!4275 (buf!2816 (_2!5177 lt!180688)) (currentByte!5465 thiss!1305) (currentBit!5460 thiss!1305))))))

(assert (=> b!117771 (= lt!180699 (readBitPure!0 lt!180696))))

(assert (=> b!117771 (= lt!180696 (BitStream!4275 (buf!2816 (_2!5177 lt!180701)) (currentByte!5465 thiss!1305) (currentBit!5460 thiss!1305)))))

(assert (=> b!117771 e!77189))

(declare-fun res!97430 () Bool)

(assert (=> b!117771 (=> (not res!97430) (not e!77189))))

(declare-fun isPrefixOf!0 (BitStream!4274 BitStream!4274) Bool)

(assert (=> b!117771 (= res!97430 (isPrefixOf!0 thiss!1305 (_2!5177 lt!180688)))))

(declare-fun lt!180703 () Unit!7247)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4274 BitStream!4274 BitStream!4274) Unit!7247)

(assert (=> b!117771 (= lt!180703 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5177 lt!180701) (_2!5177 lt!180688)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4274 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9824)

(assert (=> b!117771 (= lt!180688 (appendNLeastSignificantBitsLoop!0 (_2!5177 lt!180701) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117771 e!77186))

(declare-fun res!97423 () Bool)

(assert (=> b!117771 (=> (not res!97423) (not e!77186))))

(assert (=> b!117771 (= res!97423 (= (size!2400 (buf!2816 thiss!1305)) (size!2400 (buf!2816 (_2!5177 lt!180701)))))))

(declare-fun appendBit!0 (BitStream!4274 Bool) tuple2!9824)

(assert (=> b!117771 (= lt!180701 (appendBit!0 thiss!1305 lt!180697))))

(assert (=> b!117771 (= lt!180697 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!117772 () Bool)

(declare-fun res!97426 () Bool)

(assert (=> b!117772 (=> (not res!97426) (not e!77185))))

(assert (=> b!117772 (= res!97426 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117774 () Bool)

(assert (=> b!117774 (= e!77184 (= (_2!5180 lt!180699) (_2!5180 lt!180704)))))

(declare-fun b!117775 () Bool)

(declare-fun e!77182 () Bool)

(declare-fun lt!180695 () tuple2!9830)

(assert (=> b!117775 (= e!77182 (= (bitIndex!0 (size!2400 (buf!2816 (_1!5180 lt!180695))) (currentByte!5465 (_1!5180 lt!180695)) (currentBit!5460 (_1!5180 lt!180695))) lt!180698))))

(declare-fun b!117776 () Bool)

(declare-fun res!97425 () Bool)

(assert (=> b!117776 (=> (not res!97425) (not e!77187))))

(assert (=> b!117776 (= res!97425 (isPrefixOf!0 thiss!1305 (_2!5177 lt!180701)))))

(declare-fun b!117777 () Bool)

(declare-fun res!97421 () Bool)

(assert (=> b!117777 (=> (not res!97421) (not e!77189))))

(assert (=> b!117777 (= res!97421 (invariant!0 (currentBit!5460 thiss!1305) (currentByte!5465 thiss!1305) (size!2400 (buf!2816 (_2!5177 lt!180701)))))))

(declare-fun b!117778 () Bool)

(assert (=> b!117778 (= e!77187 e!77182)))

(declare-fun res!97431 () Bool)

(assert (=> b!117778 (=> (not res!97431) (not e!77182))))

(assert (=> b!117778 (= res!97431 (and (= (_2!5180 lt!180695) lt!180697) (= (_1!5180 lt!180695) (_2!5177 lt!180701))))))

(declare-fun readerFrom!0 (BitStream!4274 (_ BitVec 32) (_ BitVec 32)) BitStream!4274)

(assert (=> b!117778 (= lt!180695 (readBitPure!0 (readerFrom!0 (_2!5177 lt!180701) (currentBit!5460 thiss!1305) (currentByte!5465 thiss!1305))))))

(declare-fun b!117773 () Bool)

(declare-fun e!77188 () Bool)

(assert (=> b!117773 (= e!77188 e!77185)))

(declare-fun res!97424 () Bool)

(assert (=> b!117773 (=> (not res!97424) (not e!77185))))

(assert (=> b!117773 (= res!97424 (validate_offset_bits!1 ((_ sign_extend 32) (size!2400 (buf!2816 thiss!1305))) ((_ sign_extend 32) (currentByte!5465 thiss!1305)) ((_ sign_extend 32) (currentBit!5460 thiss!1305)) lt!180689))))

(assert (=> b!117773 (= lt!180689 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!97428 () Bool)

(assert (=> start!23214 (=> (not res!97428) (not e!77188))))

(assert (=> start!23214 (= res!97428 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23214 e!77188))

(assert (=> start!23214 true))

(declare-fun inv!12 (BitStream!4274) Bool)

(assert (=> start!23214 (and (inv!12 thiss!1305) e!77190)))

(assert (= (and start!23214 res!97428) b!117773))

(assert (= (and b!117773 res!97424) b!117772))

(assert (= (and b!117772 res!97426) b!117768))

(assert (= (and b!117768 res!97422) b!117771))

(assert (= (and b!117771 res!97423) b!117769))

(assert (= (and b!117769 res!97429) b!117776))

(assert (= (and b!117776 res!97425) b!117778))

(assert (= (and b!117778 res!97431) b!117775))

(assert (= (and b!117771 res!97430) b!117777))

(assert (= (and b!117777 res!97421) b!117767))

(assert (= (and b!117771 res!97427) b!117774))

(assert (= start!23214 b!117770))

(declare-fun m!176693 () Bool)

(assert (=> b!117772 m!176693))

(declare-fun m!176695 () Bool)

(assert (=> start!23214 m!176695))

(declare-fun m!176697 () Bool)

(assert (=> b!117777 m!176697))

(declare-fun m!176699 () Bool)

(assert (=> b!117771 m!176699))

(declare-fun m!176701 () Bool)

(assert (=> b!117771 m!176701))

(declare-fun m!176703 () Bool)

(assert (=> b!117771 m!176703))

(declare-fun m!176705 () Bool)

(assert (=> b!117771 m!176705))

(declare-fun m!176707 () Bool)

(assert (=> b!117771 m!176707))

(declare-fun m!176709 () Bool)

(assert (=> b!117771 m!176709))

(declare-fun m!176711 () Bool)

(assert (=> b!117771 m!176711))

(declare-fun m!176713 () Bool)

(assert (=> b!117771 m!176713))

(declare-fun m!176715 () Bool)

(assert (=> b!117771 m!176715))

(declare-fun m!176717 () Bool)

(assert (=> b!117771 m!176717))

(declare-fun m!176719 () Bool)

(assert (=> b!117771 m!176719))

(declare-fun m!176721 () Bool)

(assert (=> b!117771 m!176721))

(declare-fun m!176723 () Bool)

(assert (=> b!117771 m!176723))

(declare-fun m!176725 () Bool)

(assert (=> b!117771 m!176725))

(declare-fun m!176727 () Bool)

(assert (=> b!117771 m!176727))

(declare-fun m!176729 () Bool)

(assert (=> b!117771 m!176729))

(declare-fun m!176731 () Bool)

(assert (=> b!117771 m!176731))

(declare-fun m!176733 () Bool)

(assert (=> b!117771 m!176733))

(declare-fun m!176735 () Bool)

(assert (=> b!117776 m!176735))

(declare-fun m!176737 () Bool)

(assert (=> b!117767 m!176737))

(declare-fun m!176739 () Bool)

(assert (=> b!117770 m!176739))

(declare-fun m!176741 () Bool)

(assert (=> b!117778 m!176741))

(assert (=> b!117778 m!176741))

(declare-fun m!176743 () Bool)

(assert (=> b!117778 m!176743))

(declare-fun m!176745 () Bool)

(assert (=> b!117773 m!176745))

(declare-fun m!176747 () Bool)

(assert (=> b!117775 m!176747))

(declare-fun m!176749 () Bool)

(assert (=> b!117769 m!176749))

(declare-fun m!176751 () Bool)

(assert (=> b!117769 m!176751))

(push 1)

(assert (not b!117775))

(assert (not b!117776))

(assert (not start!23214))

(assert (not b!117777))

(assert (not b!117767))

(assert (not b!117778))

(assert (not b!117769))

(assert (not b!117773))

(assert (not b!117770))

(assert (not b!117771))

(assert (not b!117772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

