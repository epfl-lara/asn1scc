; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20602 () Bool)

(assert start!20602)

(declare-fun b!104105 () Bool)

(declare-fun e!68187 () Bool)

(declare-datatypes ((array!4860 0))(
  ( (array!4861 (arr!2811 (Array (_ BitVec 32) (_ BitVec 8))) (size!2218 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3910 0))(
  ( (BitStream!3911 (buf!2584 array!4860) (currentByte!5069 (_ BitVec 32)) (currentBit!5064 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3910)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104105 (= e!68187 (invariant!0 (currentBit!5064 thiss!1305) (currentByte!5069 thiss!1305) (size!2218 (buf!2584 thiss!1305))))))

(declare-datatypes ((tuple2!8590 0))(
  ( (tuple2!8591 (_1!4550 BitStream!3910) (_2!4550 (_ BitVec 64))) )
))
(declare-fun lt!152525 () tuple2!8590)

(declare-fun lt!152530 () tuple2!8590)

(assert (=> b!104105 (and (= (_2!4550 lt!152525) (_2!4550 lt!152530)) (= (_1!4550 lt!152525) (_1!4550 lt!152530)))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!152521 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((Unit!6380 0))(
  ( (Unit!6381) )
))
(declare-fun lt!152523 () Unit!6380)

(declare-datatypes ((tuple2!8592 0))(
  ( (tuple2!8593 (_1!4551 BitStream!3910) (_2!4551 BitStream!3910)) )
))
(declare-fun lt!152534 () tuple2!8592)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6380)

(assert (=> b!104105 (= lt!152523 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4551 lt!152534) nBits!396 i!615 lt!152521))))

(declare-fun lt!152526 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8590)

(declare-fun withMovedBitIndex!0 (BitStream!3910 (_ BitVec 64)) BitStream!3910)

(assert (=> b!104105 (= lt!152530 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4551 lt!152534) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152526))))

(declare-fun b!104106 () Bool)

(declare-fun res!85708 () Bool)

(declare-fun e!68196 () Bool)

(assert (=> b!104106 (=> (not res!85708) (not e!68196))))

(declare-datatypes ((tuple2!8594 0))(
  ( (tuple2!8595 (_1!4552 Unit!6380) (_2!4552 BitStream!3910)) )
))
(declare-fun lt!152514 () tuple2!8594)

(declare-fun isPrefixOf!0 (BitStream!3910 BitStream!3910) Bool)

(assert (=> b!104106 (= res!85708 (isPrefixOf!0 thiss!1305 (_2!4552 lt!152514)))))

(declare-fun b!104107 () Bool)

(declare-fun res!85705 () Bool)

(declare-fun e!68188 () Bool)

