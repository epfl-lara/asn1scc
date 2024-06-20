; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17844 () Bool)

(assert start!17844)

(declare-fun b!87060 () Bool)

(declare-fun res!71575 () Bool)

(declare-fun e!57763 () Bool)

(assert (=> b!87060 (=> res!71575 e!57763)))

(declare-datatypes ((Unit!5733 0))(
  ( (Unit!5734) )
))
(declare-datatypes ((array!4112 0))(
  ( (array!4113 (arr!2494 (Array (_ BitVec 32) (_ BitVec 8))) (size!1857 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3276 0))(
  ( (BitStream!3277 (buf!2247 array!4112) (currentByte!4462 (_ BitVec 32)) (currentBit!4457 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!414 0))(
  ( (tuple3!415 (_1!3913 Unit!5733) (_2!3913 BitStream!3276) (_3!231 (_ BitVec 32))) )
))
(declare-fun lt!135495 () tuple3!414)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87060 (= res!71575 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4457 (_2!3913 lt!135495)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4462 (_2!3913 lt!135495)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1857 (buf!2247 (_2!3913 lt!135495))))))))))

(declare-fun b!87061 () Bool)

(declare-fun res!71586 () Bool)

(declare-fun e!57769 () Bool)

(assert (=> b!87061 (=> (not res!71586) (not e!57769))))

(declare-fun thiss!1152 () BitStream!3276)

(declare-fun thiss!1151 () BitStream!3276)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87061 (= res!71586 (and (bvsle i!576 nBits!336) (= (size!1857 (buf!2247 thiss!1152)) (size!1857 (buf!2247 thiss!1151)))))))

(declare-fun b!87062 () Bool)

(declare-fun res!71593 () Bool)

(declare-fun e!57768 () Bool)

