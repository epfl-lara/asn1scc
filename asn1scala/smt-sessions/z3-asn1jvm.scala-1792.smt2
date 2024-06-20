; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48866 () Bool)

(assert start!48866)

(declare-fun b!231114 () Bool)

(declare-fun e!158881 () Bool)

(declare-datatypes ((array!11835 0))(
  ( (array!11836 (arr!6170 (Array (_ BitVec 32) (_ BitVec 8))) (size!5183 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9462 0))(
  ( (BitStream!9463 (buf!5724 array!11835) (currentByte!10731 (_ BitVec 32)) (currentBit!10726 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9462)

(declare-fun array_inv!4924 (array!11835) Bool)

(assert (=> b!231114 (= e!158881 (array_inv!4924 (buf!5724 b1!101)))))

(declare-fun b!231115 () Bool)

(declare-fun res!193629 () Bool)

(declare-fun e!158884 () Bool)

(assert (=> b!231115 (=> (not res!193629) (not e!158884))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9462)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231115 (= res!193629 (bvsle bits!86 (bitIndex!0 (size!5183 (buf!5724 b2!99)) (currentByte!10731 b2!99) (currentBit!10726 b2!99))))))

(declare-fun res!193627 () Bool)

(assert (=> start!48866 (=> (not res!193627) (not e!158884))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48866 (= res!193627 (and (= (size!5183 (buf!5724 b1!101)) (size!5183 (buf!5724 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48866 e!158884))

(declare-fun inv!12 (BitStream!9462) Bool)

(assert (=> start!48866 (and (inv!12 b1!101) e!158881)))

(declare-fun e!158882 () Bool)

(assert (=> start!48866 (and (inv!12 b2!99) e!158882)))

(assert (=> start!48866 true))

(declare-fun b!231116 () Bool)

(declare-fun res!193626 () Bool)

(assert (=> b!231116 (=> (not res!193626) (not e!158884))))

(assert (=> b!231116 (= res!193626 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231117 () Bool)

(assert (=> b!231117 (= e!158884 false)))

(declare-fun lt!368604 () (_ BitVec 64))

(assert (=> b!231117 (= lt!368604 (bitIndex!0 (size!5183 (buf!5724 b1!101)) (currentByte!10731 b1!101) (currentBit!10726 b1!101)))))

(declare-fun b!231118 () Bool)

(assert (=> b!231118 (= e!158882 (array_inv!4924 (buf!5724 b2!99)))))

(declare-fun b!231119 () Bool)

(declare-fun res!193628 () Bool)

(assert (=> b!231119 (=> (not res!193628) (not e!158884))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231119 (= res!193628 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5183 (buf!5724 b1!101))) ((_ sign_extend 32) (currentByte!10731 b1!101)) ((_ sign_extend 32) (currentBit!10726 b1!101)) bytes!19))))

(assert (= (and start!48866 res!193627) b!231115))

(assert (= (and b!231115 res!193629) b!231116))

(assert (= (and b!231116 res!193626) b!231119))

(assert (= (and b!231119 res!193628) b!231117))

(assert (= start!48866 b!231114))

(assert (= start!48866 b!231118))

(declare-fun m!354313 () Bool)

(assert (=> start!48866 m!354313))

(declare-fun m!354315 () Bool)

(assert (=> start!48866 m!354315))

(declare-fun m!354317 () Bool)

(assert (=> b!231118 m!354317))

(declare-fun m!354319 () Bool)

(assert (=> b!231119 m!354319))

(declare-fun m!354321 () Bool)

(assert (=> b!231114 m!354321))

(declare-fun m!354323 () Bool)

(assert (=> b!231117 m!354323))

(declare-fun m!354325 () Bool)

(assert (=> b!231115 m!354325))

(check-sat (not b!231118) (not start!48866) (not b!231115) (not b!231117) (not b!231114) (not b!231119))
