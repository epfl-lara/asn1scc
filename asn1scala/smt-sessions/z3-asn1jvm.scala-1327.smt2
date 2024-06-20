; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37362 () Bool)

(assert start!37362)

(declare-fun res!140953 () Bool)

(declare-fun e!118260 () Bool)

(assert (=> start!37362 (=> (not res!140953) (not e!118260))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8999 0))(
  ( (array!9000 (arr!4910 (Array (_ BitVec 32) (_ BitVec 8))) (size!3986 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8999)

(declare-fun arr2!28 () array!8999)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37362 (= res!140953 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3986 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3986 arr2!28))))))))

(assert (=> start!37362 e!118260))

(assert (=> start!37362 true))

(declare-fun array_inv!3727 (array!8999) Bool)

(assert (=> start!37362 (array_inv!3727 arr2!28)))

(assert (=> start!37362 (array_inv!3727 arr1!28)))

(declare-datatypes ((BitStream!7110 0))(
  ( (BitStream!7111 (buf!4429 array!8999) (currentByte!8413 (_ BitVec 32)) (currentBit!8408 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7110)

(declare-fun e!118263 () Bool)

(declare-fun inv!12 (BitStream!7110) Bool)

(assert (=> start!37362 (and (inv!12 thiss!1565) e!118263)))

(declare-fun b!169576 () Bool)

(declare-fun res!140954 () Bool)

(assert (=> b!169576 (=> (not res!140954) (not e!118260))))

(declare-datatypes ((List!942 0))(
  ( (Nil!939) (Cons!938 (h!1057 Bool) (t!1761 List!942)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7110 array!8999 (_ BitVec 64) (_ BitVec 64)) List!942)

(assert (=> b!169576 (= res!140954 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169577 () Bool)

(assert (=> b!169577 (= e!118260 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!499)))))

(declare-fun b!169578 () Bool)

(assert (=> b!169578 (= e!118263 (array_inv!3727 (buf!4429 thiss!1565)))))

(assert (= (and start!37362 res!140953) b!169576))

(assert (= (and b!169576 res!140954) b!169577))

(assert (= start!37362 b!169578))

(declare-fun m!269307 () Bool)

(assert (=> start!37362 m!269307))

(declare-fun m!269309 () Bool)

(assert (=> start!37362 m!269309))

(declare-fun m!269311 () Bool)

(assert (=> start!37362 m!269311))

(declare-fun m!269313 () Bool)

(assert (=> b!169576 m!269313))

(declare-fun m!269315 () Bool)

(assert (=> b!169576 m!269315))

(declare-fun m!269317 () Bool)

(assert (=> b!169578 m!269317))

(check-sat (not b!169578) (not start!37362) (not b!169576))
(check-sat)