(assert (=> b!87062 (=> (not res!71593) (not e!57768))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87062 (= res!71593 (validate_offset_bits!1 ((_ sign_extend 32) (size!1857 (buf!2247 thiss!1152))) ((_ sign_extend 32) (currentByte!4462 thiss!1152)) ((_ sign_extend 32) (currentBit!4457 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87063 () Bool)

(declare-fun e!57770 () Bool)

(declare-fun array_inv!1703 (array!4112) Bool)

(assert (=> b!87063 (= e!57770 (array_inv!1703 (buf!2247 thiss!1152)))))

(declare-fun b!87064 () Bool)

(assert (=> b!87064 (= e!57763 (bvsge ((_ sign_extend 32) (bvsub nBits!336 (_3!231 lt!135495))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87065 () Bool)

(declare-fun res!71576 () Bool)

(assert (=> b!87065 (=> res!71576 e!57763)))

(assert (=> b!87065 (= res!71576 (not (invariant!0 (currentBit!4457 (_2!3913 lt!135495)) (currentByte!4462 (_2!3913 lt!135495)) (size!1857 (buf!2247 (_2!3913 lt!135495))))))))

(declare-fun b!87066 () Bool)

(declare-fun res!71592 () Bool)

(assert (=> b!87066 (=> (not res!71592) (not e!57769))))

(assert (=> b!87066 (= res!71592 (invariant!0 (currentBit!4457 thiss!1151) (currentByte!4462 thiss!1151) (size!1857 (buf!2247 thiss!1151))))))

(declare-fun b!87067 () Bool)

(declare-fun e!57762 () Bool)

(assert (=> b!87067 (= e!57762 (array_inv!1703 (buf!2247 thiss!1151)))))

(declare-fun b!87068 () Bool)

(assert (=> b!87068 (= e!57769 e!57768)))

(declare-fun res!71589 () Bool)

(assert (=> b!87068 (=> (not res!71589) (not e!57768))))

(declare-fun lt!135494 () (_ BitVec 64))

(declare-fun lt!135496 () (_ BitVec 64))

(assert (=> b!87068 (= res!71589 (= lt!135496 (bvadd lt!135494 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87068 (= lt!135496 (bitIndex!0 (size!1857 (buf!2247 thiss!1152)) (currentByte!4462 thiss!1152) (currentBit!4457 thiss!1152)))))

(assert (=> b!87068 (= lt!135494 (bitIndex!0 (size!1857 (buf!2247 thiss!1151)) (currentByte!4462 thiss!1151) (currentBit!4457 thiss!1151)))))

(declare-fun b!87069 () Bool)

(declare-fun res!71581 () Bool)

(assert (=> b!87069 (=> res!71581 e!57763)))

(assert (=> b!87069 (= res!71581 (or (bvsgt ((_ sign_extend 32) (size!1857 (buf!2247 (_2!3913 lt!135495)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4462 (_2!3913 lt!135495))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4457 (_2!3913 lt!135495))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1857 (buf!2247 (_2!3913 lt!135495)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4462 (_2!3913 lt!135495))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4457 (_2!3913 lt!135495))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87070 () Bool)

(declare-fun res!71585 () Bool)

(declare-fun e!57766 () Bool)

(assert (=> b!87070 (=> (not res!71585) (not e!57766))))

(declare-datatypes ((tuple2!7364 0))(
  ( (tuple2!7365 (_1!3914 Unit!5733) (_2!3914 BitStream!3276)) )
))
(declare-fun lt!135497 () tuple2!7364)

(declare-fun isPrefixOf!0 (BitStream!3276 BitStream!3276) Bool)

(assert (=> b!87070 (= res!71585 (isPrefixOf!0 thiss!1152 (_2!3914 lt!135497)))))

(declare-fun b!87071 () Bool)

(declare-fun e!57771 () Bool)

(assert (=> b!87071 (= e!57771 e!57766)))

(declare-fun res!71573 () Bool)

(assert (=> b!87071 (=> (not res!71573) (not e!57766))))

(declare-fun lt!135498 () (_ BitVec 64))

(assert (=> b!87071 (= res!71573 (= lt!135498 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135496)))))

(assert (=> b!87071 (= lt!135498 (bitIndex!0 (size!1857 (buf!2247 (_2!3914 lt!135497))) (currentByte!4462 (_2!3914 lt!135497)) (currentBit!4457 (_2!3914 lt!135497))))))

(declare-fun res!71578 () Bool)

(assert (=> start!17844 (=> (not res!71578) (not e!57769))))

(assert (=> start!17844 (= res!71578 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17844 e!57769))

(declare-fun inv!12 (BitStream!3276) Bool)

(assert (=> start!17844 (and (inv!12 thiss!1152) e!57770)))

(assert (=> start!17844 (and (inv!12 thiss!1151) e!57762)))

(assert (=> start!17844 true))

(declare-fun b!87072 () Bool)

(declare-fun e!57767 () Bool)

(declare-datatypes ((tuple2!7366 0))(
  ( (tuple2!7367 (_1!3915 BitStream!3276) (_2!3915 Bool)) )
))
(declare-fun lt!135492 () tuple2!7366)

(assert (=> b!87072 (= e!57767 (= (bitIndex!0 (size!1857 (buf!2247 (_1!3915 lt!135492))) (currentByte!4462 (_1!3915 lt!135492)) (currentBit!4457 (_1!3915 lt!135492))) lt!135498))))

(declare-fun b!87073 () Bool)

(declare-fun e!57764 () Bool)

(assert (=> b!87073 (= e!57768 (not e!57764))))

(declare-fun res!71580 () Bool)

(assert (=> b!87073 (=> res!71580 e!57764)))

(assert (=> b!87073 (= res!71580 (not (invariant!0 (currentBit!4457 (_2!3914 lt!135497)) (currentByte!4462 (_2!3914 lt!135497)) (size!1857 (buf!2247 (_2!3914 lt!135497))))))))

(assert (=> b!87073 e!57771))

(declare-fun res!71579 () Bool)

(assert (=> b!87073 (=> (not res!71579) (not e!57771))))

(assert (=> b!87073 (= res!71579 (= (size!1857 (buf!2247 thiss!1152)) (size!1857 (buf!2247 (_2!3914 lt!135497)))))))

(declare-fun lt!135493 () Bool)

(declare-fun appendBit!0 (BitStream!3276 Bool) tuple2!7364)

(assert (=> b!87073 (= lt!135497 (appendBit!0 thiss!1152 lt!135493))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87073 (= lt!135493 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87074 () Bool)

(declare-fun res!71588 () Bool)

(assert (=> b!87074 (=> (not res!71588) (not e!57769))))

(assert (=> b!87074 (= res!71588 (validate_offset_bits!1 ((_ sign_extend 32) (size!1857 (buf!2247 thiss!1151))) ((_ sign_extend 32) (currentByte!4462 thiss!1151)) ((_ sign_extend 32) (currentBit!4457 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87075 () Bool)

(declare-fun res!71582 () Bool)

(assert (=> b!87075 (=> (not res!71582) (not e!57769))))

(assert (=> b!87075 (= res!71582 (invariant!0 (currentBit!4457 thiss!1152) (currentByte!4462 thiss!1152) (size!1857 (buf!2247 thiss!1152))))))

(declare-fun b!87076 () Bool)

(assert (=> b!87076 (= e!57764 e!57763)))

(declare-fun res!71574 () Bool)

(assert (=> b!87076 (=> res!71574 e!57763)))

(assert (=> b!87076 (= res!71574 (bvslt (_3!231 lt!135495) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3276 (_ BitVec 64) BitStream!3276 (_ BitVec 32)) tuple3!414)

(assert (=> b!87076 (= lt!135495 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3914 lt!135497) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!87077 () Bool)

(declare-fun res!71587 () Bool)

(assert (=> b!87077 (=> res!71587 e!57764)))

(assert (=> b!87077 (= res!71587 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!87078 () Bool)

(declare-fun res!71583 () Bool)

(assert (=> b!87078 (=> (not res!71583) (not e!57769))))

(assert (=> b!87078 (= res!71583 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87079 () Bool)

(declare-fun res!71584 () Bool)

(assert (=> b!87079 (=> res!71584 e!57763)))

(assert (=> b!87079 (= res!71584 (or (bvsgt (_3!231 lt!135495) nBits!336) (not (= (size!1857 (buf!2247 (_2!3913 lt!135495))) (size!1857 (buf!2247 thiss!1151))))))))

(declare-fun b!87080 () Bool)

(declare-fun res!71577 () Bool)

(assert (=> b!87080 (=> res!71577 e!57763)))

(assert (=> b!87080 (= res!71577 (not (= (bitIndex!0 (size!1857 (buf!2247 (_2!3913 lt!135495))) (currentByte!4462 (_2!3913 lt!135495)) (currentBit!4457 (_2!3913 lt!135495))) (bvadd lt!135494 ((_ sign_extend 32) (_3!231 lt!135495))))))))

(declare-fun b!87081 () Bool)

(declare-fun res!71590 () Bool)

(assert (=> b!87081 (=> (not res!71590) (not e!57768))))

(assert (=> b!87081 (= res!71590 (bvslt i!576 nBits!336))))

(declare-fun b!87082 () Bool)

(assert (=> b!87082 (= e!57766 e!57767)))

(declare-fun res!71591 () Bool)

(assert (=> b!87082 (=> (not res!71591) (not e!57767))))

(assert (=> b!87082 (= res!71591 (and (= (_2!3915 lt!135492) lt!135493) (= (_1!3915 lt!135492) (_2!3914 lt!135497))))))

(declare-fun readBitPure!0 (BitStream!3276) tuple2!7366)

(declare-fun readerFrom!0 (BitStream!3276 (_ BitVec 32) (_ BitVec 32)) BitStream!3276)

(assert (=> b!87082 (= lt!135492 (readBitPure!0 (readerFrom!0 (_2!3914 lt!135497) (currentBit!4457 thiss!1152) (currentByte!4462 thiss!1152))))))

(assert (= (and start!17844 res!71578) b!87074))

(assert (= (and b!87074 res!71588) b!87066))

(assert (= (and b!87066 res!71592) b!87078))

(assert (= (and b!87078 res!71583) b!87075))

(assert (= (and b!87075 res!71582) b!87061))

(assert (= (and b!87061 res!71586) b!87068))

(assert (= (and b!87068 res!71589) b!87062))

(assert (= (and b!87062 res!71593) b!87081))

(assert (= (and b!87081 res!71590) b!87073))

(assert (= (and b!87073 res!71579) b!87071))

(assert (= (and b!87071 res!71573) b!87070))

(assert (= (and b!87070 res!71585) b!87082))

(assert (= (and b!87082 res!71591) b!87072))

(assert (= (and b!87073 (not res!71580)) b!87077))

(assert (= (and b!87077 (not res!71587)) b!87076))

(assert (= (and b!87076 (not res!71574)) b!87065))

(assert (= (and b!87065 (not res!71576)) b!87079))

(assert (= (and b!87079 (not res!71584)) b!87080))

(assert (= (and b!87080 (not res!71577)) b!87069))

(assert (= (and b!87069 (not res!71581)) b!87060))

(assert (= (and b!87060 (not res!71575)) b!87064))

(assert (= start!17844 b!87063))

(assert (= start!17844 b!87067))

(declare-fun m!132659 () Bool)

(assert (=> b!87071 m!132659))

(declare-fun m!132661 () Bool)

(assert (=> b!87065 m!132661))

(declare-fun m!132663 () Bool)

(assert (=> start!17844 m!132663))

(declare-fun m!132665 () Bool)

(assert (=> start!17844 m!132665))

(declare-fun m!132667 () Bool)

(assert (=> b!87075 m!132667))

(declare-fun m!132669 () Bool)

(assert (=> b!87062 m!132669))

(declare-fun m!132671 () Bool)

(assert (=> b!87076 m!132671))

(declare-fun m!132673 () Bool)

(assert (=> b!87066 m!132673))

(declare-fun m!132675 () Bool)

(assert (=> b!87067 m!132675))

(declare-fun m!132677 () Bool)

(assert (=> b!87072 m!132677))

(declare-fun m!132679 () Bool)

(assert (=> b!87073 m!132679))

(declare-fun m!132681 () Bool)

(assert (=> b!87073 m!132681))

(declare-fun m!132683 () Bool)

(assert (=> b!87082 m!132683))

(assert (=> b!87082 m!132683))

(declare-fun m!132685 () Bool)

(assert (=> b!87082 m!132685))

(declare-fun m!132687 () Bool)

(assert (=> b!87070 m!132687))

(declare-fun m!132689 () Bool)

(assert (=> b!87080 m!132689))

(declare-fun m!132691 () Bool)

(assert (=> b!87063 m!132691))

(declare-fun m!132693 () Bool)

(assert (=> b!87068 m!132693))

(declare-fun m!132695 () Bool)

(assert (=> b!87068 m!132695))

(declare-fun m!132697 () Bool)

(assert (=> b!87074 m!132697))

(declare-fun m!132699 () Bool)

(assert (=> b!87060 m!132699))

(check-sat (not b!87067) (not b!87074) (not b!87072) (not b!87071) (not b!87066) (not b!87060) (not b!87073) (not start!17844) (not b!87068) (not b!87070) (not b!87075) (not b!87063) (not b!87076) (not b!87080) (not b!87062) (not b!87065) (not b!87082))
(check-sat)
