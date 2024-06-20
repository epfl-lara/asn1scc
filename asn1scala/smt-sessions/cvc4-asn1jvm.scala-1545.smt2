; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43342 () Bool)

(assert start!43342)

(declare-fun b!204565 () Bool)

(declare-fun res!171439 () Bool)

(declare-fun e!140070 () Bool)

(assert (=> b!204565 (=> res!171439 e!140070)))

(declare-datatypes ((array!10344 0))(
  ( (array!10345 (arr!5478 (Array (_ BitVec 32) (_ BitVec 8))) (size!4548 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8204 0))(
  ( (BitStream!8205 (buf!5053 array!10344) (currentByte!9538 (_ BitVec 32)) (currentBit!9533 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14587 0))(
  ( (Unit!14588) )
))
(declare-datatypes ((tuple2!17500 0))(
  ( (tuple2!17501 (_1!9402 Unit!14587) (_2!9402 BitStream!8204)) )
))
(declare-fun lt!319501 () tuple2!17500)

(declare-fun lt!319499 () tuple2!17500)

(declare-fun isPrefixOf!0 (BitStream!8204 BitStream!8204) Bool)

(assert (=> b!204565 (= res!171439 (not (isPrefixOf!0 (_2!9402 lt!319501) (_2!9402 lt!319499))))))

(declare-fun b!204566 () Bool)

(declare-fun res!171432 () Bool)

(declare-fun e!140066 () Bool)

(assert (=> b!204566 (=> (not res!171432) (not e!140066))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!8204)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204566 (= res!171432 (validate_offset_bits!1 ((_ sign_extend 32) (size!4548 (buf!5053 thiss!1204))) ((_ sign_extend 32) (currentByte!9538 thiss!1204)) ((_ sign_extend 32) (currentBit!9533 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204567 () Bool)

(declare-fun res!171437 () Bool)

(declare-fun e!140068 () Bool)

(assert (=> b!204567 (=> (not res!171437) (not e!140068))))

(assert (=> b!204567 (= res!171437 (isPrefixOf!0 thiss!1204 (_2!9402 lt!319501)))))

(declare-fun b!204569 () Bool)

(declare-fun res!171435 () Bool)

(assert (=> b!204569 (=> res!171435 e!140070)))

(declare-fun lt!319505 () (_ BitVec 64))

(declare-fun lt!319506 () (_ BitVec 64))

(assert (=> b!204569 (= res!171435 (or (not (= (size!4548 (buf!5053 (_2!9402 lt!319499))) (size!4548 (buf!5053 thiss!1204)))) (not (= lt!319505 (bvsub (bvadd lt!319506 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204570 () Bool)

(declare-fun res!171440 () Bool)

(assert (=> b!204570 (=> (not res!171440) (not e!140066))))

(assert (=> b!204570 (= res!171440 (not (= i!590 nBits!348)))))

(declare-fun b!204571 () Bool)

(declare-fun e!140067 () Bool)

(assert (=> b!204571 (= e!140067 e!140068)))

(declare-fun res!171429 () Bool)

(assert (=> b!204571 (=> (not res!171429) (not e!140068))))

(declare-fun lt!319503 () (_ BitVec 64))

(declare-fun lt!319502 () (_ BitVec 64))

(assert (=> b!204571 (= res!171429 (= lt!319503 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319502)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204571 (= lt!319503 (bitIndex!0 (size!4548 (buf!5053 (_2!9402 lt!319501))) (currentByte!9538 (_2!9402 lt!319501)) (currentBit!9533 (_2!9402 lt!319501))))))

(assert (=> b!204571 (= lt!319502 (bitIndex!0 (size!4548 (buf!5053 thiss!1204)) (currentByte!9538 thiss!1204) (currentBit!9533 thiss!1204)))))

(declare-fun b!204572 () Bool)

(declare-fun e!140064 () Bool)

(declare-datatypes ((tuple2!17502 0))(
  ( (tuple2!17503 (_1!9403 BitStream!8204) (_2!9403 Bool)) )
))
(declare-fun lt!319504 () tuple2!17502)

(assert (=> b!204572 (= e!140064 (= (bitIndex!0 (size!4548 (buf!5053 (_1!9403 lt!319504))) (currentByte!9538 (_1!9403 lt!319504)) (currentBit!9533 (_1!9403 lt!319504))) lt!319503))))

(declare-fun b!204573 () Bool)

(declare-fun res!171436 () Bool)

(assert (=> b!204573 (=> res!171436 e!140070)))

(assert (=> b!204573 (= res!171436 (not (isPrefixOf!0 thiss!1204 (_2!9402 lt!319501))))))

(declare-fun b!204574 () Bool)

(declare-fun res!171434 () Bool)

(assert (=> b!204574 (=> (not res!171434) (not e!140066))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204574 (= res!171434 (invariant!0 (currentBit!9533 thiss!1204) (currentByte!9538 thiss!1204) (size!4548 (buf!5053 thiss!1204))))))

(declare-fun res!171430 () Bool)

(assert (=> start!43342 (=> (not res!171430) (not e!140066))))

(assert (=> start!43342 (= res!171430 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43342 e!140066))

(assert (=> start!43342 true))

(declare-fun e!140065 () Bool)

(declare-fun inv!12 (BitStream!8204) Bool)

(assert (=> start!43342 (and (inv!12 thiss!1204) e!140065)))

(declare-fun b!204568 () Bool)

(assert (=> b!204568 (= e!140070 (= (size!4548 (buf!5053 (_2!9402 lt!319501))) (size!4548 (buf!5053 (_2!9402 lt!319499)))))))

(assert (=> b!204568 (invariant!0 (currentBit!9533 thiss!1204) (currentByte!9538 thiss!1204) (size!4548 (buf!5053 (_2!9402 lt!319501))))))

(declare-fun b!204575 () Bool)

(declare-fun e!140063 () Bool)

(assert (=> b!204575 (= e!140063 e!140070)))

(declare-fun res!171427 () Bool)

(assert (=> b!204575 (=> res!171427 e!140070)))

(declare-fun lt!319500 () (_ BitVec 64))

(assert (=> b!204575 (= res!171427 (not (= lt!319505 (bvsub (bvsub (bvadd lt!319500 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!204575 (= lt!319505 (bitIndex!0 (size!4548 (buf!5053 (_2!9402 lt!319499))) (currentByte!9538 (_2!9402 lt!319499)) (currentBit!9533 (_2!9402 lt!319499))))))

(assert (=> b!204575 (isPrefixOf!0 thiss!1204 (_2!9402 lt!319499))))

(declare-fun lt!319507 () Unit!14587)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8204 BitStream!8204 BitStream!8204) Unit!14587)

(assert (=> b!204575 (= lt!319507 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9402 lt!319501) (_2!9402 lt!319499)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8204 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17500)

(assert (=> b!204575 (= lt!319499 (appendBitsLSBFirstLoopTR!0 (_2!9402 lt!319501) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204576 () Bool)

(declare-fun array_inv!4289 (array!10344) Bool)

(assert (=> b!204576 (= e!140065 (array_inv!4289 (buf!5053 thiss!1204)))))

(declare-fun b!204577 () Bool)

(declare-fun res!171438 () Bool)

(assert (=> b!204577 (=> res!171438 e!140070)))

(assert (=> b!204577 (= res!171438 (not (invariant!0 (currentBit!9533 (_2!9402 lt!319499)) (currentByte!9538 (_2!9402 lt!319499)) (size!4548 (buf!5053 (_2!9402 lt!319499))))))))

(declare-fun b!204578 () Bool)

(assert (=> b!204578 (= e!140068 e!140064)))

(declare-fun res!171428 () Bool)

(assert (=> b!204578 (=> (not res!171428) (not e!140064))))

(declare-fun lt!319508 () Bool)

(assert (=> b!204578 (= res!171428 (and (= (_2!9403 lt!319504) lt!319508) (= (_1!9403 lt!319504) (_2!9402 lt!319501))))))

(declare-fun readBitPure!0 (BitStream!8204) tuple2!17502)

(declare-fun readerFrom!0 (BitStream!8204 (_ BitVec 32) (_ BitVec 32)) BitStream!8204)

(assert (=> b!204578 (= lt!319504 (readBitPure!0 (readerFrom!0 (_2!9402 lt!319501) (currentBit!9533 thiss!1204) (currentByte!9538 thiss!1204))))))

(declare-fun b!204579 () Bool)

(assert (=> b!204579 (= e!140066 (not e!140063))))

(declare-fun res!171431 () Bool)

(assert (=> b!204579 (=> res!171431 e!140063)))

(assert (=> b!204579 (= res!171431 (not (= lt!319500 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319506))))))

(assert (=> b!204579 (= lt!319500 (bitIndex!0 (size!4548 (buf!5053 (_2!9402 lt!319501))) (currentByte!9538 (_2!9402 lt!319501)) (currentBit!9533 (_2!9402 lt!319501))))))

(assert (=> b!204579 (= lt!319506 (bitIndex!0 (size!4548 (buf!5053 thiss!1204)) (currentByte!9538 thiss!1204) (currentBit!9533 thiss!1204)))))

(assert (=> b!204579 e!140067))

(declare-fun res!171433 () Bool)

(assert (=> b!204579 (=> (not res!171433) (not e!140067))))

(assert (=> b!204579 (= res!171433 (= (size!4548 (buf!5053 thiss!1204)) (size!4548 (buf!5053 (_2!9402 lt!319501)))))))

(declare-fun appendBit!0 (BitStream!8204 Bool) tuple2!17500)

(assert (=> b!204579 (= lt!319501 (appendBit!0 thiss!1204 lt!319508))))

(assert (=> b!204579 (= lt!319508 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!43342 res!171430) b!204566))

(assert (= (and b!204566 res!171432) b!204574))

(assert (= (and b!204574 res!171434) b!204570))

(assert (= (and b!204570 res!171440) b!204579))

(assert (= (and b!204579 res!171433) b!204571))

(assert (= (and b!204571 res!171429) b!204567))

(assert (= (and b!204567 res!171437) b!204578))

(assert (= (and b!204578 res!171428) b!204572))

(assert (= (and b!204579 (not res!171431)) b!204575))

(assert (= (and b!204575 (not res!171427)) b!204577))

(assert (= (and b!204577 (not res!171438)) b!204569))

(assert (= (and b!204569 (not res!171435)) b!204565))

(assert (= (and b!204565 (not res!171439)) b!204573))

(assert (= (and b!204573 (not res!171436)) b!204568))

(assert (= start!43342 b!204576))

(declare-fun m!315669 () Bool)

(assert (=> b!204576 m!315669))

(declare-fun m!315671 () Bool)

(assert (=> b!204577 m!315671))

(declare-fun m!315673 () Bool)

(assert (=> b!204575 m!315673))

(declare-fun m!315675 () Bool)

(assert (=> b!204575 m!315675))

(declare-fun m!315677 () Bool)

(assert (=> b!204575 m!315677))

(declare-fun m!315679 () Bool)

(assert (=> b!204575 m!315679))

(declare-fun m!315681 () Bool)

(assert (=> b!204565 m!315681))

(declare-fun m!315683 () Bool)

(assert (=> b!204578 m!315683))

(assert (=> b!204578 m!315683))

(declare-fun m!315685 () Bool)

(assert (=> b!204578 m!315685))

(declare-fun m!315687 () Bool)

(assert (=> b!204579 m!315687))

(declare-fun m!315689 () Bool)

(assert (=> b!204579 m!315689))

(declare-fun m!315691 () Bool)

(assert (=> b!204579 m!315691))

(declare-fun m!315693 () Bool)

(assert (=> b!204568 m!315693))

(declare-fun m!315695 () Bool)

(assert (=> b!204572 m!315695))

(declare-fun m!315697 () Bool)

(assert (=> b!204574 m!315697))

(declare-fun m!315699 () Bool)

(assert (=> start!43342 m!315699))

(assert (=> b!204571 m!315687))

(assert (=> b!204571 m!315689))

(declare-fun m!315701 () Bool)

(assert (=> b!204573 m!315701))

(declare-fun m!315703 () Bool)

(assert (=> b!204566 m!315703))

(assert (=> b!204567 m!315701))

(push 1)

(assert (not start!43342))

(assert (not b!204579))

(assert (not b!204565))

(assert (not b!204568))

(assert (not b!204572))

(assert (not b!204573))

(assert (not b!204576))

(assert (not b!204566))

(assert (not b!204567))

(assert (not b!204571))

(assert (not b!204575))

(assert (not b!204577))

(assert (not b!204578))

(assert (not b!204574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

