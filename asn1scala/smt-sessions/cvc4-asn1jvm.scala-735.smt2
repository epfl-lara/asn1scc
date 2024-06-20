; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20582 () Bool)

(assert start!20582)

(declare-fun b!103687 () Bool)

(declare-fun e!67859 () Bool)

(declare-fun e!67861 () Bool)

(assert (=> b!103687 (= e!67859 e!67861)))

(declare-fun res!85314 () Bool)

(assert (=> b!103687 (=> (not res!85314) (not e!67861))))

(declare-datatypes ((array!4840 0))(
  ( (array!4841 (arr!2801 (Array (_ BitVec 32) (_ BitVec 8))) (size!2208 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3890 0))(
  ( (BitStream!3891 (buf!2574 array!4840) (currentByte!5059 (_ BitVec 32)) (currentBit!5054 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6360 0))(
  ( (Unit!6361) )
))
(declare-datatypes ((tuple2!8510 0))(
  ( (tuple2!8511 (_1!4510 Unit!6360) (_2!4510 BitStream!3890)) )
))
(declare-fun lt!151788 () tuple2!8510)

(declare-datatypes ((tuple2!8512 0))(
  ( (tuple2!8513 (_1!4511 BitStream!3890) (_2!4511 Bool)) )
))
(declare-fun lt!151787 () tuple2!8512)

(declare-fun lt!151778 () Bool)

(assert (=> b!103687 (= res!85314 (and (= (_2!4511 lt!151787) lt!151778) (= (_1!4511 lt!151787) (_2!4510 lt!151788))))))

(declare-fun thiss!1305 () BitStream!3890)

(declare-fun readBitPure!0 (BitStream!3890) tuple2!8512)

(declare-fun readerFrom!0 (BitStream!3890 (_ BitVec 32) (_ BitVec 32)) BitStream!3890)

(assert (=> b!103687 (= lt!151787 (readBitPure!0 (readerFrom!0 (_2!4510 lt!151788) (currentBit!5054 thiss!1305) (currentByte!5059 thiss!1305))))))

(declare-fun b!103688 () Bool)

(declare-fun e!67867 () Bool)

(declare-fun array_inv!2010 (array!4840) Bool)

(assert (=> b!103688 (= e!67867 (array_inv!2010 (buf!2574 thiss!1305)))))

(declare-fun b!103689 () Bool)

(declare-fun e!67863 () Bool)

(declare-fun lt!151769 () tuple2!8510)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103689 (= e!67863 (invariant!0 (currentBit!5054 thiss!1305) (currentByte!5059 thiss!1305) (size!2208 (buf!2574 (_2!4510 lt!151769)))))))

(declare-fun b!103690 () Bool)

(declare-fun e!67868 () Bool)

(assert (=> b!103690 (= e!67868 e!67859)))

(declare-fun res!85319 () Bool)

(assert (=> b!103690 (=> (not res!85319) (not e!67859))))

(declare-fun lt!151773 () (_ BitVec 64))

(declare-fun lt!151777 () (_ BitVec 64))

(assert (=> b!103690 (= res!85319 (= lt!151773 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151777)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103690 (= lt!151773 (bitIndex!0 (size!2208 (buf!2574 (_2!4510 lt!151788))) (currentByte!5059 (_2!4510 lt!151788)) (currentBit!5054 (_2!4510 lt!151788))))))

(assert (=> b!103690 (= lt!151777 (bitIndex!0 (size!2208 (buf!2574 thiss!1305)) (currentByte!5059 thiss!1305) (currentBit!5054 thiss!1305)))))

(declare-fun b!103691 () Bool)

(declare-fun e!67860 () Bool)

(declare-fun e!67866 () Bool)

(assert (=> b!103691 (= e!67860 e!67866)))

(declare-fun res!85313 () Bool)

(assert (=> b!103691 (=> (not res!85313) (not e!67866))))

(declare-fun lt!151779 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103691 (= res!85313 (validate_offset_bits!1 ((_ sign_extend 32) (size!2208 (buf!2574 thiss!1305))) ((_ sign_extend 32) (currentByte!5059 thiss!1305)) ((_ sign_extend 32) (currentBit!5054 thiss!1305)) lt!151779))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!103691 (= lt!151779 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103692 () Bool)

(declare-fun res!85315 () Bool)

(declare-fun e!67865 () Bool)

(assert (=> b!103692 (=> res!85315 e!67865)))

(declare-datatypes ((tuple2!8514 0))(
  ( (tuple2!8515 (_1!4512 BitStream!3890) (_2!4512 BitStream!3890)) )
))
(declare-fun lt!151774 () tuple2!8514)

(assert (=> b!103692 (= res!85315 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2208 (buf!2574 (_1!4512 lt!151774)))) ((_ sign_extend 32) (currentByte!5059 (_1!4512 lt!151774))) ((_ sign_extend 32) (currentBit!5054 (_1!4512 lt!151774))) lt!151779)))))

