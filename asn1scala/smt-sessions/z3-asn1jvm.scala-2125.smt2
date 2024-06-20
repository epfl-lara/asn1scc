; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53738 () Bool)

(assert start!53738)

(declare-fun b!250221 () Bool)

(declare-fun res!209469 () Bool)

(declare-fun e!173442 () Bool)

(assert (=> b!250221 (=> (not res!209469) (not e!173442))))

(declare-datatypes ((array!13647 0))(
  ( (array!13648 (arr!6974 (Array (_ BitVec 32) (_ BitVec 8))) (size!5987 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10896 0))(
  ( (BitStream!10897 (buf!6480 array!13647) (currentByte!11911 (_ BitVec 32)) (currentBit!11906 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18110 0))(
  ( (Unit!18111) )
))
(declare-datatypes ((tuple2!21474 0))(
  ( (tuple2!21475 (_1!11662 Unit!18110) (_2!11662 BitStream!10896)) )
))
(declare-fun lt!388801 () tuple2!21474)

(declare-fun lt!388795 () tuple2!21474)

(declare-fun isPrefixOf!0 (BitStream!10896 BitStream!10896) Bool)

(assert (=> b!250221 (= res!209469 (isPrefixOf!0 (_2!11662 lt!388801) (_2!11662 lt!388795)))))

(declare-fun b!250222 () Bool)

(declare-fun e!173437 () Bool)

(declare-fun thiss!1005 () BitStream!10896)

(declare-fun array_inv!5728 (array!13647) Bool)

(assert (=> b!250222 (= e!173437 (array_inv!5728 (buf!6480 thiss!1005)))))

(declare-fun b!250223 () Bool)

(declare-datatypes ((tuple2!21476 0))(
  ( (tuple2!21477 (_1!11663 BitStream!10896) (_2!11663 Bool)) )
))
(declare-fun lt!388797 () tuple2!21476)

(declare-datatypes ((tuple2!21478 0))(
  ( (tuple2!21479 (_1!11664 BitStream!10896) (_2!11664 BitStream!10896)) )
))
(declare-fun lt!388793 () tuple2!21478)

(assert (=> b!250223 (= e!173442 (not (or (not (_2!11663 lt!388797)) (not (= (_1!11663 lt!388797) (_2!11664 lt!388793))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10896 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21476)

(assert (=> b!250223 (= lt!388797 (checkBitsLoopPure!0 (_1!11664 lt!388793) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!388794 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250223 (validate_offset_bits!1 ((_ sign_extend 32) (size!5987 (buf!6480 (_2!11662 lt!388795)))) ((_ sign_extend 32) (currentByte!11911 (_2!11662 lt!388801))) ((_ sign_extend 32) (currentBit!11906 (_2!11662 lt!388801))) lt!388794)))

(declare-fun lt!388799 () Unit!18110)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10896 array!13647 (_ BitVec 64)) Unit!18110)

(assert (=> b!250223 (= lt!388799 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11662 lt!388801) (buf!6480 (_2!11662 lt!388795)) lt!388794))))

(declare-fun reader!0 (BitStream!10896 BitStream!10896) tuple2!21478)

(assert (=> b!250223 (= lt!388793 (reader!0 (_2!11662 lt!388801) (_2!11662 lt!388795)))))

(declare-fun b!250224 () Bool)

(declare-fun e!173438 () Bool)

(declare-fun e!173436 () Bool)

(assert (=> b!250224 (= e!173438 e!173436)))

(declare-fun res!209465 () Bool)

(assert (=> b!250224 (=> (not res!209465) (not e!173436))))

(declare-fun lt!388796 () (_ BitVec 64))

(declare-fun lt!388800 () (_ BitVec 64))

(assert (=> b!250224 (= res!209465 (= lt!388796 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388800)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250224 (= lt!388796 (bitIndex!0 (size!5987 (buf!6480 (_2!11662 lt!388801))) (currentByte!11911 (_2!11662 lt!388801)) (currentBit!11906 (_2!11662 lt!388801))))))

(assert (=> b!250224 (= lt!388800 (bitIndex!0 (size!5987 (buf!6480 thiss!1005)) (currentByte!11911 thiss!1005) (currentBit!11906 thiss!1005)))))

(declare-fun b!250225 () Bool)

(declare-fun res!209460 () Bool)

(declare-fun e!173444 () Bool)

(assert (=> b!250225 (=> (not res!209460) (not e!173444))))

(assert (=> b!250225 (= res!209460 (validate_offset_bits!1 ((_ sign_extend 32) (size!5987 (buf!6480 thiss!1005))) ((_ sign_extend 32) (currentByte!11911 thiss!1005)) ((_ sign_extend 32) (currentBit!11906 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250226 () Bool)

(declare-fun e!173439 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250226 (= e!173439 (invariant!0 (currentBit!11906 thiss!1005) (currentByte!11911 thiss!1005) (size!5987 (buf!6480 (_2!11662 lt!388801)))))))

(declare-fun b!250227 () Bool)

(declare-fun e!173441 () Bool)

(assert (=> b!250227 (= e!173441 e!173442)))

(declare-fun res!209464 () Bool)

(assert (=> b!250227 (=> (not res!209464) (not e!173442))))

(assert (=> b!250227 (= res!209464 (= (bitIndex!0 (size!5987 (buf!6480 (_2!11662 lt!388795))) (currentByte!11911 (_2!11662 lt!388795)) (currentBit!11906 (_2!11662 lt!388795))) (bvadd (bitIndex!0 (size!5987 (buf!6480 (_2!11662 lt!388801))) (currentByte!11911 (_2!11662 lt!388801)) (currentBit!11906 (_2!11662 lt!388801))) lt!388794)))))

(assert (=> b!250227 (= lt!388794 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250228 () Bool)

(declare-fun res!209467 () Bool)

(assert (=> b!250228 (=> (not res!209467) (not e!173436))))

(assert (=> b!250228 (= res!209467 (isPrefixOf!0 thiss!1005 (_2!11662 lt!388801)))))

(declare-fun b!250229 () Bool)

(declare-fun res!209459 () Bool)

(assert (=> b!250229 (=> (not res!209459) (not e!173444))))

(assert (=> b!250229 (= res!209459 (bvslt from!289 nBits!297))))

(declare-fun res!209462 () Bool)

(assert (=> start!53738 (=> (not res!209462) (not e!173444))))

(assert (=> start!53738 (= res!209462 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53738 e!173444))

(assert (=> start!53738 true))

(declare-fun inv!12 (BitStream!10896) Bool)

(assert (=> start!53738 (and (inv!12 thiss!1005) e!173437)))

(declare-fun b!250230 () Bool)

(declare-fun e!173440 () Bool)

(assert (=> b!250230 (= e!173436 e!173440)))

(declare-fun res!209463 () Bool)

(assert (=> b!250230 (=> (not res!209463) (not e!173440))))

(declare-fun lt!388798 () tuple2!21476)

(assert (=> b!250230 (= res!209463 (and (= (_2!11663 lt!388798) bit!26) (= (_1!11663 lt!388798) (_2!11662 lt!388801))))))

(declare-fun readBitPure!0 (BitStream!10896) tuple2!21476)

(declare-fun readerFrom!0 (BitStream!10896 (_ BitVec 32) (_ BitVec 32)) BitStream!10896)

(assert (=> b!250230 (= lt!388798 (readBitPure!0 (readerFrom!0 (_2!11662 lt!388801) (currentBit!11906 thiss!1005) (currentByte!11911 thiss!1005))))))

(declare-fun b!250231 () Bool)

(assert (=> b!250231 (= e!173440 (= (bitIndex!0 (size!5987 (buf!6480 (_1!11663 lt!388798))) (currentByte!11911 (_1!11663 lt!388798)) (currentBit!11906 (_1!11663 lt!388798))) lt!388796))))

(declare-fun b!250232 () Bool)

(assert (=> b!250232 (= e!173444 (not true))))

(assert (=> b!250232 e!173439))

(declare-fun res!209461 () Bool)

(assert (=> b!250232 (=> (not res!209461) (not e!173439))))

(assert (=> b!250232 (= res!209461 (isPrefixOf!0 thiss!1005 (_2!11662 lt!388795)))))

(declare-fun lt!388803 () Unit!18110)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10896 BitStream!10896 BitStream!10896) Unit!18110)

(assert (=> b!250232 (= lt!388803 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11662 lt!388801) (_2!11662 lt!388795)))))

(assert (=> b!250232 e!173441))

(declare-fun res!209468 () Bool)

(assert (=> b!250232 (=> (not res!209468) (not e!173441))))

(assert (=> b!250232 (= res!209468 (= (size!5987 (buf!6480 (_2!11662 lt!388801))) (size!5987 (buf!6480 (_2!11662 lt!388795)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10896 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21474)

(assert (=> b!250232 (= lt!388795 (appendNBitsLoop!0 (_2!11662 lt!388801) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250232 (validate_offset_bits!1 ((_ sign_extend 32) (size!5987 (buf!6480 (_2!11662 lt!388801)))) ((_ sign_extend 32) (currentByte!11911 (_2!11662 lt!388801))) ((_ sign_extend 32) (currentBit!11906 (_2!11662 lt!388801))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388802 () Unit!18110)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10896 BitStream!10896 (_ BitVec 64) (_ BitVec 64)) Unit!18110)

(assert (=> b!250232 (= lt!388802 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11662 lt!388801) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!250232 e!173438))

(declare-fun res!209466 () Bool)

(assert (=> b!250232 (=> (not res!209466) (not e!173438))))

(assert (=> b!250232 (= res!209466 (= (size!5987 (buf!6480 thiss!1005)) (size!5987 (buf!6480 (_2!11662 lt!388801)))))))

(declare-fun appendBit!0 (BitStream!10896 Bool) tuple2!21474)

(assert (=> b!250232 (= lt!388801 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!53738 res!209462) b!250225))

(assert (= (and b!250225 res!209460) b!250229))

(assert (= (and b!250229 res!209459) b!250232))

(assert (= (and b!250232 res!209466) b!250224))

(assert (= (and b!250224 res!209465) b!250228))

(assert (= (and b!250228 res!209467) b!250230))

(assert (= (and b!250230 res!209463) b!250231))

(assert (= (and b!250232 res!209468) b!250227))

(assert (= (and b!250227 res!209464) b!250221))

(assert (= (and b!250221 res!209469) b!250223))

(assert (= (and b!250232 res!209461) b!250226))

(assert (= start!53738 b!250222))

(declare-fun m!376655 () Bool)

(assert (=> start!53738 m!376655))

(declare-fun m!376657 () Bool)

(assert (=> b!250221 m!376657))

(declare-fun m!376659 () Bool)

(assert (=> b!250230 m!376659))

(assert (=> b!250230 m!376659))

(declare-fun m!376661 () Bool)

(assert (=> b!250230 m!376661))

(declare-fun m!376663 () Bool)

(assert (=> b!250225 m!376663))

(declare-fun m!376665 () Bool)

(assert (=> b!250224 m!376665))

(declare-fun m!376667 () Bool)

(assert (=> b!250224 m!376667))

(declare-fun m!376669 () Bool)

(assert (=> b!250227 m!376669))

(assert (=> b!250227 m!376665))

(declare-fun m!376671 () Bool)

(assert (=> b!250223 m!376671))

(declare-fun m!376673 () Bool)

(assert (=> b!250223 m!376673))

(declare-fun m!376675 () Bool)

(assert (=> b!250223 m!376675))

(declare-fun m!376677 () Bool)

(assert (=> b!250223 m!376677))

(declare-fun m!376679 () Bool)

(assert (=> b!250226 m!376679))

(declare-fun m!376681 () Bool)

(assert (=> b!250228 m!376681))

(declare-fun m!376683 () Bool)

(assert (=> b!250232 m!376683))

(declare-fun m!376685 () Bool)

(assert (=> b!250232 m!376685))

(declare-fun m!376687 () Bool)

(assert (=> b!250232 m!376687))

(declare-fun m!376689 () Bool)

(assert (=> b!250232 m!376689))

(declare-fun m!376691 () Bool)

(assert (=> b!250232 m!376691))

(declare-fun m!376693 () Bool)

(assert (=> b!250232 m!376693))

(declare-fun m!376695 () Bool)

(assert (=> b!250231 m!376695))

(declare-fun m!376697 () Bool)

(assert (=> b!250222 m!376697))

(check-sat (not b!250225) (not start!53738) (not b!250221) (not b!250232) (not b!250224) (not b!250230) (not b!250222) (not b!250227) (not b!250223) (not b!250231) (not b!250228) (not b!250226))
