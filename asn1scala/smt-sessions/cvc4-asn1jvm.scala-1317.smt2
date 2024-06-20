; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37304 () Bool)

(assert start!37304)

(declare-fun b!169476 () Bool)

(declare-fun res!140888 () Bool)

(declare-fun e!118061 () Bool)

(assert (=> b!169476 (=> (not res!140888) (not e!118061))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8959 0))(
  ( (array!8960 (arr!4890 (Array (_ BitVec 32) (_ BitVec 8))) (size!3966 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8959)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8959)

(declare-datatypes ((BitStream!7088 0))(
  ( (BitStream!7089 (buf!4418 array!8959) (currentByte!8402 (_ BitVec 32)) (currentBit!8397 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7088)

(declare-datatypes ((List!931 0))(
  ( (Nil!928) (Cons!927 (h!1046 Bool) (t!1750 List!931)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7088 array!8959 (_ BitVec 64) (_ BitVec 64)) List!931)

(assert (=> b!169476 (= res!140888 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169478 () Bool)

(assert (=> b!169478 (= e!118061 false)))

(declare-datatypes ((Unit!11853 0))(
  ( (Unit!11854) )
))
(declare-fun lt!262246 () Unit!11853)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7088 array!8959 array!8959 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11853)

(assert (=> b!169478 (= lt!262246 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169477 () Bool)

(declare-fun res!140886 () Bool)

(assert (=> b!169477 (=> (not res!140886) (not e!118061))))

(assert (=> b!169477 (= res!140886 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140887 () Bool)

(assert (=> start!37304 (=> (not res!140887) (not e!118061))))

(assert (=> start!37304 (= res!140887 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3966 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3966 arr2!28))))))))

(assert (=> start!37304 e!118061))

(assert (=> start!37304 true))

(declare-fun array_inv!3707 (array!8959) Bool)

(assert (=> start!37304 (array_inv!3707 arr2!28)))

(assert (=> start!37304 (array_inv!3707 arr1!28)))

(declare-fun e!118059 () Bool)

(declare-fun inv!12 (BitStream!7088) Bool)

(assert (=> start!37304 (and (inv!12 thiss!1565) e!118059)))

(declare-fun b!169479 () Bool)

(assert (=> b!169479 (= e!118059 (array_inv!3707 (buf!4418 thiss!1565)))))

(assert (= (and start!37304 res!140887) b!169476))

(assert (= (and b!169476 res!140888) b!169477))

(assert (= (and b!169477 res!140886) b!169478))

(assert (= start!37304 b!169479))

(declare-fun m!269149 () Bool)

(assert (=> b!169476 m!269149))

(declare-fun m!269151 () Bool)

(assert (=> b!169476 m!269151))

(declare-fun m!269153 () Bool)

(assert (=> b!169478 m!269153))

(declare-fun m!269155 () Bool)

(assert (=> start!37304 m!269155))

(declare-fun m!269157 () Bool)

(assert (=> start!37304 m!269157))

(declare-fun m!269159 () Bool)

(assert (=> start!37304 m!269159))

(declare-fun m!269161 () Bool)

(assert (=> b!169479 m!269161))

(push 1)

(assert (not b!169476))

(assert (not b!169478))

(assert (not start!37304))

(assert (not b!169479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

