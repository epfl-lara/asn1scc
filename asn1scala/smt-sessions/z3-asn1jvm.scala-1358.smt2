; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37640 () Bool)

(assert start!37640)

(declare-fun res!141713 () Bool)

(declare-fun e!119170 () Bool)

(assert (=> start!37640 (=> (not res!141713) (not e!119170))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37640 (= res!141713 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37640 e!119170))

(assert (=> start!37640 true))

(declare-datatypes ((array!9051 0))(
  ( (array!9052 (arr!4937 (Array (_ BitVec 32) (_ BitVec 8))) (size!4007 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7152 0))(
  ( (BitStream!7153 (buf!4450 array!9051) (currentByte!8437 (_ BitVec 32)) (currentBit!8432 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7152)

(declare-fun e!119168 () Bool)

(declare-fun inv!12 (BitStream!7152) Bool)

(assert (=> start!37640 (and (inv!12 bs!64) e!119168)))

(declare-fun b!170779 () Bool)

(declare-fun res!141714 () Bool)

(assert (=> b!170779 (=> (not res!141714) (not e!119170))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170779 (= res!141714 (validate_offset_bits!1 ((_ sign_extend 32) (size!4007 (buf!4450 bs!64))) ((_ sign_extend 32) (currentByte!8437 bs!64)) ((_ sign_extend 32) (currentBit!8432 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170780 () Bool)

(assert (=> b!170780 (= e!119170 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283))))

(declare-fun b!170781 () Bool)

(declare-fun array_inv!3748 (array!9051) Bool)

(assert (=> b!170781 (= e!119168 (array_inv!3748 (buf!4450 bs!64)))))

(assert (= (and start!37640 res!141713) b!170779))

(assert (= (and b!170779 res!141714) b!170780))

(assert (= start!37640 b!170781))

(declare-fun m!269929 () Bool)

(assert (=> start!37640 m!269929))

(declare-fun m!269931 () Bool)

(assert (=> b!170779 m!269931))

(declare-fun m!269933 () Bool)

(assert (=> b!170781 m!269933))

(check-sat (not b!170779) (not start!37640) (not b!170781))
(check-sat)
