; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57584 () Bool)

(assert start!57584)

(declare-fun res!220855 () Bool)

(declare-fun e!184323 () Bool)

(assert (=> start!57584 (=> (not res!220855) (not e!184323))))

(declare-datatypes ((array!14737 0))(
  ( (array!14738 (arr!7418 (Array (_ BitVec 32) (_ BitVec 8))) (size!6431 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11676 0))(
  ( (BitStream!11677 (buf!6899 array!14737) (currentByte!12763 (_ BitVec 32)) (currentBit!12758 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11676)

(declare-fun w2!580 () BitStream!11676)

(declare-fun isPrefixOf!0 (BitStream!11676 BitStream!11676) Bool)

(assert (=> start!57584 (= res!220855 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57584 e!184323))

(declare-fun e!184321 () Bool)

(declare-fun inv!12 (BitStream!11676) Bool)

(assert (=> start!57584 (and (inv!12 w1!584) e!184321)))

(declare-fun e!184326 () Bool)

(assert (=> start!57584 (and (inv!12 w2!580) e!184326)))

(declare-fun b!264143 () Bool)

(declare-fun e!184318 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14737 array!14737 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264143 (= e!184318 (not (arrayBitRangesEq!0 (buf!6899 w1!584) (buf!6899 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6431 (buf!6899 w1!584)) (currentByte!12763 w1!584) (currentBit!12758 w1!584)))))))

(declare-fun b!264144 () Bool)

(declare-fun e!184324 () Bool)

(assert (=> b!264144 (= e!184324 (not (arrayBitRangesEq!0 (buf!6899 w2!580) (buf!6899 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6431 (buf!6899 w1!584)) (currentByte!12763 w1!584) (currentBit!12758 w1!584)))))))

(declare-fun b!264145 () Bool)

(declare-datatypes ((Unit!18824 0))(
  ( (Unit!18825) )
))
(declare-fun e!184317 () Unit!18824)

(declare-fun Unit!18826 () Unit!18824)

(assert (=> b!264145 (= e!184317 Unit!18826)))

(declare-fun b!264146 () Bool)

(declare-fun lt!405490 () Unit!18824)

(assert (=> b!264146 (= e!184317 lt!405490)))

(declare-fun lt!405489 () (_ BitVec 64))

(assert (=> b!264146 (= lt!405489 (bitIndex!0 (size!6431 (buf!6899 w1!584)) (currentByte!12763 w1!584) (currentBit!12758 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14737 array!14737 (_ BitVec 64) (_ BitVec 64)) Unit!18824)

(assert (=> b!264146 (= lt!405490 (arrayBitRangesEqSymmetric!0 (buf!6899 w1!584) (buf!6899 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405489))))

(assert (=> b!264146 (arrayBitRangesEq!0 (buf!6899 w2!580) (buf!6899 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405489)))

(declare-fun b!264147 () Bool)

(declare-fun e!184325 () Bool)

(assert (=> b!264147 (= e!184325 true)))

(declare-fun lt!405491 () BitStream!11676)

(assert (=> b!264147 (isPrefixOf!0 lt!405491 w2!580)))

(declare-fun lt!405484 () Unit!18824)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11676 BitStream!11676 BitStream!11676) Unit!18824)

(assert (=> b!264147 (= lt!405484 (lemmaIsPrefixTransitive!0 lt!405491 w1!584 w2!580))))

(declare-fun b!264148 () Bool)

(declare-fun res!220850 () Bool)

(assert (=> b!264148 (=> res!220850 e!184325)))

(assert (=> b!264148 (= res!220850 (not (isPrefixOf!0 lt!405491 w1!584)))))

(declare-fun b!264149 () Bool)

(declare-fun e!184319 () Bool)

(assert (=> b!264149 (= e!184323 (not e!184319))))

(declare-fun res!220853 () Bool)

(assert (=> b!264149 (=> res!220853 e!184319)))

(assert (=> b!264149 (= res!220853 e!184318)))

(declare-fun res!220851 () Bool)

(assert (=> b!264149 (=> (not res!220851) (not e!184318))))

(assert (=> b!264149 (= res!220851 (not (= (size!6431 (buf!6899 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264149 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405485 () Unit!18824)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11676) Unit!18824)

(assert (=> b!264149 (= lt!405485 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264149 (isPrefixOf!0 lt!405491 lt!405491)))

(declare-fun lt!405488 () Unit!18824)

(assert (=> b!264149 (= lt!405488 (lemmaIsPrefixRefl!0 lt!405491))))

(assert (=> b!264149 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405487 () Unit!18824)

(assert (=> b!264149 (= lt!405487 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264149 (= lt!405491 (BitStream!11677 (buf!6899 w2!580) (currentByte!12763 w1!584) (currentBit!12758 w1!584)))))

(declare-fun b!264150 () Bool)

(declare-fun array_inv!6155 (array!14737) Bool)

(assert (=> b!264150 (= e!184321 (array_inv!6155 (buf!6899 w1!584)))))

(declare-fun b!264151 () Bool)

(assert (=> b!264151 (= e!184319 e!184325)))

(declare-fun res!220854 () Bool)

(assert (=> b!264151 (=> res!220854 e!184325)))

(assert (=> b!264151 (= res!220854 e!184324)))

(declare-fun res!220852 () Bool)

(assert (=> b!264151 (=> (not res!220852) (not e!184324))))

(assert (=> b!264151 (= res!220852 (not (= (size!6431 (buf!6899 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405486 () Unit!18824)

(assert (=> b!264151 (= lt!405486 e!184317)))

(declare-fun c!12099 () Bool)

(assert (=> b!264151 (= c!12099 (not (= (size!6431 (buf!6899 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264152 () Bool)

(assert (=> b!264152 (= e!184326 (array_inv!6155 (buf!6899 w2!580)))))

(assert (= (and start!57584 res!220855) b!264149))

(assert (= (and b!264149 res!220851) b!264143))

(assert (= (and b!264149 (not res!220853)) b!264151))

(assert (= (and b!264151 c!12099) b!264146))

(assert (= (and b!264151 (not c!12099)) b!264145))

(assert (= (and b!264151 res!220852) b!264144))

(assert (= (and b!264151 (not res!220854)) b!264148))

(assert (= (and b!264148 (not res!220850)) b!264147))

(assert (= start!57584 b!264150))

(assert (= start!57584 b!264152))

(declare-fun m!394561 () Bool)

(assert (=> b!264147 m!394561))

(declare-fun m!394563 () Bool)

(assert (=> b!264147 m!394563))

(declare-fun m!394565 () Bool)

(assert (=> b!264146 m!394565))

(declare-fun m!394567 () Bool)

(assert (=> b!264146 m!394567))

(declare-fun m!394569 () Bool)

(assert (=> b!264146 m!394569))

(declare-fun m!394571 () Bool)

(assert (=> start!57584 m!394571))

(declare-fun m!394573 () Bool)

(assert (=> start!57584 m!394573))

(declare-fun m!394575 () Bool)

(assert (=> start!57584 m!394575))

(declare-fun m!394577 () Bool)

(assert (=> b!264148 m!394577))

(declare-fun m!394579 () Bool)

(assert (=> b!264150 m!394579))

(assert (=> b!264143 m!394565))

(assert (=> b!264143 m!394565))

(declare-fun m!394581 () Bool)

(assert (=> b!264143 m!394581))

(declare-fun m!394583 () Bool)

(assert (=> b!264152 m!394583))

(declare-fun m!394585 () Bool)

(assert (=> b!264149 m!394585))

(declare-fun m!394587 () Bool)

(assert (=> b!264149 m!394587))

(declare-fun m!394589 () Bool)

(assert (=> b!264149 m!394589))

(declare-fun m!394591 () Bool)

(assert (=> b!264149 m!394591))

(declare-fun m!394593 () Bool)

(assert (=> b!264149 m!394593))

(declare-fun m!394595 () Bool)

(assert (=> b!264149 m!394595))

(assert (=> b!264144 m!394565))

(assert (=> b!264144 m!394565))

(declare-fun m!394597 () Bool)

(assert (=> b!264144 m!394597))

(check-sat (not b!264144) (not b!264147) (not b!264150) (not b!264143) (not start!57584) (not b!264148) (not b!264149) (not b!264146) (not b!264152))
(check-sat)
