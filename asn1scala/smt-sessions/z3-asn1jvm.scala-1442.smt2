; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39604 () Bool)

(assert start!39604)

(declare-fun b!178570 () Bool)

(declare-fun res!148109 () Bool)

(declare-fun e!124322 () Bool)

(assert (=> b!178570 (=> (not res!148109) (not e!124322))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!178570 (= res!148109 (not (= i!590 nBits!348)))))

(declare-fun b!178571 () Bool)

(declare-fun e!124327 () Bool)

(assert (=> b!178571 (= e!124322 (not e!124327))))

(declare-fun res!148108 () Bool)

(assert (=> b!178571 (=> res!148108 e!124327)))

(declare-fun lt!274224 () (_ BitVec 64))

(declare-fun lt!274222 () (_ BitVec 64))

(assert (=> b!178571 (= res!148108 (not (= lt!274224 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274222))))))

(declare-datatypes ((array!9619 0))(
  ( (array!9620 (arr!5171 (Array (_ BitVec 32) (_ BitVec 8))) (size!4241 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7590 0))(
  ( (BitStream!7591 (buf!4684 array!9619) (currentByte!8882 (_ BitVec 32)) (currentBit!8877 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12862 0))(
  ( (Unit!12863) )
))
(declare-datatypes ((tuple2!15396 0))(
  ( (tuple2!15397 (_1!8343 Unit!12862) (_2!8343 BitStream!7590)) )
))
(declare-fun lt!274216 () tuple2!15396)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178571 (= lt!274224 (bitIndex!0 (size!4241 (buf!4684 (_2!8343 lt!274216))) (currentByte!8882 (_2!8343 lt!274216)) (currentBit!8877 (_2!8343 lt!274216))))))

(declare-fun thiss!1204 () BitStream!7590)

(assert (=> b!178571 (= lt!274222 (bitIndex!0 (size!4241 (buf!4684 thiss!1204)) (currentByte!8882 thiss!1204) (currentBit!8877 thiss!1204)))))

(declare-fun e!124324 () Bool)

(assert (=> b!178571 e!124324))

(declare-fun res!148114 () Bool)

(assert (=> b!178571 (=> (not res!148114) (not e!124324))))

(assert (=> b!178571 (= res!148114 (= (size!4241 (buf!4684 thiss!1204)) (size!4241 (buf!4684 (_2!8343 lt!274216)))))))

(declare-fun lt!274223 () Bool)

(declare-fun appendBit!0 (BitStream!7590 Bool) tuple2!15396)

(assert (=> b!178571 (= lt!274216 (appendBit!0 thiss!1204 lt!274223))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178571 (= lt!274223 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178572 () Bool)

(declare-fun e!124321 () Bool)

(declare-fun e!124326 () Bool)

(assert (=> b!178572 (= e!124321 e!124326)))

(declare-fun res!148117 () Bool)

(assert (=> b!178572 (=> (not res!148117) (not e!124326))))

(declare-datatypes ((tuple2!15398 0))(
  ( (tuple2!15399 (_1!8344 BitStream!7590) (_2!8344 Bool)) )
))
(declare-fun lt!274219 () tuple2!15398)

(assert (=> b!178572 (= res!148117 (and (= (_2!8344 lt!274219) lt!274223) (= (_1!8344 lt!274219) (_2!8343 lt!274216))))))

(declare-fun readBitPure!0 (BitStream!7590) tuple2!15398)

(declare-fun readerFrom!0 (BitStream!7590 (_ BitVec 32) (_ BitVec 32)) BitStream!7590)

(assert (=> b!178572 (= lt!274219 (readBitPure!0 (readerFrom!0 (_2!8343 lt!274216) (currentBit!8877 thiss!1204) (currentByte!8882 thiss!1204))))))

(declare-fun b!178573 () Bool)

(declare-fun lt!274218 () (_ BitVec 64))

(assert (=> b!178573 (= e!124326 (= (bitIndex!0 (size!4241 (buf!4684 (_1!8344 lt!274219))) (currentByte!8882 (_1!8344 lt!274219)) (currentBit!8877 (_1!8344 lt!274219))) lt!274218))))

(declare-fun b!178574 () Bool)

(declare-fun res!148119 () Bool)

(declare-fun e!124319 () Bool)

(assert (=> b!178574 (=> res!148119 e!124319)))

(declare-fun lt!274215 () (_ BitVec 64))

(declare-fun lt!274221 () tuple2!15396)

(assert (=> b!178574 (= res!148119 (or (not (= (size!4241 (buf!4684 (_2!8343 lt!274221))) (size!4241 (buf!4684 thiss!1204)))) (not (= lt!274215 (bvsub (bvadd lt!274222 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178575 () Bool)

(declare-fun res!148106 () Bool)

(assert (=> b!178575 (=> (not res!148106) (not e!124322))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178575 (= res!148106 (invariant!0 (currentBit!8877 thiss!1204) (currentByte!8882 thiss!1204) (size!4241 (buf!4684 thiss!1204))))))

(declare-fun b!178576 () Bool)

(declare-fun res!148110 () Bool)

(assert (=> b!178576 (=> res!148110 e!124319)))

(declare-fun isPrefixOf!0 (BitStream!7590 BitStream!7590) Bool)

(assert (=> b!178576 (= res!148110 (not (isPrefixOf!0 thiss!1204 (_2!8343 lt!274216))))))

(declare-fun b!178577 () Bool)

(declare-fun res!148107 () Bool)

(declare-fun e!124323 () Bool)

(assert (=> b!178577 (=> res!148107 e!124323)))

(declare-fun arrayBitRangesEq!0 (array!9619 array!9619 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178577 (= res!148107 (not (arrayBitRangesEq!0 (buf!4684 (_2!8343 lt!274216)) (buf!4684 (_2!8343 lt!274221)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4241 (buf!4684 (_2!8343 lt!274216))) (currentByte!8882 thiss!1204) (currentBit!8877 thiss!1204))))))))

(declare-fun b!178578 () Bool)

(assert (=> b!178578 (= e!124319 e!124323)))

(declare-fun res!148113 () Bool)

(assert (=> b!178578 (=> res!148113 e!124323)))

(assert (=> b!178578 (= res!148113 (not (= (size!4241 (buf!4684 (_2!8343 lt!274216))) (size!4241 (buf!4684 (_2!8343 lt!274221))))))))

(assert (=> b!178578 (invariant!0 (currentBit!8877 thiss!1204) (currentByte!8882 thiss!1204) (size!4241 (buf!4684 (_2!8343 lt!274216))))))

(declare-fun b!178579 () Bool)

(declare-fun res!148118 () Bool)

(assert (=> b!178579 (=> res!148118 e!124323)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178579 (= res!148118 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4241 (buf!4684 (_2!8343 lt!274216)))) ((_ sign_extend 32) (currentByte!8882 thiss!1204)) ((_ sign_extend 32) (currentBit!8877 thiss!1204)))))))

(declare-fun b!178580 () Bool)

(assert (=> b!178580 (= e!124323 true)))

(declare-fun lt!274225 () tuple2!15398)

(assert (=> b!178580 (= lt!274225 (readBitPure!0 (BitStream!7591 (buf!4684 (_2!8343 lt!274221)) (currentByte!8882 thiss!1204) (currentBit!8877 thiss!1204))))))

(declare-fun lt!274226 () tuple2!15398)

(assert (=> b!178580 (= lt!274226 (readBitPure!0 (BitStream!7591 (buf!4684 (_2!8343 lt!274216)) (currentByte!8882 thiss!1204) (currentBit!8877 thiss!1204))))))

(assert (=> b!178580 (invariant!0 (currentBit!8877 thiss!1204) (currentByte!8882 thiss!1204) (size!4241 (buf!4684 (_2!8343 lt!274221))))))

(declare-fun b!178581 () Bool)

(declare-fun res!148111 () Bool)

(assert (=> b!178581 (=> res!148111 e!124319)))

(assert (=> b!178581 (= res!148111 (not (isPrefixOf!0 (_2!8343 lt!274216) (_2!8343 lt!274221))))))

(declare-fun b!178582 () Bool)

(assert (=> b!178582 (= e!124324 e!124321)))

(declare-fun res!148103 () Bool)

(assert (=> b!178582 (=> (not res!148103) (not e!124321))))

(declare-fun lt!274217 () (_ BitVec 64))

(assert (=> b!178582 (= res!148103 (= lt!274218 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274217)))))

(assert (=> b!178582 (= lt!274218 (bitIndex!0 (size!4241 (buf!4684 (_2!8343 lt!274216))) (currentByte!8882 (_2!8343 lt!274216)) (currentBit!8877 (_2!8343 lt!274216))))))

(assert (=> b!178582 (= lt!274217 (bitIndex!0 (size!4241 (buf!4684 thiss!1204)) (currentByte!8882 thiss!1204) (currentBit!8877 thiss!1204)))))

(declare-fun b!178583 () Bool)

(declare-fun e!124325 () Bool)

(declare-fun array_inv!3982 (array!9619) Bool)

(assert (=> b!178583 (= e!124325 (array_inv!3982 (buf!4684 thiss!1204)))))

(declare-fun res!148112 () Bool)

(assert (=> start!39604 (=> (not res!148112) (not e!124322))))

(assert (=> start!39604 (= res!148112 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39604 e!124322))

(assert (=> start!39604 true))

(declare-fun inv!12 (BitStream!7590) Bool)

(assert (=> start!39604 (and (inv!12 thiss!1204) e!124325)))

(declare-fun b!178584 () Bool)

(declare-fun res!148115 () Bool)

(assert (=> b!178584 (=> res!148115 e!124319)))

(assert (=> b!178584 (= res!148115 (not (invariant!0 (currentBit!8877 (_2!8343 lt!274221)) (currentByte!8882 (_2!8343 lt!274221)) (size!4241 (buf!4684 (_2!8343 lt!274221))))))))

(declare-fun b!178585 () Bool)

(declare-fun res!148105 () Bool)

(assert (=> b!178585 (=> (not res!148105) (not e!124322))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178585 (= res!148105 (validate_offset_bits!1 ((_ sign_extend 32) (size!4241 (buf!4684 thiss!1204))) ((_ sign_extend 32) (currentByte!8882 thiss!1204)) ((_ sign_extend 32) (currentBit!8877 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178586 () Bool)

(assert (=> b!178586 (= e!124327 e!124319)))

(declare-fun res!148116 () Bool)

(assert (=> b!178586 (=> res!148116 e!124319)))

(assert (=> b!178586 (= res!148116 (not (= lt!274215 (bvsub (bvsub (bvadd lt!274224 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!178586 (= lt!274215 (bitIndex!0 (size!4241 (buf!4684 (_2!8343 lt!274221))) (currentByte!8882 (_2!8343 lt!274221)) (currentBit!8877 (_2!8343 lt!274221))))))

(assert (=> b!178586 (isPrefixOf!0 thiss!1204 (_2!8343 lt!274221))))

(declare-fun lt!274220 () Unit!12862)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7590 BitStream!7590 BitStream!7590) Unit!12862)

(assert (=> b!178586 (= lt!274220 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8343 lt!274216) (_2!8343 lt!274221)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15396)

(assert (=> b!178586 (= lt!274221 (appendBitsLSBFirstLoopTR!0 (_2!8343 lt!274216) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178587 () Bool)

(declare-fun res!148104 () Bool)

(assert (=> b!178587 (=> (not res!148104) (not e!124321))))

(assert (=> b!178587 (= res!148104 (isPrefixOf!0 thiss!1204 (_2!8343 lt!274216)))))

(assert (= (and start!39604 res!148112) b!178585))

(assert (= (and b!178585 res!148105) b!178575))

(assert (= (and b!178575 res!148106) b!178570))

(assert (= (and b!178570 res!148109) b!178571))

(assert (= (and b!178571 res!148114) b!178582))

(assert (= (and b!178582 res!148103) b!178587))

(assert (= (and b!178587 res!148104) b!178572))

(assert (= (and b!178572 res!148117) b!178573))

(assert (= (and b!178571 (not res!148108)) b!178586))

(assert (= (and b!178586 (not res!148116)) b!178584))

(assert (= (and b!178584 (not res!148115)) b!178574))

(assert (= (and b!178574 (not res!148119)) b!178581))

(assert (= (and b!178581 (not res!148111)) b!178576))

(assert (= (and b!178576 (not res!148110)) b!178578))

(assert (= (and b!178578 (not res!148113)) b!178579))

(assert (= (and b!178579 (not res!148118)) b!178577))

(assert (= (and b!178577 (not res!148107)) b!178580))

(assert (= start!39604 b!178583))

(declare-fun m!278683 () Bool)

(assert (=> b!178582 m!278683))

(declare-fun m!278685 () Bool)

(assert (=> b!178582 m!278685))

(declare-fun m!278687 () Bool)

(assert (=> b!178583 m!278687))

(declare-fun m!278689 () Bool)

(assert (=> b!178580 m!278689))

(declare-fun m!278691 () Bool)

(assert (=> b!178580 m!278691))

(declare-fun m!278693 () Bool)

(assert (=> b!178580 m!278693))

(declare-fun m!278695 () Bool)

(assert (=> b!178584 m!278695))

(declare-fun m!278697 () Bool)

(assert (=> b!178579 m!278697))

(declare-fun m!278699 () Bool)

(assert (=> b!178587 m!278699))

(declare-fun m!278701 () Bool)

(assert (=> start!39604 m!278701))

(declare-fun m!278703 () Bool)

(assert (=> b!178577 m!278703))

(declare-fun m!278705 () Bool)

(assert (=> b!178577 m!278705))

(declare-fun m!278707 () Bool)

(assert (=> b!178572 m!278707))

(assert (=> b!178572 m!278707))

(declare-fun m!278709 () Bool)

(assert (=> b!178572 m!278709))

(declare-fun m!278711 () Bool)

(assert (=> b!178575 m!278711))

(declare-fun m!278713 () Bool)

(assert (=> b!178573 m!278713))

(declare-fun m!278715 () Bool)

(assert (=> b!178581 m!278715))

(declare-fun m!278717 () Bool)

(assert (=> b!178578 m!278717))

(assert (=> b!178576 m!278699))

(declare-fun m!278719 () Bool)

(assert (=> b!178585 m!278719))

(assert (=> b!178571 m!278683))

(assert (=> b!178571 m!278685))

(declare-fun m!278721 () Bool)

(assert (=> b!178571 m!278721))

(declare-fun m!278723 () Bool)

(assert (=> b!178586 m!278723))

(declare-fun m!278725 () Bool)

(assert (=> b!178586 m!278725))

(declare-fun m!278727 () Bool)

(assert (=> b!178586 m!278727))

(declare-fun m!278729 () Bool)

(assert (=> b!178586 m!278729))

(check-sat (not b!178583) (not b!178582) (not b!178584) (not b!178577) (not b!178575) (not b!178571) (not b!178586) (not b!178578) (not b!178572) (not b!178587) (not b!178580) (not b!178576) (not b!178579) (not start!39604) (not b!178573) (not b!178585) (not b!178581))
(check-sat)
