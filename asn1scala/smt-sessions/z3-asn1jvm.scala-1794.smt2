; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48878 () Bool)

(assert start!48878)

(declare-fun b!231227 () Bool)

(declare-fun e!158978 () Bool)

(declare-datatypes ((array!11847 0))(
  ( (array!11848 (arr!6176 (Array (_ BitVec 32) (_ BitVec 8))) (size!5189 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9474 0))(
  ( (BitStream!9475 (buf!5730 array!11847) (currentByte!10737 (_ BitVec 32)) (currentBit!10732 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9474)

(declare-fun array_inv!4930 (array!11847) Bool)

(assert (=> b!231227 (= e!158978 (array_inv!4930 (buf!5730 b1!101)))))

(declare-fun b!231228 () Bool)

(declare-fun res!193707 () Bool)

(declare-fun e!158976 () Bool)

(assert (=> b!231228 (=> (not res!193707) (not e!158976))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231228 (= res!193707 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5189 (buf!5730 b1!101))) ((_ sign_extend 32) (currentByte!10737 b1!101)) ((_ sign_extend 32) (currentBit!10732 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231229 () Bool)

(declare-fun e!158977 () Bool)

(assert (=> b!231229 (= e!158977 e!158976)))

(declare-fun res!193703 () Bool)

(assert (=> b!231229 (=> (not res!193703) (not e!158976))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368622 () (_ BitVec 64))

(assert (=> b!231229 (= res!193703 (and (bvsle bits!86 lt!368622) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9474)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231229 (= lt!368622 (bitIndex!0 (size!5189 (buf!5730 b2!99)) (currentByte!10737 b2!99) (currentBit!10732 b2!99)))))

(declare-fun b!231230 () Bool)

(declare-fun e!158979 () Bool)

(assert (=> b!231230 (= e!158979 (array_inv!4930 (buf!5730 b2!99)))))

(declare-fun b!231231 () Bool)

(declare-fun res!193704 () Bool)

(assert (=> b!231231 (=> (not res!193704) (not e!158976))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231231 (= res!193704 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5189 (buf!5730 b1!101))) ((_ sign_extend 32) (currentByte!10737 b1!101)) ((_ sign_extend 32) (currentBit!10732 b1!101)) bytes!19))))

(declare-fun res!193705 () Bool)

(assert (=> start!48878 (=> (not res!193705) (not e!158977))))

(assert (=> start!48878 (= res!193705 (and (= (size!5189 (buf!5730 b1!101)) (size!5189 (buf!5730 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48878 e!158977))

(declare-fun inv!12 (BitStream!9474) Bool)

(assert (=> start!48878 (and (inv!12 b1!101) e!158978)))

(assert (=> start!48878 (and (inv!12 b2!99) e!158979)))

(assert (=> start!48878 true))

(declare-fun b!231232 () Bool)

(assert (=> b!231232 (= e!158976 (and (not (= ((_ sign_extend 32) (size!5189 (buf!5730 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5189 (buf!5730 b1!101)))) ((_ sign_extend 32) (size!5189 (buf!5730 b1!101))))))))))

(declare-fun b!231233 () Bool)

(declare-fun res!193706 () Bool)

(assert (=> b!231233 (=> (not res!193706) (not e!158976))))

(assert (=> b!231233 (= res!193706 (= lt!368622 (bvadd (bitIndex!0 (size!5189 (buf!5730 b1!101)) (currentByte!10737 b1!101) (currentBit!10732 b1!101)) bits!86)))))

(assert (= (and start!48878 res!193705) b!231229))

(assert (= (and b!231229 res!193703) b!231231))

(assert (= (and b!231231 res!193704) b!231233))

(assert (= (and b!231233 res!193706) b!231228))

(assert (= (and b!231228 res!193707) b!231232))

(assert (= start!48878 b!231227))

(assert (= start!48878 b!231230))

(declare-fun m!354399 () Bool)

(assert (=> b!231230 m!354399))

(declare-fun m!354401 () Bool)

(assert (=> b!231233 m!354401))

(declare-fun m!354403 () Bool)

(assert (=> b!231227 m!354403))

(declare-fun m!354405 () Bool)

(assert (=> b!231229 m!354405))

(declare-fun m!354407 () Bool)

(assert (=> b!231231 m!354407))

(declare-fun m!354409 () Bool)

(assert (=> start!48878 m!354409))

(declare-fun m!354411 () Bool)

(assert (=> start!48878 m!354411))

(declare-fun m!354413 () Bool)

(assert (=> b!231228 m!354413))

(check-sat (not b!231228) (not b!231229) (not b!231227) (not start!48878) (not b!231230) (not b!231231) (not b!231233))
(check-sat)
