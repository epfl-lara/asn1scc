; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61422 () Bool)

(assert start!61422)

(declare-fun b!276144 () Bool)

(declare-fun res!229485 () Bool)

(declare-fun e!196096 () Bool)

(assert (=> b!276144 (=> (not res!229485) (not e!196096))))

(declare-datatypes ((array!15792 0))(
  ( (array!15793 (arr!7832 (Array (_ BitVec 32) (_ BitVec 8))) (size!6839 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12492 0))(
  ( (BitStream!12493 (buf!7307 array!15792) (currentByte!13509 (_ BitVec 32)) (currentBit!13504 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12492)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276144 (= res!229485 (validate_offset_bit!0 ((_ sign_extend 32) (size!6839 (buf!7307 bs1!11))) ((_ sign_extend 32) (currentByte!13509 bs1!11)) ((_ sign_extend 32) (currentBit!13504 bs1!11))))))

(declare-fun b!276146 () Bool)

(declare-fun e!196093 () Bool)

(declare-fun array_inv!6563 (array!15792) Bool)

(assert (=> b!276146 (= e!196093 (array_inv!6563 (buf!7307 bs1!11)))))

(declare-fun b!276145 () Bool)

(assert (=> b!276145 (= e!196096 false)))

(declare-fun lt!414336 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276145 (= lt!414336 (bitIndex!0 (size!6839 (buf!7307 bs1!11)) (currentByte!13509 bs1!11) (currentBit!13504 bs1!11)))))

(declare-fun b!276147 () Bool)

(declare-fun e!196097 () Bool)

(declare-fun bs2!19 () BitStream!12492)

(assert (=> b!276147 (= e!196097 (array_inv!6563 (buf!7307 bs2!19)))))

(declare-fun res!229486 () Bool)

(assert (=> start!61422 (=> (not res!229486) (not e!196096))))

(assert (=> start!61422 (= res!229486 (= (size!6839 (buf!7307 bs1!11)) (size!6839 (buf!7307 bs2!19))))))

(assert (=> start!61422 e!196096))

(declare-fun inv!12 (BitStream!12492) Bool)

(assert (=> start!61422 (and (inv!12 bs1!11) e!196093)))

(assert (=> start!61422 (and (inv!12 bs2!19) e!196097)))

(assert (= (and start!61422 res!229486) b!276144))

(assert (= (and b!276144 res!229485) b!276145))

(assert (= start!61422 b!276146))

(assert (= start!61422 b!276147))

(declare-fun m!409127 () Bool)

(assert (=> b!276146 m!409127))

(declare-fun m!409129 () Bool)

(assert (=> b!276145 m!409129))

(declare-fun m!409131 () Bool)

(assert (=> b!276147 m!409131))

(declare-fun m!409133 () Bool)

(assert (=> b!276144 m!409133))

(declare-fun m!409135 () Bool)

(assert (=> start!61422 m!409135))

(declare-fun m!409137 () Bool)

(assert (=> start!61422 m!409137))

(check-sat (not b!276146) (not b!276144) (not b!276147) (not start!61422) (not b!276145))