(declare-fun b!103693 () Bool)

(declare-fun res!85321 () Bool)

(assert (=> b!103693 (=> res!85321 e!67865)))

(declare-fun lt!151776 () (_ BitVec 64))

(declare-fun lt!151782 () (_ BitVec 64))

(declare-fun lt!151771 () (_ BitVec 64))

(assert (=> b!103693 (= res!85321 (or (not (= (bvand lt!151782 lt!151771) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!151782 lt!151776) lt!151782))))))

(declare-fun b!103694 () Bool)

(assert (=> b!103694 (= e!67865 true)))

(declare-datatypes ((tuple2!8516 0))(
  ( (tuple2!8517 (_1!4513 BitStream!3890) (_2!4513 (_ BitVec 64))) )
))
(declare-fun lt!151772 () tuple2!8516)

(declare-fun lt!151783 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8516)

(declare-fun withMovedBitIndex!0 (BitStream!3890 (_ BitVec 64)) BitStream!3890)

(assert (=> b!103694 (= lt!151772 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4512 lt!151774) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151783))))

(declare-fun b!103695 () Bool)

(assert (=> b!103695 (= e!67861 (= (bitIndex!0 (size!2208 (buf!2574 (_1!4511 lt!151787))) (currentByte!5059 (_1!4511 lt!151787)) (currentBit!5054 (_1!4511 lt!151787))) lt!151773))))

(declare-fun b!103696 () Bool)

(declare-fun e!67869 () Bool)

(declare-fun lt!151781 () tuple2!8512)

(declare-fun lt!151785 () tuple2!8512)

(assert (=> b!103696 (= e!67869 (= (_2!4511 lt!151781) (_2!4511 lt!151785)))))

(declare-fun b!103697 () Bool)

(declare-fun e!67864 () Bool)

(assert (=> b!103697 (= e!67866 e!67864)))

(declare-fun res!85323 () Bool)

(assert (=> b!103697 (=> (not res!85323) (not e!67864))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!103697 (= res!85323 (and (= (bvand v!199 lt!151776) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103697 (= lt!151776 (onesLSBLong!0 nBits!396))))

(declare-fun b!103698 () Bool)

(assert (=> b!103698 (= e!67864 (not e!67865))))

(declare-fun res!85316 () Bool)

(assert (=> b!103698 (=> res!85316 e!67865)))

(declare-fun lt!151786 () tuple2!8514)

(assert (=> b!103698 (= res!85316 (not (= (_1!4513 (readNLeastSignificantBitsLoopPure!0 (_1!4512 lt!151786) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151783)) (_2!4512 lt!151786))))))

(declare-fun lt!151766 () (_ BitVec 64))

(assert (=> b!103698 (validate_offset_bits!1 ((_ sign_extend 32) (size!2208 (buf!2574 (_2!4510 lt!151769)))) ((_ sign_extend 32) (currentByte!5059 (_2!4510 lt!151788))) ((_ sign_extend 32) (currentBit!5054 (_2!4510 lt!151788))) lt!151766)))

(declare-fun lt!151770 () Unit!6360)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3890 array!4840 (_ BitVec 64)) Unit!6360)

(assert (=> b!103698 (= lt!151770 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4510 lt!151788) (buf!2574 (_2!4510 lt!151769)) lt!151766))))

