; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31858 () Bool)

(assert start!31858)

(declare-fun res!132479 () Bool)

(declare-fun e!107946 () Bool)

(assert (=> start!31858 (=> (not res!132479) (not e!107946))))

(declare-datatypes ((array!7427 0))(
  ( (array!7428 (arr!4288 (Array (_ BitVec 32) (_ BitVec 8))) (size!3367 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5902 0))(
  ( (BitStream!5903 (buf!3825 array!7427) (currentByte!7031 (_ BitVec 32)) (currentBit!7026 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5902)

(declare-fun buf!77 () array!7427)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31858 (= res!132479 (and (= (size!3367 (buf!3825 b1!99)) (size!3367 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31858 e!107946))

(declare-fun e!107949 () Bool)

(declare-fun inv!12 (BitStream!5902) Bool)

(assert (=> start!31858 (and (inv!12 b1!99) e!107949)))

(declare-fun array_inv!3114 (array!7427) Bool)

(assert (=> start!31858 (array_inv!3114 buf!77)))

(assert (=> start!31858 true))

(declare-fun b!158629 () Bool)

(declare-fun res!132478 () Bool)

(assert (=> b!158629 (=> (not res!132478) (not e!107946))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158629 (= res!132478 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3367 (buf!3825 b1!99))) ((_ sign_extend 32) (currentByte!7031 b1!99)) ((_ sign_extend 32) (currentBit!7026 b1!99)) bytes!14))))

(declare-fun b!158630 () Bool)

(assert (=> b!158630 (= e!107946 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3367 buf!77)) ((_ sign_extend 32) (currentByte!7031 b1!99)) ((_ sign_extend 32) (currentBit!7026 b1!99)) bytes!14)))))

(declare-fun b!158631 () Bool)

(assert (=> b!158631 (= e!107949 (array_inv!3114 (buf!3825 b1!99)))))

(assert (= (and start!31858 res!132479) b!158629))

(assert (= (and b!158629 res!132478) b!158630))

(assert (= start!31858 b!158631))

(declare-fun m!249155 () Bool)

(assert (=> start!31858 m!249155))

(declare-fun m!249157 () Bool)

(assert (=> start!31858 m!249157))

(declare-fun m!249159 () Bool)

(assert (=> b!158629 m!249159))

(declare-fun m!249161 () Bool)

(assert (=> b!158630 m!249161))

(declare-fun m!249163 () Bool)

(assert (=> b!158631 m!249163))

(push 1)

(assert (not b!158631))

(assert (not start!31858))

(assert (not b!158630))

(assert (not b!158629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

