; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39966 () Bool)

(assert start!39966)

(declare-fun b!182171 () Bool)

(declare-fun res!151390 () Bool)

(declare-fun e!126458 () Bool)

(assert (=> b!182171 (=> (not res!151390) (not e!126458))))

(declare-datatypes ((array!9726 0))(
  ( (array!9727 (arr!5220 (Array (_ BitVec 32) (_ BitVec 8))) (size!4290 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7688 0))(
  ( (BitStream!7689 (buf!4739 array!9726) (currentByte!8961 (_ BitVec 32)) (currentBit!8956 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7688)

(declare-datatypes ((Unit!13077 0))(
  ( (Unit!13078) )
))
(declare-datatypes ((tuple2!15732 0))(
  ( (tuple2!15733 (_1!8511 Unit!13077) (_2!8511 BitStream!7688)) )
))
(declare-fun lt!279671 () tuple2!15732)

(declare-fun isPrefixOf!0 (BitStream!7688 BitStream!7688) Bool)

(assert (=> b!182171 (= res!151390 (isPrefixOf!0 thiss!1204 (_2!8511 lt!279671)))))

(declare-fun b!182172 () Bool)

(declare-fun res!151383 () Bool)

(declare-fun e!126460 () Bool)

(assert (=> b!182172 (=> res!151383 e!126460)))

(declare-fun lt!279668 () tuple2!15732)

(assert (=> b!182172 (= res!151383 (not (isPrefixOf!0 (_2!8511 lt!279671) (_2!8511 lt!279668))))))

(declare-fun b!182173 () Bool)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!182173 (= e!126460 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!279682 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182173 (validate_offset_bits!1 ((_ sign_extend 32) (size!4290 (buf!4739 (_2!8511 lt!279668)))) ((_ sign_extend 32) (currentByte!8961 (_2!8511 lt!279671))) ((_ sign_extend 32) (currentBit!8956 (_2!8511 lt!279671))) lt!279682)))

(declare-fun lt!279673 () Unit!13077)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7688 array!9726 (_ BitVec 64)) Unit!13077)

(assert (=> b!182173 (= lt!279673 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8511 lt!279671) (buf!4739 (_2!8511 lt!279668)) lt!279682))))

(assert (=> b!182173 (= lt!279682 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!15734 0))(
  ( (tuple2!15735 (_1!8512 BitStream!7688) (_2!8512 (_ BitVec 64))) )
))
(declare-fun lt!279669 () tuple2!15734)

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!15736 0))(
  ( (tuple2!15737 (_1!8513 BitStream!7688) (_2!8513 BitStream!7688)) )
))
(declare-fun lt!279666 () tuple2!15736)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15734)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182173 (= lt!279669 (readNBitsLSBFirstsLoopPure!0 (_1!8513 lt!279666) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279681 () (_ BitVec 64))

(assert (=> b!182173 (validate_offset_bits!1 ((_ sign_extend 32) (size!4290 (buf!4739 (_2!8511 lt!279668)))) ((_ sign_extend 32) (currentByte!8961 thiss!1204)) ((_ sign_extend 32) (currentBit!8956 thiss!1204)) lt!279681)))

(declare-fun lt!279683 () Unit!13077)

(assert (=> b!182173 (= lt!279683 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4739 (_2!8511 lt!279668)) lt!279681))))

(declare-fun lt!279686 () Bool)

