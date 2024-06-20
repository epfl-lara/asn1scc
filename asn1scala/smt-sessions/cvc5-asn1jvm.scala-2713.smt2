; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66478 () Bool)

(assert start!66478)

(declare-fun b!297841 () Bool)

(declare-fun res!245807 () Bool)

(declare-fun e!213278 () Bool)

(assert (=> b!297841 (=> res!245807 e!213278)))

(declare-datatypes ((array!17837 0))(
  ( (array!17838 (arr!8809 (Array (_ BitVec 32) (_ BitVec 8))) (size!7729 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13462 0))(
  ( (BitStream!13463 (buf!7792 array!17837) (currentByte!14346 (_ BitVec 32)) (currentBit!14341 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13462)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297841 (= res!245807 (not (invariant!0 (currentBit!14341 thiss!1728) (currentByte!14346 thiss!1728) (size!7729 (buf!7792 thiss!1728)))))))

(declare-fun b!297842 () Bool)

(declare-fun res!245810 () Bool)

(declare-fun e!213281 () Bool)

(assert (=> b!297842 (=> (not res!245810) (not e!213281))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297842 (= res!245810 (bvsge from!505 to!474))))

(declare-fun b!297843 () Bool)

(declare-fun e!213282 () Bool)

(declare-fun array_inv!7341 (array!17837) Bool)

(assert (=> b!297843 (= e!213282 (array_inv!7341 (buf!7792 thiss!1728)))))

(declare-fun res!245806 () Bool)

(assert (=> start!66478 (=> (not res!245806) (not e!213281))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17837)

(assert (=> start!66478 (= res!245806 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7729 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66478 e!213281))

(declare-fun inv!12 (BitStream!13462) Bool)

(assert (=> start!66478 (and (inv!12 thiss!1728) e!213282)))

(assert (=> start!66478 true))

(assert (=> start!66478 (array_inv!7341 arr!273)))

(declare-fun b!297844 () Bool)

(assert (=> b!297844 (= e!213281 (not e!213278))))

(declare-fun res!245808 () Bool)

(assert (=> b!297844 (=> res!245808 e!213278)))

(declare-fun lt!434076 () (_ BitVec 64))

(assert (=> b!297844 (= res!245808 (not (= (bvsub (bvadd lt!434076 to!474) from!505) lt!434076)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297844 (= lt!434076 (bitIndex!0 (size!7729 (buf!7792 thiss!1728)) (currentByte!14346 thiss!1728) (currentBit!14341 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17837 array!17837 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297844 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20779 0))(
  ( (Unit!20780) )
))
(declare-fun lt!434079 () Unit!20779)

(declare-fun lt!434078 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17837 array!17837 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20779)

(assert (=> b!297844 (= lt!434079 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434078 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297844 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434078)))

(assert (=> b!297844 (= lt!434078 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7729 arr!273))))))

(declare-fun lt!434077 () Unit!20779)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17837) Unit!20779)

(assert (=> b!297844 (= lt!434077 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297845 () Bool)

(assert (=> b!297845 (= e!213278 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!297846 () Bool)

(declare-fun res!245809 () Bool)

(assert (=> b!297846 (=> (not res!245809) (not e!213281))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297846 (= res!245809 (validate_offset_bits!1 ((_ sign_extend 32) (size!7729 (buf!7792 thiss!1728))) ((_ sign_extend 32) (currentByte!14346 thiss!1728)) ((_ sign_extend 32) (currentBit!14341 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66478 res!245806) b!297846))

(assert (= (and b!297846 res!245809) b!297842))

(assert (= (and b!297842 res!245810) b!297844))

(assert (= (and b!297844 (not res!245808)) b!297841))

(assert (= (and b!297841 (not res!245807)) b!297845))

(assert (= start!66478 b!297843))

(declare-fun m!436681 () Bool)

(assert (=> b!297844 m!436681))

(declare-fun m!436683 () Bool)

(assert (=> b!297844 m!436683))

(declare-fun m!436685 () Bool)

(assert (=> b!297844 m!436685))

(declare-fun m!436687 () Bool)

(assert (=> b!297844 m!436687))

(declare-fun m!436689 () Bool)

(assert (=> b!297844 m!436689))

(declare-fun m!436691 () Bool)

(assert (=> b!297846 m!436691))

(declare-fun m!436693 () Bool)

(assert (=> b!297841 m!436693))

(declare-fun m!436695 () Bool)

(assert (=> start!66478 m!436695))

(declare-fun m!436697 () Bool)

(assert (=> start!66478 m!436697))

(declare-fun m!436699 () Bool)

(assert (=> b!297843 m!436699))

(push 1)

(assert (not b!297844))

(assert (not b!297843))

(assert (not start!66478))

(assert (not b!297841))

(assert (not b!297846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

