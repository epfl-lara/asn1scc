; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19128 () Bool)

(assert start!19128)

(declare-fun b!95595 () Bool)

(declare-fun res!78672 () Bool)

(declare-fun e!62652 () Bool)

(assert (=> b!95595 (=> (not res!78672) (not e!62652))))

(declare-datatypes ((array!4468 0))(
  ( (array!4469 (arr!2639 (Array (_ BitVec 32) (_ BitVec 8))) (size!2040 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3566 0))(
  ( (BitStream!3567 (buf!2392 array!4468) (currentByte!4770 (_ BitVec 32)) (currentBit!4765 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3566)

(declare-fun base!8 () BitStream!3566)

(declare-fun isPrefixOf!0 (BitStream!3566 BitStream!3566) Bool)

(assert (=> b!95595 (= res!78672 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95596 () Bool)

(declare-fun e!62650 () Bool)

(declare-fun bitStream2!8 () BitStream!3566)

(declare-fun array_inv!1848 (array!4468) Bool)

(assert (=> b!95596 (= e!62650 (array_inv!1848 (buf!2392 bitStream2!8)))))

(declare-fun b!95597 () Bool)

(declare-fun e!62649 () Bool)

(assert (=> b!95597 (= e!62649 (array_inv!1848 (buf!2392 base!8)))))

(declare-fun b!95598 () Bool)

(declare-fun res!78669 () Bool)

(assert (=> b!95598 (=> (not res!78669) (not e!62652))))

(assert (=> b!95598 (= res!78669 (and (= (buf!2392 bitStream1!8) (buf!2392 bitStream2!8)) (= (buf!2392 bitStream1!8) (buf!2392 base!8))))))

(declare-fun b!95599 () Bool)

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!95599 (= e!62652 (and (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!95600 () Bool)

(declare-fun e!62648 () Bool)

(assert (=> b!95600 (= e!62648 (array_inv!1848 (buf!2392 bitStream1!8)))))

(declare-fun b!95601 () Bool)

(declare-fun res!78673 () Bool)

(assert (=> b!95601 (=> (not res!78673) (not e!62652))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95601 (= res!78673 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2040 (buf!2392 bitStream1!8)) (currentByte!4770 bitStream1!8) (currentBit!4765 bitStream1!8))) (bitIndex!0 (size!2040 (buf!2392 bitStream2!8)) (currentByte!4770 bitStream2!8) (currentBit!4765 bitStream2!8))))))

(declare-fun b!95602 () Bool)

(declare-fun res!78670 () Bool)

(assert (=> b!95602 (=> (not res!78670) (not e!62652))))

(assert (=> b!95602 (= res!78670 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95603 () Bool)

(declare-fun res!78668 () Bool)

(assert (=> b!95603 (=> (not res!78668) (not e!62652))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95603 (= res!78668 (validate_offset_bits!1 ((_ sign_extend 32) (size!2040 (buf!2392 bitStream1!8))) ((_ sign_extend 32) (currentByte!4770 bitStream1!8)) ((_ sign_extend 32) (currentBit!4765 bitStream1!8)) nBits!484))))

(declare-fun res!78674 () Bool)

(assert (=> start!19128 (=> (not res!78674) (not e!62652))))

(assert (=> start!19128 (= res!78674 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19128 e!62652))

(assert (=> start!19128 true))

(declare-fun inv!12 (BitStream!3566) Bool)

(assert (=> start!19128 (and (inv!12 bitStream1!8) e!62648)))

(assert (=> start!19128 (and (inv!12 bitStream2!8) e!62650)))

(assert (=> start!19128 (and (inv!12 base!8) e!62649)))

(declare-fun b!95604 () Bool)

(declare-fun res!78667 () Bool)

(assert (=> b!95604 (=> (not res!78667) (not e!62652))))

(declare-datatypes ((List!889 0))(
  ( (Nil!886) (Cons!885 (h!1004 Bool) (t!1639 List!889)) )
))
(declare-fun listBits!13 () List!889)

(declare-fun length!480 (List!889) Int)

(assert (=> b!95604 (= res!78667 (> (length!480 listBits!13) 0))))

(declare-fun b!95605 () Bool)

(declare-fun res!78675 () Bool)

(assert (=> b!95605 (=> (not res!78675) (not e!62652))))

(assert (=> b!95605 (= res!78675 (bvslt (bitIndex!0 (size!2040 (buf!2392 base!8)) (currentByte!4770 base!8) (currentBit!4765 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95606 () Bool)

(declare-fun res!78671 () Bool)

(assert (=> b!95606 (=> (not res!78671) (not e!62652))))

(assert (=> b!95606 (= res!78671 (isPrefixOf!0 bitStream2!8 base!8))))

(assert (= (and start!19128 res!78674) b!95604))

(assert (= (and b!95604 res!78667) b!95595))

(assert (= (and b!95595 res!78672) b!95606))

(assert (= (and b!95606 res!78671) b!95602))

(assert (= (and b!95602 res!78670) b!95598))

(assert (= (and b!95598 res!78669) b!95605))

(assert (= (and b!95605 res!78675) b!95601))

(assert (= (and b!95601 res!78673) b!95603))

(assert (= (and b!95603 res!78668) b!95599))

(assert (= start!19128 b!95600))

(assert (= start!19128 b!95596))

(assert (= start!19128 b!95597))

(declare-fun m!138973 () Bool)

(assert (=> b!95602 m!138973))

(declare-fun m!138975 () Bool)

(assert (=> b!95597 m!138975))

(declare-fun m!138977 () Bool)

(assert (=> b!95606 m!138977))

(declare-fun m!138979 () Bool)

(assert (=> b!95605 m!138979))

(declare-fun m!138981 () Bool)

(assert (=> b!95596 m!138981))

(declare-fun m!138983 () Bool)

(assert (=> b!95604 m!138983))

(declare-fun m!138985 () Bool)

(assert (=> b!95595 m!138985))

(declare-fun m!138987 () Bool)

(assert (=> b!95600 m!138987))

(declare-fun m!138989 () Bool)

(assert (=> b!95601 m!138989))

(declare-fun m!138991 () Bool)

(assert (=> b!95601 m!138991))

(declare-fun m!138993 () Bool)

(assert (=> b!95603 m!138993))

(declare-fun m!138995 () Bool)

(assert (=> start!19128 m!138995))

(declare-fun m!138997 () Bool)

(assert (=> start!19128 m!138997))

(declare-fun m!138999 () Bool)

(assert (=> start!19128 m!138999))

(push 1)

(assert (not b!95606))

(assert (not b!95603))

(assert (not b!95600))

(assert (not b!95601))

(assert (not b!95605))

(assert (not b!95595))

(assert (not start!19128))

(assert (not b!95604))

(assert (not b!95597))

(assert (not b!95596))

(assert (not b!95602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