(declare-datatypes ((tuple2!15738 0))(
  ( (tuple2!15739 (_1!8514 BitStream!7688) (_2!8514 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7688) tuple2!15738)

(assert (=> b!182173 (= (_2!8514 (readBitPure!0 (_1!8513 lt!279666))) lt!279686)))

(declare-fun lt!279670 () tuple2!15736)

(declare-fun reader!0 (BitStream!7688 BitStream!7688) tuple2!15736)

(assert (=> b!182173 (= lt!279670 (reader!0 (_2!8511 lt!279671) (_2!8511 lt!279668)))))

(assert (=> b!182173 (= lt!279666 (reader!0 thiss!1204 (_2!8511 lt!279668)))))

(declare-fun e!126450 () Bool)

(assert (=> b!182173 e!126450))

(declare-fun res!151388 () Bool)

(assert (=> b!182173 (=> (not res!151388) (not e!126450))))

(declare-fun lt!279684 () tuple2!15738)

(declare-fun lt!279676 () tuple2!15738)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182173 (= res!151388 (= (bitIndex!0 (size!4290 (buf!4739 (_1!8514 lt!279684))) (currentByte!8961 (_1!8514 lt!279684)) (currentBit!8956 (_1!8514 lt!279684))) (bitIndex!0 (size!4290 (buf!4739 (_1!8514 lt!279676))) (currentByte!8961 (_1!8514 lt!279676)) (currentBit!8956 (_1!8514 lt!279676)))))))

(declare-fun lt!279667 () Unit!13077)

(declare-fun lt!279679 () BitStream!7688)

(declare-fun readBitPrefixLemma!0 (BitStream!7688 BitStream!7688) Unit!13077)

(assert (=> b!182173 (= lt!279667 (readBitPrefixLemma!0 lt!279679 (_2!8511 lt!279668)))))

(assert (=> b!182173 (= lt!279676 (readBitPure!0 (BitStream!7689 (buf!4739 (_2!8511 lt!279668)) (currentByte!8961 thiss!1204) (currentBit!8956 thiss!1204))))))

(assert (=> b!182173 (= lt!279684 (readBitPure!0 lt!279679))))

(declare-fun e!126456 () Bool)

(assert (=> b!182173 e!126456))

(declare-fun res!151392 () Bool)

(assert (=> b!182173 (=> (not res!151392) (not e!126456))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182173 (= res!151392 (invariant!0 (currentBit!8956 thiss!1204) (currentByte!8961 thiss!1204) (size!4290 (buf!4739 (_2!8511 lt!279671)))))))

(assert (=> b!182173 (= lt!279679 (BitStream!7689 (buf!4739 (_2!8511 lt!279671)) (currentByte!8961 thiss!1204) (currentBit!8956 thiss!1204)))))

(declare-fun b!182174 () Bool)

(declare-fun e!126455 () Bool)

(declare-fun e!126451 () Bool)

(assert (=> b!182174 (= e!126455 (not e!126451))))

(declare-fun res!151378 () Bool)

(assert (=> b!182174 (=> res!151378 e!126451)))

(declare-fun lt!279672 () (_ BitVec 64))

(declare-fun lt!279675 () (_ BitVec 64))

(assert (=> b!182174 (= res!151378 (not (= lt!279672 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279675))))))

(assert (=> b!182174 (= lt!279672 (bitIndex!0 (size!4290 (buf!4739 (_2!8511 lt!279671))) (currentByte!8961 (_2!8511 lt!279671)) (currentBit!8956 (_2!8511 lt!279671))))))

(assert (=> b!182174 (= lt!279675 (bitIndex!0 (size!4290 (buf!4739 thiss!1204)) (currentByte!8961 thiss!1204) (currentBit!8956 thiss!1204)))))

(declare-fun e!126452 () Bool)

(assert (=> b!182174 e!126452))

(declare-fun res!151389 () Bool)

(assert (=> b!182174 (=> (not res!151389) (not e!126452))))

(assert (=> b!182174 (= res!151389 (= (size!4290 (buf!4739 thiss!1204)) (size!4290 (buf!4739 (_2!8511 lt!279671)))))))

(declare-fun appendBit!0 (BitStream!7688 Bool) tuple2!15732)

(assert (=> b!182174 (= lt!279671 (appendBit!0 thiss!1204 lt!279686))))