(assert (=> b!103698 (= lt!151766 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!151789 () (_ BitVec 64))

(declare-fun lt!151775 () tuple2!8512)

(assert (=> b!103698 (= lt!151783 (bvor lt!151782 (ite (_2!4511 lt!151775) lt!151789 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!151767 () tuple2!8516)

(assert (=> b!103698 (= lt!151767 (readNLeastSignificantBitsLoopPure!0 (_1!4512 lt!151774) nBits!396 i!615 lt!151782))))

(assert (=> b!103698 (validate_offset_bits!1 ((_ sign_extend 32) (size!2208 (buf!2574 (_2!4510 lt!151769)))) ((_ sign_extend 32) (currentByte!5059 thiss!1305)) ((_ sign_extend 32) (currentBit!5054 thiss!1305)) lt!151779)))

(declare-fun lt!151780 () Unit!6360)

(assert (=> b!103698 (= lt!151780 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2574 (_2!4510 lt!151769)) lt!151779))))

(assert (=> b!103698 (= lt!151782 (bvand v!199 (bvnot lt!151771)))))

(assert (=> b!103698 (= lt!151771 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!103698 (= (_2!4511 lt!151775) lt!151778)))

(assert (=> b!103698 (= lt!151775 (readBitPure!0 (_1!4512 lt!151774)))))

(declare-fun reader!0 (BitStream!3890 BitStream!3890) tuple2!8514)

(assert (=> b!103698 (= lt!151786 (reader!0 (_2!4510 lt!151788) (_2!4510 lt!151769)))))

(assert (=> b!103698 (= lt!151774 (reader!0 thiss!1305 (_2!4510 lt!151769)))))

(assert (=> b!103698 e!67869))

(declare-fun res!85322 () Bool)

(assert (=> b!103698 (=> (not res!85322) (not e!67869))))

(assert (=> b!103698 (= res!85322 (= (bitIndex!0 (size!2208 (buf!2574 (_1!4511 lt!151781))) (currentByte!5059 (_1!4511 lt!151781)) (currentBit!5054 (_1!4511 lt!151781))) (bitIndex!0 (size!2208 (buf!2574 (_1!4511 lt!151785))) (currentByte!5059 (_1!4511 lt!151785)) (currentBit!5054 (_1!4511 lt!151785)))))))

(declare-fun lt!151784 () Unit!6360)

(declare-fun lt!151768 () BitStream!3890)

(declare-fun readBitPrefixLemma!0 (BitStream!3890 BitStream!3890) Unit!6360)

(assert (=> b!103698 (= lt!151784 (readBitPrefixLemma!0 lt!151768 (_2!4510 lt!151769)))))

(assert (=> b!103698 (= lt!151785 (readBitPure!0 (BitStream!3891 (buf!2574 (_2!4510 lt!151769)) (currentByte!5059 thiss!1305) (currentBit!5054 thiss!1305))))))

(assert (=> b!103698 (= lt!151781 (readBitPure!0 lt!151768))))

(assert (=> b!103698 (= lt!151768 (BitStream!3891 (buf!2574 (_2!4510 lt!151788)) (currentByte!5059 thiss!1305) (currentBit!5054 thiss!1305)))))

(assert (=> b!103698 e!67863))

(declare-fun res!85325 () Bool)

(assert (=> b!103698 (=> (not res!85325) (not e!67863))))

(declare-fun isPrefixOf!0 (BitStream!3890 BitStream!3890) Bool)

(assert (=> b!103698 (= res!85325 (isPrefixOf!0 thiss!1305 (_2!4510 lt!151769)))))

(declare-fun lt!151765 () Unit!6360)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3890 BitStream!3890 BitStream!3890) Unit!6360)

(assert (=> b!103698 (= lt!151765 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4510 lt!151788) (_2!4510 lt!151769)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3890 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8510)

(assert (=> b!103698 (= lt!151769 (appendNLeastSignificantBitsLoop!0 (_2!4510 lt!151788) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103698 e!67868))

(declare-fun res!85318 () Bool)

(assert (=> b!103698 (=> (not res!85318) (not e!67868))))

(assert (=> b!103698 (= res!85318 (= (size!2208 (buf!2574 thiss!1305)) (size!2208 (buf!2574 (_2!4510 lt!151788)))))))

(declare-fun appendBit!0 (BitStream!3890 Bool) tuple2!8510)

(assert (=> b!103698 (= lt!151788 (appendBit!0 thiss!1305 lt!151778))))

(assert (=> b!103698 (= lt!151778 (not (= (bvand v!199 lt!151789) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103698 (= lt!151789 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103699 () Bool)

(declare-fun res!85324 () Bool)

(assert (=> b!103699 (=> (not res!85324) (not e!67859))))

(assert (=> b!103699 (= res!85324 (isPrefixOf!0 thiss!1305 (_2!4510 lt!151788)))))

(declare-fun b!103700 () Bool)

(declare-fun res!85317 () Bool)

(assert (=> b!103700 (=> (not res!85317) (not e!67863))))

(assert (=> b!103700 (= res!85317 (invariant!0 (currentBit!5054 thiss!1305) (currentByte!5059 thiss!1305) (size!2208 (buf!2574 (_2!4510 lt!151788)))))))

(declare-fun res!85320 () Bool)

(assert (=> start!20582 (=> (not res!85320) (not e!67860))))

(assert (=> start!20582 (= res!85320 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20582 e!67860))

(assert (=> start!20582 true))

(declare-fun inv!12 (BitStream!3890) Bool)

(assert (=> start!20582 (and (inv!12 thiss!1305) e!67867)))

(assert (= (and start!20582 res!85320) b!103691))

(assert (= (and b!103691 res!85313) b!103697))

(assert (= (and b!103697 res!85323) b!103698))

(assert (= (and b!103698 res!85318) b!103690))

(assert (= (and b!103690 res!85319) b!103699))

(assert (= (and b!103699 res!85324) b!103687))

(assert (= (and b!103687 res!85314) b!103695))

(assert (= (and b!103698 res!85325) b!103700))

(assert (= (and b!103700 res!85317) b!103689))

(assert (= (and b!103698 res!85322) b!103696))

(assert (= (and b!103698 (not res!85316)) b!103692))

(assert (= (and b!103692 (not res!85315)) b!103693))

(assert (= (and b!103693 (not res!85321)) b!103694))

(assert (= start!20582 b!103688))

(declare-fun m!151433 () Bool)

(assert (=> b!103699 m!151433))

(declare-fun m!151435 () Bool)

(assert (=> b!103688 m!151435))

(declare-fun m!151437 () Bool)

(assert (=> b!103697 m!151437))

(declare-fun m!151439 () Bool)

(assert (=> b!103700 m!151439))

(declare-fun m!151441 () Bool)

(assert (=> b!103698 m!151441))

(declare-fun m!151443 () Bool)

(assert (=> b!103698 m!151443))

(declare-fun m!151445 () Bool)

(assert (=> b!103698 m!151445))

(declare-fun m!151447 () Bool)

(assert (=> b!103698 m!151447))

(declare-fun m!151449 () Bool)

(assert (=> b!103698 m!151449))

(declare-fun m!151451 () Bool)

(assert (=> b!103698 m!151451))

(declare-fun m!151453 () Bool)

(assert (=> b!103698 m!151453))

(declare-fun m!151455 () Bool)

(assert (=> b!103698 m!151455))

(declare-fun m!151457 () Bool)

(assert (=> b!103698 m!151457))

(declare-fun m!151459 () Bool)

(assert (=> b!103698 m!151459))

(declare-fun m!151461 () Bool)

(assert (=> b!103698 m!151461))

(declare-fun m!151463 () Bool)

(assert (=> b!103698 m!151463))

(declare-fun m!151465 () Bool)

(assert (=> b!103698 m!151465))

(declare-fun m!151467 () Bool)

(assert (=> b!103698 m!151467))

(declare-fun m!151469 () Bool)

(assert (=> b!103698 m!151469))

(declare-fun m!151471 () Bool)

(assert (=> b!103698 m!151471))

(declare-fun m!151473 () Bool)

(assert (=> b!103698 m!151473))

(declare-fun m!151475 () Bool)

(assert (=> b!103698 m!151475))

(declare-fun m!151477 () Bool)

(assert (=> b!103698 m!151477))

(declare-fun m!151479 () Bool)

(assert (=> b!103687 m!151479))

(assert (=> b!103687 m!151479))

(declare-fun m!151481 () Bool)

(assert (=> b!103687 m!151481))

(declare-fun m!151483 () Bool)

(assert (=> b!103690 m!151483))

(declare-fun m!151485 () Bool)

(assert (=> b!103690 m!151485))

(declare-fun m!151487 () Bool)

(assert (=> b!103691 m!151487))

(declare-fun m!151489 () Bool)

(assert (=> b!103689 m!151489))

(declare-fun m!151491 () Bool)

(assert (=> b!103694 m!151491))

(assert (=> b!103694 m!151491))

(declare-fun m!151493 () Bool)

(assert (=> b!103694 m!151493))

(declare-fun m!151495 () Bool)

(assert (=> b!103692 m!151495))

(declare-fun m!151497 () Bool)

(assert (=> start!20582 m!151497))

(declare-fun m!151499 () Bool)

(assert (=> b!103695 m!151499))

(push 1)

(assert (not b!103697))

(assert (not b!103700))

(assert (not b!103690))

(assert (not start!20582))

(assert (not b!103699))

(assert (not b!103691))

(assert (not b!103692))

(assert (not b!103689))

(assert (not b!103687))

(assert (not b!103688))

(assert (not b!103698))

(assert (not b!103694))

(assert (not b!103695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

