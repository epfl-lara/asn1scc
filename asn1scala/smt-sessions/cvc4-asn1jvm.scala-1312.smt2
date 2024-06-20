; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37274 () Bool)

(assert start!37274)

(declare-fun b!169298 () Bool)

(declare-fun e!117836 () Bool)

(assert (=> b!169298 (= e!117836 false)))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8929 0))(
  ( (array!8930 (arr!4875 (Array (_ BitVec 32) (_ BitVec 8))) (size!3951 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8929)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun arr1!28 () array!8929)

(declare-datatypes ((Unit!11823 0))(
  ( (Unit!11824) )
))
(declare-fun lt!262201 () Unit!11823)

(declare-datatypes ((BitStream!7058 0))(
  ( (BitStream!7059 (buf!4403 array!8929) (currentByte!8387 (_ BitVec 32)) (currentBit!8382 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7058)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7058 array!8929 array!8929 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11823)

(assert (=> b!169298 (= lt!262201 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!140751 () Bool)

(assert (=> start!37274 (=> (not res!140751) (not e!117836))))

(assert (=> start!37274 (= res!140751 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3951 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3951 arr2!28))))))))

(assert (=> start!37274 e!117836))

(assert (=> start!37274 true))

(declare-fun array_inv!3692 (array!8929) Bool)

(assert (=> start!37274 (array_inv!3692 arr2!28)))

(assert (=> start!37274 (array_inv!3692 arr1!28)))

(declare-fun e!117835 () Bool)

(declare-fun inv!12 (BitStream!7058) Bool)

(assert (=> start!37274 (and (inv!12 thiss!1565) e!117835)))

(declare-fun b!169296 () Bool)

(declare-fun res!140753 () Bool)

(assert (=> b!169296 (=> (not res!140753) (not e!117836))))

(declare-datatypes ((List!916 0))(
  ( (Nil!913) (Cons!912 (h!1031 Bool) (t!1735 List!916)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7058 array!8929 (_ BitVec 64) (_ BitVec 64)) List!916)

(assert (=> b!169296 (= res!140753 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169297 () Bool)

(declare-fun res!140752 () Bool)

(assert (=> b!169297 (=> (not res!140752) (not e!117836))))

(assert (=> b!169297 (= res!140752 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169299 () Bool)

(assert (=> b!169299 (= e!117835 (array_inv!3692 (buf!4403 thiss!1565)))))

(assert (= (and start!37274 res!140751) b!169296))

(assert (= (and b!169296 res!140753) b!169297))

(assert (= (and b!169297 res!140752) b!169298))

(assert (= start!37274 b!169299))

(declare-fun m!268939 () Bool)

(assert (=> b!169298 m!268939))

(declare-fun m!268941 () Bool)

(assert (=> start!37274 m!268941))

(declare-fun m!268943 () Bool)

(assert (=> start!37274 m!268943))

(declare-fun m!268945 () Bool)

(assert (=> start!37274 m!268945))

(declare-fun m!268947 () Bool)

(assert (=> b!169296 m!268947))

(declare-fun m!268949 () Bool)

(assert (=> b!169296 m!268949))

(declare-fun m!268951 () Bool)

(assert (=> b!169299 m!268951))

(push 1)

(assert (not b!169299))

(assert (not b!169296))

(assert (not b!169298))