(assert (=> b!182174 (= lt!279686 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182175 () Bool)

(declare-fun e!126454 () Bool)

(assert (=> b!182175 (= e!126458 e!126454)))

(declare-fun res!151377 () Bool)

(assert (=> b!182175 (=> (not res!151377) (not e!126454))))

(declare-fun lt!279678 () tuple2!15738)

(assert (=> b!182175 (= res!151377 (and (= (_2!8514 lt!279678) lt!279686) (= (_1!8514 lt!279678) (_2!8511 lt!279671))))))

(declare-fun readerFrom!0 (BitStream!7688 (_ BitVec 32) (_ BitVec 32)) BitStream!7688)

(assert (=> b!182175 (= lt!279678 (readBitPure!0 (readerFrom!0 (_2!8511 lt!279671) (currentBit!8956 thiss!1204) (currentByte!8961 thiss!1204))))))

(declare-fun b!182176 () Bool)

(declare-fun res!151387 () Bool)

(assert (=> b!182176 (=> res!151387 e!126460)))

(declare-fun lt!279677 () (_ BitVec 64))

(assert (=> b!182176 (= res!151387 (or (not (= (size!4290 (buf!4739 (_2!8511 lt!279668))) (size!4290 (buf!4739 thiss!1204)))) (not (= lt!279677 (bvsub (bvadd lt!279675 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!151391 () Bool)

(declare-fun e!126457 () Bool)

(assert (=> start!39966 (=> (not res!151391) (not e!126457))))

(assert (=> start!39966 (= res!151391 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39966 e!126457))

(assert (=> start!39966 true))

(declare-fun e!126459 () Bool)

(declare-fun inv!12 (BitStream!7688) Bool)

(assert (=> start!39966 (and (inv!12 thiss!1204) e!126459)))

(declare-fun b!182177 () Bool)

(assert (=> b!182177 (= e!126452 e!126458)))

(declare-fun res!151379 () Bool)

(assert (=> b!182177 (=> (not res!151379) (not e!126458))))

(declare-fun lt!279680 () (_ BitVec 64))

(declare-fun lt!279685 () (_ BitVec 64))

(assert (=> b!182177 (= res!151379 (= lt!279680 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279685)))))

(assert (=> b!182177 (= lt!279680 (bitIndex!0 (size!4290 (buf!4739 (_2!8511 lt!279671))) (currentByte!8961 (_2!8511 lt!279671)) (currentBit!8956 (_2!8511 lt!279671))))))

(assert (=> b!182177 (= lt!279685 (bitIndex!0 (size!4290 (buf!4739 thiss!1204)) (currentByte!8961 thiss!1204) (currentBit!8956 thiss!1204)))))

(declare-fun b!182178 () Bool)

(declare-fun res!151386 () Bool)

(assert (=> b!182178 (=> res!151386 e!126460)))

(assert (=> b!182178 (= res!151386 (not (invariant!0 (currentBit!8956 (_2!8511 lt!279668)) (currentByte!8961 (_2!8511 lt!279668)) (size!4290 (buf!4739 (_2!8511 lt!279668))))))))

(declare-fun b!182179 () Bool)

(assert (=> b!182179 (= e!126457 e!126455)))

(declare-fun res!151384 () Bool)

(assert (=> b!182179 (=> (not res!151384) (not e!126455))))

(assert (=> b!182179 (= res!151384 (validate_offset_bits!1 ((_ sign_extend 32) (size!4290 (buf!4739 thiss!1204))) ((_ sign_extend 32) (currentByte!8961 thiss!1204)) ((_ sign_extend 32) (currentBit!8956 thiss!1204)) lt!279681))))

(assert (=> b!182179 (= lt!279681 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!182180 () Bool)

(assert (=> b!182180 (= e!126451 e!126460)))

(declare-fun res!151385 () Bool)

(assert (=> b!182180 (=> res!151385 e!126460)))

(assert (=> b!182180 (= res!151385 (not (= lt!279677 (bvsub (bvsub (bvadd lt!279672 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!182180 (= lt!279677 (bitIndex!0 (size!4290 (buf!4739 (_2!8511 lt!279668))) (currentByte!8961 (_2!8511 lt!279668)) (currentBit!8956 (_2!8511 lt!279668))))))

(assert (=> b!182180 (isPrefixOf!0 thiss!1204 (_2!8511 lt!279668))))

(declare-fun lt!279674 () Unit!13077)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7688 BitStream!7688 BitStream!7688) Unit!13077)

(assert (=> b!182180 (= lt!279674 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8511 lt!279671) (_2!8511 lt!279668)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15732)

(assert (=> b!182180 (= lt!279668 (appendBitsLSBFirstLoopTR!0 (_2!8511 lt!279671) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!182181 () Bool)

(assert (=> b!182181 (= e!126450 (= (_2!8514 lt!279684) (_2!8514 lt!279676)))))

(declare-fun b!182182 () Bool)

(assert (=> b!182182 (= e!126456 (invariant!0 (currentBit!8956 thiss!1204) (currentByte!8961 thiss!1204) (size!4290 (buf!4739 (_2!8511 lt!279668)))))))

(declare-fun b!182183 () Bool)

(declare-fun res!151382 () Bool)

(assert (=> b!182183 (=> res!151382 e!126460)))

(assert (=> b!182183 (= res!151382 (not (isPrefixOf!0 thiss!1204 (_2!8511 lt!279671))))))

(declare-fun b!182184 () Bool)

(assert (=> b!182184 (= e!126454 (= (bitIndex!0 (size!4290 (buf!4739 (_1!8514 lt!279678))) (currentByte!8961 (_1!8514 lt!279678)) (currentBit!8956 (_1!8514 lt!279678))) lt!279680))))

(declare-fun b!182185 () Bool)

(declare-fun array_inv!4031 (array!9726) Bool)

(assert (=> b!182185 (= e!126459 (array_inv!4031 (buf!4739 thiss!1204)))))

(declare-fun b!182186 () Bool)

(declare-fun res!151381 () Bool)

(assert (=> b!182186 (=> (not res!151381) (not e!126455))))

(assert (=> b!182186 (= res!151381 (invariant!0 (currentBit!8956 thiss!1204) (currentByte!8961 thiss!1204) (size!4290 (buf!4739 thiss!1204))))))

(declare-fun b!182187 () Bool)

(declare-fun res!151380 () Bool)

(assert (=> b!182187 (=> (not res!151380) (not e!126455))))

(assert (=> b!182187 (= res!151380 (not (= i!590 nBits!348)))))

(assert (= (and start!39966 res!151391) b!182179))

(assert (= (and b!182179 res!151384) b!182186))

(assert (= (and b!182186 res!151381) b!182187))

(assert (= (and b!182187 res!151380) b!182174))

(assert (= (and b!182174 res!151389) b!182177))

(assert (= (and b!182177 res!151379) b!182171))

(assert (= (and b!182171 res!151390) b!182175))

(assert (= (and b!182175 res!151377) b!182184))

(assert (= (and b!182174 (not res!151378)) b!182180))

(assert (= (and b!182180 (not res!151385)) b!182178))

(assert (= (and b!182178 (not res!151386)) b!182176))

(assert (= (and b!182176 (not res!151387)) b!182172))

(assert (= (and b!182172 (not res!151383)) b!182183))

(assert (= (and b!182183 (not res!151382)) b!182173))

(assert (= (and b!182173 res!151392) b!182182))

(assert (= (and b!182173 res!151388) b!182181))

(assert (= start!39966 b!182185))

(declare-fun m!283363 () Bool)

(assert (=> b!182171 m!283363))

(declare-fun m!283365 () Bool)

(assert (=> b!182184 m!283365))

(assert (=> b!182183 m!283363))

(declare-fun m!283367 () Bool)

(assert (=> b!182178 m!283367))

(declare-fun m!283369 () Bool)

(assert (=> b!182179 m!283369))

(declare-fun m!283371 () Bool)

(assert (=> b!182177 m!283371))

(declare-fun m!283373 () Bool)

(assert (=> b!182177 m!283373))

(assert (=> b!182174 m!283371))

(assert (=> b!182174 m!283373))

(declare-fun m!283375 () Bool)

(assert (=> b!182174 m!283375))

(declare-fun m!283377 () Bool)

(assert (=> start!39966 m!283377))

(declare-fun m!283379 () Bool)

(assert (=> b!182186 m!283379))

(declare-fun m!283381 () Bool)

(assert (=> b!182180 m!283381))

(declare-fun m!283383 () Bool)

(assert (=> b!182180 m!283383))

(declare-fun m!283385 () Bool)

(assert (=> b!182180 m!283385))

(declare-fun m!283387 () Bool)

(assert (=> b!182180 m!283387))

(declare-fun m!283389 () Bool)

(assert (=> b!182185 m!283389))

(declare-fun m!283391 () Bool)

(assert (=> b!182172 m!283391))

(declare-fun m!283393 () Bool)

(assert (=> b!182175 m!283393))

(assert (=> b!182175 m!283393))

(declare-fun m!283395 () Bool)

(assert (=> b!182175 m!283395))

(declare-fun m!283397 () Bool)

(assert (=> b!182182 m!283397))

(declare-fun m!283399 () Bool)

(assert (=> b!182173 m!283399))

(declare-fun m!283401 () Bool)

(assert (=> b!182173 m!283401))

(declare-fun m!283403 () Bool)

(assert (=> b!182173 m!283403))

(declare-fun m!283405 () Bool)

(assert (=> b!182173 m!283405))

(declare-fun m!283407 () Bool)

(assert (=> b!182173 m!283407))

(declare-fun m!283409 () Bool)

(assert (=> b!182173 m!283409))

(declare-fun m!283411 () Bool)

(assert (=> b!182173 m!283411))

(declare-fun m!283413 () Bool)

(assert (=> b!182173 m!283413))

(declare-fun m!283415 () Bool)

(assert (=> b!182173 m!283415))

(declare-fun m!283417 () Bool)

(assert (=> b!182173 m!283417))

(declare-fun m!283419 () Bool)

(assert (=> b!182173 m!283419))

(declare-fun m!283421 () Bool)

(assert (=> b!182173 m!283421))

(declare-fun m!283423 () Bool)

(assert (=> b!182173 m!283423))

(declare-fun m!283425 () Bool)

(assert (=> b!182173 m!283425))

(declare-fun m!283427 () Bool)

(assert (=> b!182173 m!283427))

(push 1)

(assert (not b!182186))

(assert (not b!182179))

(assert (not b!182178))

(assert (not b!182183))

(assert (not b!182184))

(assert (not b!182174))

(assert (not b!182177))

(assert (not b!182172))

(assert (not b!182180))

(assert (not b!182173))

(assert (not b!182171))

(assert (not b!182175))

(assert (not start!39966))

(assert (not b!182185))

(assert (not b!182182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

