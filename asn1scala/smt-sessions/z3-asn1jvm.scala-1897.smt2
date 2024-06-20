; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49678 () Bool)

(assert start!49678)

(declare-fun res!195996 () Bool)

(declare-fun e!162000 () Bool)

(assert (=> start!49678 (=> (not res!195996) (not e!162000))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!49678 (= res!195996 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49678 e!162000))

(assert (=> start!49678 true))

(declare-datatypes ((array!12274 0))(
  ( (array!12275 (arr!6380 (Array (_ BitVec 32) (_ BitVec 8))) (size!5393 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9750 0))(
  ( (BitStream!9751 (buf!5868 array!12274) (currentByte!10923 (_ BitVec 32)) (currentBit!10918 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9750)

(declare-fun e!162002 () Bool)

(declare-fun inv!12 (BitStream!9750) Bool)

(assert (=> start!49678 (and (inv!12 bs!63) e!162002)))

(declare-fun b!234342 () Bool)

(declare-fun res!195995 () Bool)

(assert (=> b!234342 (=> (not res!195995) (not e!162000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234342 (= res!195995 (validate_offset_bits!1 ((_ sign_extend 32) (size!5393 (buf!5868 bs!63))) ((_ sign_extend 32) (currentByte!10923 bs!63)) ((_ sign_extend 32) (currentBit!10918 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234343 () Bool)

(assert (=> b!234343 (= e!162000 (or (bvsgt #b00000000000000000000000000000000 (bvsub nBits!274 i!546)) (bvsgt (bvsub nBits!274 i!546) #b00000000000000000000000001000000)))))

(declare-fun b!234344 () Bool)

(declare-fun array_inv!5134 (array!12274) Bool)

(assert (=> b!234344 (= e!162002 (array_inv!5134 (buf!5868 bs!63)))))

(assert (= (and start!49678 res!195996) b!234342))

(assert (= (and b!234342 res!195995) b!234343))

(assert (= start!49678 b!234344))

(declare-fun m!356977 () Bool)

(assert (=> start!49678 m!356977))

(declare-fun m!356979 () Bool)

(assert (=> b!234342 m!356979))

(declare-fun m!356981 () Bool)

(assert (=> b!234344 m!356981))

(check-sat (not start!49678) (not b!234344) (not b!234342))
(check-sat)
