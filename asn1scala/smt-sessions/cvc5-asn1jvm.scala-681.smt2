; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19124 () Bool)

(assert start!19124)

(declare-fun b!95523 () Bool)

(declare-fun res!78620 () Bool)

(declare-fun e!62609 () Bool)

(assert (=> b!95523 (=> (not res!78620) (not e!62609))))

(declare-datatypes ((array!4464 0))(
  ( (array!4465 (arr!2637 (Array (_ BitVec 32) (_ BitVec 8))) (size!2038 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3562 0))(
  ( (BitStream!3563 (buf!2390 array!4464) (currentByte!4768 (_ BitVec 32)) (currentBit!4763 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3562)

(declare-fun bitStream2!8 () BitStream!3562)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95523 (= res!78620 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2038 (buf!2390 bitStream1!8)) (currentByte!4768 bitStream1!8) (currentBit!4763 bitStream1!8))) (bitIndex!0 (size!2038 (buf!2390 bitStream2!8)) (currentByte!4768 bitStream2!8) (currentBit!4763 bitStream2!8))))))

(declare-fun b!95524 () Bool)

(declare-fun e!62610 () Bool)

(declare-fun base!8 () BitStream!3562)

(declare-fun array_inv!1846 (array!4464) Bool)

(assert (=> b!95524 (= e!62610 (array_inv!1846 (buf!2390 base!8)))))

(declare-fun b!95525 () Bool)

(declare-fun res!78615 () Bool)

(assert (=> b!95525 (=> (not res!78615) (not e!62609))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95525 (= res!78615 (validate_offset_bits!1 ((_ sign_extend 32) (size!2038 (buf!2390 bitStream1!8))) ((_ sign_extend 32) (currentByte!4768 bitStream1!8)) ((_ sign_extend 32) (currentBit!4763 bitStream1!8)) nBits!484))))

(declare-fun b!95526 () Bool)

(declare-fun e!62604 () Bool)

(assert (=> b!95526 (= e!62604 (array_inv!1846 (buf!2390 bitStream1!8)))))

(declare-fun b!95527 () Bool)

(declare-fun res!78616 () Bool)

(assert (=> b!95527 (=> (not res!78616) (not e!62609))))

(assert (=> b!95527 (= res!78616 (bvslt (bitIndex!0 (size!2038 (buf!2390 base!8)) (currentByte!4768 base!8) (currentBit!4763 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95528 () Bool)

(declare-fun res!78613 () Bool)

(assert (=> b!95528 (=> (not res!78613) (not e!62609))))

(declare-datatypes ((List!887 0))(
  ( (Nil!884) (Cons!883 (h!1002 Bool) (t!1637 List!887)) )
))
(declare-fun listBits!13 () List!887)

(declare-fun length!478 (List!887) Int)

(assert (=> b!95528 (= res!78613 (> (length!478 listBits!13) 0))))

(declare-fun b!95529 () Bool)

(declare-fun res!78621 () Bool)

(assert (=> b!95529 (=> (not res!78621) (not e!62609))))

(declare-fun isPrefixOf!0 (BitStream!3562 BitStream!3562) Bool)

(assert (=> b!95529 (= res!78621 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95530 () Bool)

(declare-fun res!78614 () Bool)

(assert (=> b!95530 (=> (not res!78614) (not e!62609))))

(assert (=> b!95530 (= res!78614 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95531 () Bool)

(declare-fun e!62605 () Bool)

(assert (=> b!95531 (= e!62605 (array_inv!1846 (buf!2390 bitStream2!8)))))

(declare-fun b!95532 () Bool)

(assert (=> b!95532 (= e!62609 (and (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!78617 () Bool)

(assert (=> start!19124 (=> (not res!78617) (not e!62609))))

(assert (=> start!19124 (= res!78617 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19124 e!62609))

(assert (=> start!19124 true))

(declare-fun inv!12 (BitStream!3562) Bool)

(assert (=> start!19124 (and (inv!12 bitStream1!8) e!62604)))

(assert (=> start!19124 (and (inv!12 bitStream2!8) e!62605)))

(assert (=> start!19124 (and (inv!12 base!8) e!62610)))

(declare-fun b!95533 () Bool)

(declare-fun res!78619 () Bool)

(assert (=> b!95533 (=> (not res!78619) (not e!62609))))

(assert (=> b!95533 (= res!78619 (and (= (buf!2390 bitStream1!8) (buf!2390 bitStream2!8)) (= (buf!2390 bitStream1!8) (buf!2390 base!8))))))

(declare-fun b!95534 () Bool)

(declare-fun res!78618 () Bool)

(assert (=> b!95534 (=> (not res!78618) (not e!62609))))

(assert (=> b!95534 (= res!78618 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!19124 res!78617) b!95528))

(assert (= (and b!95528 res!78613) b!95530))

(assert (= (and b!95530 res!78614) b!95529))

(assert (= (and b!95529 res!78621) b!95534))

(assert (= (and b!95534 res!78618) b!95533))

(assert (= (and b!95533 res!78619) b!95527))

(assert (= (and b!95527 res!78616) b!95523))

(assert (= (and b!95523 res!78620) b!95525))

(assert (= (and b!95525 res!78615) b!95532))

(assert (= start!19124 b!95526))

(assert (= start!19124 b!95531))

(assert (= start!19124 b!95524))

(declare-fun m!138917 () Bool)

(assert (=> b!95524 m!138917))

(declare-fun m!138919 () Bool)

(assert (=> b!95529 m!138919))

(declare-fun m!138921 () Bool)

(assert (=> b!95531 m!138921))

(declare-fun m!138923 () Bool)

(assert (=> b!95525 m!138923))

(declare-fun m!138925 () Bool)

(assert (=> b!95534 m!138925))

(declare-fun m!138927 () Bool)

(assert (=> b!95526 m!138927))

(declare-fun m!138929 () Bool)

(assert (=> b!95523 m!138929))

(declare-fun m!138931 () Bool)

(assert (=> b!95523 m!138931))

(declare-fun m!138933 () Bool)

(assert (=> b!95530 m!138933))

(declare-fun m!138935 () Bool)

(assert (=> start!19124 m!138935))

(declare-fun m!138937 () Bool)

(assert (=> start!19124 m!138937))

(declare-fun m!138939 () Bool)

(assert (=> start!19124 m!138939))

(declare-fun m!138941 () Bool)

(assert (=> b!95527 m!138941))

(declare-fun m!138943 () Bool)

(assert (=> b!95528 m!138943))

(push 1)

(assert (not start!19124))

(assert (not b!95526))

(assert (not b!95524))

(assert (not b!95525))

(assert (not b!95534))

(assert (not b!95531))

(assert (not b!95523))

(assert (not b!95530))

(assert (not b!95528))

(assert (not b!95527))

(assert (not b!95529))

(check-sat)

(pop 1)

