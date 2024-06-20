; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48974 () Bool)

(assert start!48974)

(declare-fun b!232212 () Bool)

(declare-fun e!159819 () Bool)

(declare-datatypes ((array!11943 0))(
  ( (array!11944 (arr!6224 (Array (_ BitVec 32) (_ BitVec 8))) (size!5237 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9570 0))(
  ( (BitStream!9571 (buf!5778 array!11943) (currentByte!10785 (_ BitVec 32)) (currentBit!10780 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9570)

(declare-fun array_inv!4978 (array!11943) Bool)

(assert (=> b!232212 (= e!159819 (array_inv!4978 (buf!5778 b1!101)))))

(declare-fun b!232213 () Bool)

(declare-fun res!194403 () Bool)

(declare-fun e!159818 () Bool)

(assert (=> b!232213 (=> (not res!194403) (not e!159818))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232213 (= res!194403 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5237 (buf!5778 b1!101))) ((_ sign_extend 32) (currentByte!10785 b1!101)) ((_ sign_extend 32) (currentBit!10780 b1!101)) bytes!19))))

(declare-fun b!232214 () Bool)

(declare-fun res!194401 () Bool)

(assert (=> b!232214 (=> (not res!194401) (not e!159818))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!232214 (= res!194401 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232215 () Bool)

(declare-fun e!159820 () Bool)

(declare-fun b2!99 () BitStream!9570)

(assert (=> b!232215 (= e!159820 (array_inv!4978 (buf!5778 b2!99)))))

(declare-fun res!194402 () Bool)

(assert (=> start!48974 (=> (not res!194402) (not e!159818))))

(assert (=> start!48974 (= res!194402 (and (= (size!5237 (buf!5778 b1!101)) (size!5237 (buf!5778 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48974 e!159818))

(declare-fun inv!12 (BitStream!9570) Bool)

(assert (=> start!48974 (and (inv!12 b1!101) e!159819)))

(assert (=> start!48974 (and (inv!12 b2!99) e!159820)))

(assert (=> start!48974 true))

(declare-fun b!232216 () Bool)

(assert (=> b!232216 (= e!159818 false)))

(declare-fun lt!368883 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232216 (= lt!368883 (bitIndex!0 (size!5237 (buf!5778 b1!101)) (currentByte!10785 b1!101) (currentBit!10780 b1!101)))))

(declare-fun b!232217 () Bool)

(declare-fun res!194400 () Bool)

(assert (=> b!232217 (=> (not res!194400) (not e!159818))))

(assert (=> b!232217 (= res!194400 (bvsle bits!86 (bitIndex!0 (size!5237 (buf!5778 b2!99)) (currentByte!10785 b2!99) (currentBit!10780 b2!99))))))

(assert (= (and start!48974 res!194402) b!232217))

(assert (= (and b!232217 res!194400) b!232214))

(assert (= (and b!232214 res!194401) b!232213))

(assert (= (and b!232213 res!194403) b!232216))

(assert (= start!48974 b!232212))

(assert (= start!48974 b!232215))

(declare-fun m!355153 () Bool)

(assert (=> start!48974 m!355153))

(declare-fun m!355155 () Bool)

(assert (=> start!48974 m!355155))

(declare-fun m!355157 () Bool)

(assert (=> b!232217 m!355157))

(declare-fun m!355159 () Bool)

(assert (=> b!232215 m!355159))

(declare-fun m!355161 () Bool)

(assert (=> b!232212 m!355161))

(declare-fun m!355163 () Bool)

(assert (=> b!232213 m!355163))

(declare-fun m!355165 () Bool)

(assert (=> b!232216 m!355165))

(check-sat (not b!232212) (not start!48974) (not b!232217) (not b!232213) (not b!232215) (not b!232216))
