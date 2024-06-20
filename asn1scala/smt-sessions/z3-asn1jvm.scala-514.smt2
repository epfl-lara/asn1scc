; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15064 () Bool)

(assert start!15064)

(declare-fun res!63773 () Bool)

(declare-fun e!50625 () Bool)

(assert (=> start!15064 (=> (not res!63773) (not e!50625))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15064 (= res!63773 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15064 e!50625))

(assert (=> start!15064 true))

(declare-datatypes ((array!3226 0))(
  ( (array!3227 (arr!2101 (Array (_ BitVec 32) (_ BitVec 8))) (size!1500 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2574 0))(
  ( (BitStream!2575 (buf!1890 array!3226) (currentByte!3701 (_ BitVec 32)) (currentBit!3696 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2574)

(declare-fun e!50627 () Bool)

(declare-fun inv!12 (BitStream!2574) Bool)

(assert (=> start!15064 (and (inv!12 thiss!1090) e!50627)))

(declare-fun b!77179 () Bool)

(declare-fun res!63774 () Bool)

(assert (=> b!77179 (=> (not res!63774) (not e!50625))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77179 (= res!63774 (validate_offset_bits!1 ((_ sign_extend 32) (size!1500 (buf!1890 thiss!1090))) ((_ sign_extend 32) (currentByte!3701 thiss!1090)) ((_ sign_extend 32) (currentBit!3696 thiss!1090)) nBits!322))))

(declare-fun b!77180 () Bool)

(declare-fun array_inv!1346 (array!3226) Bool)

(assert (=> b!77180 (= e!50627 (array_inv!1346 (buf!1890 thiss!1090)))))

(declare-fun b!77181 () Bool)

(declare-fun res!63775 () Bool)

(declare-fun e!50628 () Bool)

(assert (=> b!77181 (=> (not res!63775) (not e!50628))))

(declare-datatypes ((Unit!5091 0))(
  ( (Unit!5092) )
))
(declare-datatypes ((tuple2!6782 0))(
  ( (tuple2!6783 (_1!3525 Unit!5091) (_2!3525 BitStream!2574)) )
))
(declare-fun lt!123642 () tuple2!6782)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77181 (= res!63775 (= (bitIndex!0 (size!1500 (buf!1890 (_2!3525 lt!123642))) (currentByte!3701 (_2!3525 lt!123642)) (currentBit!3696 (_2!3525 lt!123642))) (bvadd (bitIndex!0 (size!1500 (buf!1890 thiss!1090)) (currentByte!3701 thiss!1090) (currentBit!3696 thiss!1090)) nBits!322)))))

(declare-fun b!77182 () Bool)

(declare-fun res!63771 () Bool)

(assert (=> b!77182 (=> (not res!63771) (not e!50628))))

(declare-fun isPrefixOf!0 (BitStream!2574 BitStream!2574) Bool)

(assert (=> b!77182 (= res!63771 (isPrefixOf!0 thiss!1090 (_2!3525 lt!123642)))))

(declare-fun b!77183 () Bool)

(assert (=> b!77183 (= e!50625 (not true))))

(assert (=> b!77183 (validate_offset_bits!1 ((_ sign_extend 32) (size!1500 (buf!1890 (_2!3525 lt!123642)))) ((_ sign_extend 32) (currentByte!3701 thiss!1090)) ((_ sign_extend 32) (currentBit!3696 thiss!1090)) nBits!322)))

(declare-fun lt!123634 () Unit!5091)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2574 array!3226 (_ BitVec 64)) Unit!5091)

(assert (=> b!77183 (= lt!123634 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1890 (_2!3525 lt!123642)) nBits!322))))

(declare-datatypes ((tuple2!6784 0))(
  ( (tuple2!6785 (_1!3526 BitStream!2574) (_2!3526 BitStream!2574)) )
))
(declare-fun lt!123635 () tuple2!6784)

(declare-fun reader!0 (BitStream!2574 BitStream!2574) tuple2!6784)

(assert (=> b!77183 (= lt!123635 (reader!0 thiss!1090 (_2!3525 lt!123642)))))

(declare-fun lt!123638 () Bool)

(assert (=> b!77183 (= lt!123638 (isPrefixOf!0 thiss!1090 (_2!3525 lt!123642)))))

(declare-fun lt!123636 () (_ BitVec 64))

(assert (=> b!77183 (= lt!123636 (bitIndex!0 (size!1500 (buf!1890 (_2!3525 lt!123642))) (currentByte!3701 (_2!3525 lt!123642)) (currentBit!3696 (_2!3525 lt!123642))))))

(declare-fun lt!123641 () (_ BitVec 64))

(assert (=> b!77183 (= lt!123641 (bitIndex!0 (size!1500 (buf!1890 thiss!1090)) (currentByte!3701 thiss!1090) (currentBit!3696 thiss!1090)))))

(assert (=> b!77183 e!50628))

(declare-fun res!63772 () Bool)

(assert (=> b!77183 (=> (not res!63772) (not e!50628))))

(assert (=> b!77183 (= res!63772 (= (size!1500 (buf!1890 thiss!1090)) (size!1500 (buf!1890 (_2!3525 lt!123642)))))))

(declare-fun appendNBits!0 (BitStream!2574 (_ BitVec 64) Bool) tuple2!6782)

(assert (=> b!77183 (= lt!123642 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77184 () Bool)

(declare-datatypes ((tuple2!6786 0))(
  ( (tuple2!6787 (_1!3527 BitStream!2574) (_2!3527 Bool)) )
))
(declare-fun lt!123640 () tuple2!6786)

(declare-fun lt!123639 () tuple2!6784)

(assert (=> b!77184 (= e!50628 (not (or (not (_2!3527 lt!123640)) (not (= (_1!3527 lt!123640) (_2!3526 lt!123639))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2574 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6786)

(assert (=> b!77184 (= lt!123640 (checkBitsLoopPure!0 (_1!3526 lt!123639) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77184 (validate_offset_bits!1 ((_ sign_extend 32) (size!1500 (buf!1890 (_2!3525 lt!123642)))) ((_ sign_extend 32) (currentByte!3701 thiss!1090)) ((_ sign_extend 32) (currentBit!3696 thiss!1090)) nBits!322)))

(declare-fun lt!123637 () Unit!5091)

(assert (=> b!77184 (= lt!123637 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1890 (_2!3525 lt!123642)) nBits!322))))

(assert (=> b!77184 (= lt!123639 (reader!0 thiss!1090 (_2!3525 lt!123642)))))

(assert (= (and start!15064 res!63773) b!77179))

(assert (= (and b!77179 res!63774) b!77183))

(assert (= (and b!77183 res!63772) b!77181))

(assert (= (and b!77181 res!63775) b!77182))

(assert (= (and b!77182 res!63771) b!77184))

(assert (= start!15064 b!77180))

(declare-fun m!122589 () Bool)

(assert (=> b!77181 m!122589))

(declare-fun m!122591 () Bool)

(assert (=> b!77181 m!122591))

(declare-fun m!122593 () Bool)

(assert (=> b!77179 m!122593))

(declare-fun m!122595 () Bool)

(assert (=> b!77182 m!122595))

(declare-fun m!122597 () Bool)

(assert (=> start!15064 m!122597))

(declare-fun m!122599 () Bool)

(assert (=> b!77184 m!122599))

(declare-fun m!122601 () Bool)

(assert (=> b!77184 m!122601))

(declare-fun m!122603 () Bool)

(assert (=> b!77184 m!122603))

(declare-fun m!122605 () Bool)

(assert (=> b!77184 m!122605))

(assert (=> b!77183 m!122595))

(assert (=> b!77183 m!122605))

(assert (=> b!77183 m!122591))

(assert (=> b!77183 m!122601))

(assert (=> b!77183 m!122603))

(assert (=> b!77183 m!122589))

(declare-fun m!122607 () Bool)

(assert (=> b!77183 m!122607))

(declare-fun m!122609 () Bool)

(assert (=> b!77180 m!122609))

(check-sat (not b!77184) (not b!77180) (not b!77183) (not b!77181) (not start!15064) (not b!77179) (not b!77182))