(assert (=> b!104107 (=> (not res!85705) (not e!68188))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104107 (= res!85705 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!104108 () Bool)

(declare-fun e!68192 () Bool)

(declare-datatypes ((tuple2!8596 0))(
  ( (tuple2!8597 (_1!4553 BitStream!3910) (_2!4553 Bool)) )
))
(declare-fun lt!152520 () tuple2!8596)

(declare-fun lt!152528 () tuple2!8596)

(assert (=> b!104108 (= e!68192 (= (_2!4553 lt!152520) (_2!4553 lt!152528)))))

(declare-fun b!104110 () Bool)

(declare-fun res!85709 () Bool)

(declare-fun e!68195 () Bool)

(assert (=> b!104110 (=> (not res!85709) (not e!68195))))

(assert (=> b!104110 (= res!85709 (invariant!0 (currentBit!5064 thiss!1305) (currentByte!5069 thiss!1305) (size!2218 (buf!2584 (_2!4552 lt!152514)))))))

(declare-fun b!104111 () Bool)

(declare-fun lt!152536 () tuple2!8594)

(assert (=> b!104111 (= e!68195 (invariant!0 (currentBit!5064 thiss!1305) (currentByte!5069 thiss!1305) (size!2218 (buf!2584 (_2!4552 lt!152536)))))))

(declare-fun b!104112 () Bool)

(declare-fun e!68190 () Bool)

(assert (=> b!104112 (= e!68190 e!68196)))

(declare-fun res!85707 () Bool)

(assert (=> b!104112 (=> (not res!85707) (not e!68196))))

(declare-fun lt!152517 () (_ BitVec 64))

(declare-fun lt!152531 () (_ BitVec 64))

(assert (=> b!104112 (= res!85707 (= lt!152517 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152531)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104112 (= lt!152517 (bitIndex!0 (size!2218 (buf!2584 (_2!4552 lt!152514))) (currentByte!5069 (_2!4552 lt!152514)) (currentBit!5064 (_2!4552 lt!152514))))))

(assert (=> b!104112 (= lt!152531 (bitIndex!0 (size!2218 (buf!2584 thiss!1305)) (currentByte!5069 thiss!1305) (currentBit!5064 thiss!1305)))))

(declare-fun b!104113 () Bool)

(declare-fun e!68193 () Bool)

(assert (=> b!104113 (= e!68193 e!68188)))

(declare-fun res!85704 () Bool)

(assert (=> b!104113 (=> (not res!85704) (not e!68188))))

(declare-fun lt!152513 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104113 (= res!85704 (validate_offset_bits!1 ((_ sign_extend 32) (size!2218 (buf!2584 thiss!1305))) ((_ sign_extend 32) (currentByte!5069 thiss!1305)) ((_ sign_extend 32) (currentBit!5064 thiss!1305)) lt!152513))))

(assert (=> b!104113 (= lt!152513 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!104114 () Bool)

(declare-fun e!68189 () Bool)

(declare-fun lt!152527 () tuple2!8596)

(assert (=> b!104114 (= e!68189 (= (bitIndex!0 (size!2218 (buf!2584 (_1!4553 lt!152527))) (currentByte!5069 (_1!4553 lt!152527)) (currentBit!5064 (_1!4553 lt!152527))) lt!152517))))

(declare-fun b!104115 () Bool)

(declare-fun e!68191 () Bool)

(declare-fun array_inv!2020 (array!4860) Bool)

(assert (=> b!104115 (= e!68191 (array_inv!2020 (buf!2584 thiss!1305)))))

(declare-fun b!104116 () Bool)

(declare-fun res!85701 () Bool)

(assert (=> b!104116 (=> (not res!85701) (not e!68188))))

(assert (=> b!104116 (= res!85701 (bvslt i!615 nBits!396))))

(declare-fun b!104117 () Bool)

(assert (=> b!104117 (= e!68196 e!68189)))

(declare-fun res!85702 () Bool)

(assert (=> b!104117 (=> (not res!85702) (not e!68189))))

(declare-fun lt!152532 () Bool)

(assert (=> b!104117 (= res!85702 (and (= (_2!4553 lt!152527) lt!152532) (= (_1!4553 lt!152527) (_2!4552 lt!152514))))))

(declare-fun readBitPure!0 (BitStream!3910) tuple2!8596)

(declare-fun readerFrom!0 (BitStream!3910 (_ BitVec 32) (_ BitVec 32)) BitStream!3910)

(assert (=> b!104117 (= lt!152527 (readBitPure!0 (readerFrom!0 (_2!4552 lt!152514) (currentBit!5064 thiss!1305) (currentByte!5069 thiss!1305))))))

(declare-fun res!85711 () Bool)

(assert (=> start!20602 (=> (not res!85711) (not e!68193))))

(assert (=> start!20602 (= res!85711 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20602 e!68193))

(assert (=> start!20602 true))

(declare-fun inv!12 (BitStream!3910) Bool)

(assert (=> start!20602 (and (inv!12 thiss!1305) e!68191)))

(declare-fun b!104109 () Bool)

(assert (=> b!104109 (= e!68188 (not e!68187))))

(declare-fun res!85710 () Bool)

(assert (=> b!104109 (=> res!85710 e!68187)))

(declare-fun lt!152518 () tuple2!8592)

(assert (=> b!104109 (= res!85710 (not (= (_1!4550 (readNLeastSignificantBitsLoopPure!0 (_1!4551 lt!152518) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152526)) (_2!4551 lt!152518))))))

(declare-fun lt!152533 () (_ BitVec 64))

(assert (=> b!104109 (validate_offset_bits!1 ((_ sign_extend 32) (size!2218 (buf!2584 (_2!4552 lt!152536)))) ((_ sign_extend 32) (currentByte!5069 (_2!4552 lt!152514))) ((_ sign_extend 32) (currentBit!5064 (_2!4552 lt!152514))) lt!152533)))

(declare-fun lt!152515 () Unit!6380)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3910 array!4860 (_ BitVec 64)) Unit!6380)

(assert (=> b!104109 (= lt!152515 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4552 lt!152514) (buf!2584 (_2!4552 lt!152536)) lt!152533))))

(assert (=> b!104109 (= lt!152533 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152529 () (_ BitVec 64))

(declare-fun lt!152522 () tuple2!8596)

(assert (=> b!104109 (= lt!152526 (bvor lt!152521 (ite (_2!4553 lt!152522) lt!152529 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104109 (= lt!152525 (readNLeastSignificantBitsLoopPure!0 (_1!4551 lt!152534) nBits!396 i!615 lt!152521))))

(assert (=> b!104109 (validate_offset_bits!1 ((_ sign_extend 32) (size!2218 (buf!2584 (_2!4552 lt!152536)))) ((_ sign_extend 32) (currentByte!5069 thiss!1305)) ((_ sign_extend 32) (currentBit!5064 thiss!1305)) lt!152513)))

(declare-fun lt!152519 () Unit!6380)

(assert (=> b!104109 (= lt!152519 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2584 (_2!4552 lt!152536)) lt!152513))))

(assert (=> b!104109 (= lt!152521 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!104109 (= (_2!4553 lt!152522) lt!152532)))

(assert (=> b!104109 (= lt!152522 (readBitPure!0 (_1!4551 lt!152534)))))

(declare-fun reader!0 (BitStream!3910 BitStream!3910) tuple2!8592)

(assert (=> b!104109 (= lt!152518 (reader!0 (_2!4552 lt!152514) (_2!4552 lt!152536)))))

(assert (=> b!104109 (= lt!152534 (reader!0 thiss!1305 (_2!4552 lt!152536)))))

(assert (=> b!104109 e!68192))

(declare-fun res!85703 () Bool)

(assert (=> b!104109 (=> (not res!85703) (not e!68192))))

(assert (=> b!104109 (= res!85703 (= (bitIndex!0 (size!2218 (buf!2584 (_1!4553 lt!152520))) (currentByte!5069 (_1!4553 lt!152520)) (currentBit!5064 (_1!4553 lt!152520))) (bitIndex!0 (size!2218 (buf!2584 (_1!4553 lt!152528))) (currentByte!5069 (_1!4553 lt!152528)) (currentBit!5064 (_1!4553 lt!152528)))))))

(declare-fun lt!152524 () Unit!6380)

(declare-fun lt!152516 () BitStream!3910)

(declare-fun readBitPrefixLemma!0 (BitStream!3910 BitStream!3910) Unit!6380)

(assert (=> b!104109 (= lt!152524 (readBitPrefixLemma!0 lt!152516 (_2!4552 lt!152536)))))

(assert (=> b!104109 (= lt!152528 (readBitPure!0 (BitStream!3911 (buf!2584 (_2!4552 lt!152536)) (currentByte!5069 thiss!1305) (currentBit!5064 thiss!1305))))))

(assert (=> b!104109 (= lt!152520 (readBitPure!0 lt!152516))))

(assert (=> b!104109 (= lt!152516 (BitStream!3911 (buf!2584 (_2!4552 lt!152514)) (currentByte!5069 thiss!1305) (currentBit!5064 thiss!1305)))))

(assert (=> b!104109 e!68195))

(declare-fun res!85712 () Bool)

(assert (=> b!104109 (=> (not res!85712) (not e!68195))))

(assert (=> b!104109 (= res!85712 (isPrefixOf!0 thiss!1305 (_2!4552 lt!152536)))))

(declare-fun lt!152535 () Unit!6380)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3910 BitStream!3910 BitStream!3910) Unit!6380)

(assert (=> b!104109 (= lt!152535 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4552 lt!152514) (_2!4552 lt!152536)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3910 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8594)

(assert (=> b!104109 (= lt!152536 (appendNLeastSignificantBitsLoop!0 (_2!4552 lt!152514) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!104109 e!68190))

(declare-fun res!85706 () Bool)

(assert (=> b!104109 (=> (not res!85706) (not e!68190))))

(assert (=> b!104109 (= res!85706 (= (size!2218 (buf!2584 thiss!1305)) (size!2218 (buf!2584 (_2!4552 lt!152514)))))))

(declare-fun appendBit!0 (BitStream!3910 Bool) tuple2!8594)

(assert (=> b!104109 (= lt!152514 (appendBit!0 thiss!1305 lt!152532))))

(assert (=> b!104109 (= lt!152532 (not (= (bvand v!199 lt!152529) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104109 (= lt!152529 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!20602 res!85711) b!104113))

(assert (= (and b!104113 res!85704) b!104107))

(assert (= (and b!104107 res!85705) b!104116))

(assert (= (and b!104116 res!85701) b!104109))

(assert (= (and b!104109 res!85706) b!104112))

(assert (= (and b!104112 res!85707) b!104106))

(assert (= (and b!104106 res!85708) b!104117))

(assert (= (and b!104117 res!85702) b!104114))

(assert (= (and b!104109 res!85712) b!104110))

(assert (= (and b!104110 res!85709) b!104111))

(assert (= (and b!104109 res!85703) b!104108))

(assert (= (and b!104109 (not res!85710)) b!104105))

(assert (= start!20602 b!104115))

(declare-fun m!152113 () Bool)

(assert (=> b!104111 m!152113))

(declare-fun m!152115 () Bool)

(assert (=> b!104112 m!152115))

(declare-fun m!152117 () Bool)

(assert (=> b!104112 m!152117))

(declare-fun m!152119 () Bool)

(assert (=> b!104106 m!152119))

(declare-fun m!152121 () Bool)

(assert (=> start!20602 m!152121))

(declare-fun m!152123 () Bool)

(assert (=> b!104117 m!152123))

(assert (=> b!104117 m!152123))

(declare-fun m!152125 () Bool)

(assert (=> b!104117 m!152125))

(declare-fun m!152127 () Bool)

(assert (=> b!104115 m!152127))

(declare-fun m!152129 () Bool)

(assert (=> b!104114 m!152129))

(declare-fun m!152131 () Bool)

(assert (=> b!104105 m!152131))

(declare-fun m!152133 () Bool)

(assert (=> b!104105 m!152133))

(declare-fun m!152135 () Bool)

(assert (=> b!104105 m!152135))

(assert (=> b!104105 m!152135))

(declare-fun m!152137 () Bool)

(assert (=> b!104105 m!152137))

(declare-fun m!152139 () Bool)

(assert (=> b!104109 m!152139))

(declare-fun m!152141 () Bool)

(assert (=> b!104109 m!152141))

(declare-fun m!152143 () Bool)

(assert (=> b!104109 m!152143))

(declare-fun m!152145 () Bool)

(assert (=> b!104109 m!152145))

(declare-fun m!152147 () Bool)

(assert (=> b!104109 m!152147))

(declare-fun m!152149 () Bool)

(assert (=> b!104109 m!152149))

(declare-fun m!152151 () Bool)

(assert (=> b!104109 m!152151))

(declare-fun m!152153 () Bool)

(assert (=> b!104109 m!152153))

(declare-fun m!152155 () Bool)

(assert (=> b!104109 m!152155))

(declare-fun m!152157 () Bool)

(assert (=> b!104109 m!152157))

(declare-fun m!152159 () Bool)

(assert (=> b!104109 m!152159))

(declare-fun m!152161 () Bool)

(assert (=> b!104109 m!152161))

(declare-fun m!152163 () Bool)

(assert (=> b!104109 m!152163))

(declare-fun m!152165 () Bool)

(assert (=> b!104109 m!152165))

(declare-fun m!152167 () Bool)

(assert (=> b!104109 m!152167))

(declare-fun m!152169 () Bool)

(assert (=> b!104109 m!152169))

(declare-fun m!152171 () Bool)

(assert (=> b!104109 m!152171))

(declare-fun m!152173 () Bool)

(assert (=> b!104109 m!152173))

(declare-fun m!152175 () Bool)

(assert (=> b!104109 m!152175))

(declare-fun m!152177 () Bool)

(assert (=> b!104107 m!152177))

(declare-fun m!152179 () Bool)

(assert (=> b!104110 m!152179))

(declare-fun m!152181 () Bool)

(assert (=> b!104113 m!152181))

(push 1)

(assert (not b!104111))

(assert (not b!104113))

(assert (not b!104110))

(assert (not b!104105))

(assert (not b!104117))

(assert (not b!104109))

(assert (not b!104115))

(assert (not start!20602))

(assert (not b!104106))

(assert (not b!104107))

(assert (not b!104112))

(assert (not b!104114))

(check-sat)

(pop 1)

