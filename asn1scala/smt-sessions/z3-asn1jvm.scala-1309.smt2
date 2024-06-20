; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37236 () Bool)

(assert start!37236)

(declare-fun res!140666 () Bool)

(declare-fun e!117668 () Bool)

(assert (=> start!37236 (=> (not res!140666) (not e!117668))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8906 0))(
  ( (array!8907 (arr!4862 (Array (_ BitVec 32) (_ BitVec 8))) (size!3941 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8906)

(declare-fun arr2!28 () array!8906)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37236 (= res!140666 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3941 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3941 arr2!28))))))))

(assert (=> start!37236 e!117668))

(assert (=> start!37236 true))

(declare-fun array_inv!3682 (array!8906) Bool)

(assert (=> start!37236 (array_inv!3682 arr2!28)))

(assert (=> start!37236 (array_inv!3682 arr1!28)))

(declare-datatypes ((BitStream!7038 0))(
  ( (BitStream!7039 (buf!4393 array!8906) (currentByte!8377 (_ BitVec 32)) (currentBit!8372 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7038)

(declare-fun e!117669 () Bool)

(declare-fun inv!12 (BitStream!7038) Bool)

(assert (=> start!37236 (and (inv!12 thiss!1565) e!117669)))

(declare-fun b!169144 () Bool)

(declare-fun res!140665 () Bool)

(assert (=> b!169144 (=> (not res!140665) (not e!117668))))

(declare-datatypes ((List!906 0))(
  ( (Nil!903) (Cons!902 (h!1021 Bool) (t!1725 List!906)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7038 array!8906 (_ BitVec 64) (_ BitVec 64)) List!906)

(assert (=> b!169144 (= res!140665 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169145 () Bool)

(assert (=> b!169145 (= e!117668 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169146 () Bool)

(assert (=> b!169146 (= e!117669 (array_inv!3682 (buf!4393 thiss!1565)))))

(assert (= (and start!37236 res!140666) b!169144))

(assert (= (and b!169144 res!140665) b!169145))

(assert (= start!37236 b!169146))

(declare-fun m!268719 () Bool)

(assert (=> start!37236 m!268719))

(declare-fun m!268721 () Bool)

(assert (=> start!37236 m!268721))

(declare-fun m!268723 () Bool)

(assert (=> start!37236 m!268723))

(declare-fun m!268725 () Bool)

(assert (=> b!169144 m!268725))

(declare-fun m!268727 () Bool)

(assert (=> b!169144 m!268727))

(declare-fun m!268729 () Bool)

(assert (=> b!169146 m!268729))

(check-sat (not start!37236) (not b!169146) (not b!169144))
(check-sat)
