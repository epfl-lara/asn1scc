; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15052 () Bool)

(assert start!15052)

(declare-fun b!77071 () Bool)

(declare-fun e!50556 () Bool)

(assert (=> b!77071 (= e!50556 (not true))))

(declare-datatypes ((array!3214 0))(
  ( (array!3215 (arr!2095 (Array (_ BitVec 32) (_ BitVec 8))) (size!1494 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2562 0))(
  ( (BitStream!2563 (buf!1884 array!3214) (currentByte!3695 (_ BitVec 32)) (currentBit!3690 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6746 0))(
  ( (tuple2!6747 (_1!3507 BitStream!2562) (_2!3507 BitStream!2562)) )
))
(declare-fun lt!123489 () tuple2!6746)

(declare-fun thiss!1090 () BitStream!2562)

(declare-datatypes ((Unit!5079 0))(
  ( (Unit!5080) )
))
(declare-datatypes ((tuple2!6748 0))(
  ( (tuple2!6749 (_1!3508 Unit!5079) (_2!3508 BitStream!2562)) )
))
(declare-fun lt!123485 () tuple2!6748)

(declare-fun reader!0 (BitStream!2562 BitStream!2562) tuple2!6746)

(assert (=> b!77071 (= lt!123489 (reader!0 thiss!1090 (_2!3508 lt!123485)))))

(declare-fun lt!123492 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2562 BitStream!2562) Bool)

(assert (=> b!77071 (= lt!123492 (isPrefixOf!0 thiss!1090 (_2!3508 lt!123485)))))

(declare-fun lt!123491 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77071 (= lt!123491 (bitIndex!0 (size!1494 (buf!1884 (_2!3508 lt!123485))) (currentByte!3695 (_2!3508 lt!123485)) (currentBit!3690 (_2!3508 lt!123485))))))

(declare-fun lt!123490 () (_ BitVec 64))

(assert (=> b!77071 (= lt!123490 (bitIndex!0 (size!1494 (buf!1884 thiss!1090)) (currentByte!3695 thiss!1090) (currentBit!3690 thiss!1090)))))

(declare-fun e!50555 () Bool)

(assert (=> b!77071 e!50555))

(declare-fun res!63682 () Bool)

(assert (=> b!77071 (=> (not res!63682) (not e!50555))))

(assert (=> b!77071 (= res!63682 (= (size!1494 (buf!1884 thiss!1090)) (size!1494 (buf!1884 (_2!3508 lt!123485)))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun appendNBits!0 (BitStream!2562 (_ BitVec 64) Bool) tuple2!6748)

(assert (=> b!77071 (= lt!123485 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77072 () Bool)

(declare-datatypes ((tuple2!6750 0))(
  ( (tuple2!6751 (_1!3509 BitStream!2562) (_2!3509 Bool)) )
))
(declare-fun lt!123486 () tuple2!6750)

(declare-fun lt!123488 () tuple2!6746)

(assert (=> b!77072 (= e!50555 (not (or (not (_2!3509 lt!123486)) (not (= (_1!3509 lt!123486) (_2!3507 lt!123488))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2562 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6750)

(assert (=> b!77072 (= lt!123486 (checkBitsLoopPure!0 (_1!3507 lt!123488) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77072 (validate_offset_bits!1 ((_ sign_extend 32) (size!1494 (buf!1884 (_2!3508 lt!123485)))) ((_ sign_extend 32) (currentByte!3695 thiss!1090)) ((_ sign_extend 32) (currentBit!3690 thiss!1090)) nBits!322)))

(declare-fun lt!123487 () Unit!5079)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2562 array!3214 (_ BitVec 64)) Unit!5079)

(assert (=> b!77072 (= lt!123487 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1884 (_2!3508 lt!123485)) nBits!322))))

(assert (=> b!77072 (= lt!123488 (reader!0 thiss!1090 (_2!3508 lt!123485)))))

(declare-fun b!77073 () Bool)

(declare-fun res!63684 () Bool)

(assert (=> b!77073 (=> (not res!63684) (not e!50556))))

(assert (=> b!77073 (= res!63684 (validate_offset_bits!1 ((_ sign_extend 32) (size!1494 (buf!1884 thiss!1090))) ((_ sign_extend 32) (currentByte!3695 thiss!1090)) ((_ sign_extend 32) (currentBit!3690 thiss!1090)) nBits!322))))

(declare-fun res!63683 () Bool)

(assert (=> start!15052 (=> (not res!63683) (not e!50556))))

(assert (=> start!15052 (= res!63683 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15052 e!50556))

(assert (=> start!15052 true))

(declare-fun e!50553 () Bool)

(declare-fun inv!12 (BitStream!2562) Bool)

(assert (=> start!15052 (and (inv!12 thiss!1090) e!50553)))

(declare-fun b!77074 () Bool)

(declare-fun res!63681 () Bool)

(assert (=> b!77074 (=> (not res!63681) (not e!50555))))

(assert (=> b!77074 (= res!63681 (isPrefixOf!0 thiss!1090 (_2!3508 lt!123485)))))

(declare-fun b!77075 () Bool)

(declare-fun res!63685 () Bool)

(assert (=> b!77075 (=> (not res!63685) (not e!50555))))

(assert (=> b!77075 (= res!63685 (= (bitIndex!0 (size!1494 (buf!1884 (_2!3508 lt!123485))) (currentByte!3695 (_2!3508 lt!123485)) (currentBit!3690 (_2!3508 lt!123485))) (bvadd (bitIndex!0 (size!1494 (buf!1884 thiss!1090)) (currentByte!3695 thiss!1090) (currentBit!3690 thiss!1090)) nBits!322)))))

(declare-fun b!77076 () Bool)

(declare-fun array_inv!1340 (array!3214) Bool)

(assert (=> b!77076 (= e!50553 (array_inv!1340 (buf!1884 thiss!1090)))))

(assert (= (and start!15052 res!63683) b!77073))

(assert (= (and b!77073 res!63684) b!77071))

(assert (= (and b!77071 res!63682) b!77075))

(assert (= (and b!77075 res!63685) b!77074))

(assert (= (and b!77074 res!63681) b!77072))

(assert (= start!15052 b!77076))

(declare-fun m!122457 () Bool)

(assert (=> start!15052 m!122457))

(declare-fun m!122459 () Bool)

(assert (=> b!77073 m!122459))

(declare-fun m!122461 () Bool)

(assert (=> b!77076 m!122461))

(declare-fun m!122463 () Bool)

(assert (=> b!77071 m!122463))

(declare-fun m!122465 () Bool)

(assert (=> b!77071 m!122465))

(declare-fun m!122467 () Bool)

(assert (=> b!77071 m!122467))

(declare-fun m!122469 () Bool)

(assert (=> b!77071 m!122469))

(declare-fun m!122471 () Bool)

(assert (=> b!77071 m!122471))

(assert (=> b!77074 m!122465))

(declare-fun m!122473 () Bool)

(assert (=> b!77072 m!122473))

(declare-fun m!122475 () Bool)

(assert (=> b!77072 m!122475))

(declare-fun m!122477 () Bool)

(assert (=> b!77072 m!122477))

(assert (=> b!77072 m!122471))

(assert (=> b!77075 m!122469))

(assert (=> b!77075 m!122463))

(check-sat (not b!77073) (not b!77075) (not b!77072) (not b!77074) (not b!77071) (not b!77076) (not start!15052))
