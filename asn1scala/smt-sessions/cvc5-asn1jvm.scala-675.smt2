; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18950 () Bool)

(assert start!18950)

(declare-fun b!94493 () Bool)

(declare-fun res!77853 () Bool)

(declare-fun e!61995 () Bool)

(assert (=> b!94493 (=> (not res!77853) (not e!61995))))

(declare-datatypes ((array!4419 0))(
  ( (array!4420 (arr!2619 (Array (_ BitVec 32) (_ BitVec 8))) (size!2011 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3526 0))(
  ( (BitStream!3527 (buf!2372 array!4419) (currentByte!4735 (_ BitVec 32)) (currentBit!4730 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3526)

(declare-fun bitStream2!8 () BitStream!3526)

(declare-fun base!8 () BitStream!3526)

(assert (=> b!94493 (= res!77853 (and (= (buf!2372 bitStream1!8) (buf!2372 bitStream2!8)) (= (buf!2372 bitStream1!8) (buf!2372 base!8))))))

(declare-fun b!94494 () Bool)

(declare-fun res!77859 () Bool)

(assert (=> b!94494 (=> (not res!77859) (not e!61995))))

(declare-fun isPrefixOf!0 (BitStream!3526 BitStream!3526) Bool)

(assert (=> b!94494 (= res!77859 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94495 () Bool)

(declare-fun res!77855 () Bool)

(assert (=> b!94495 (=> (not res!77855) (not e!61995))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94495 (= res!77855 (validate_offset_bits!1 ((_ sign_extend 32) (size!2011 (buf!2372 bitStream1!8))) ((_ sign_extend 32) (currentByte!4735 bitStream1!8)) ((_ sign_extend 32) (currentBit!4730 bitStream1!8)) nBits!484))))

(declare-fun b!94496 () Bool)

(declare-fun res!77861 () Bool)

(assert (=> b!94496 (=> (not res!77861) (not e!61995))))

(assert (=> b!94496 (= res!77861 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94497 () Bool)

(declare-fun e!61993 () Bool)

(declare-fun array_inv!1828 (array!4419) Bool)

(assert (=> b!94497 (= e!61993 (array_inv!1828 (buf!2372 bitStream2!8)))))

(declare-fun b!94498 () Bool)

(assert (=> b!94498 (= e!61995 false)))

(declare-datatypes ((tuple2!7654 0))(
  ( (tuple2!7655 (_1!4074 BitStream!3526) (_2!4074 Bool)) )
))
(declare-fun lt!138834 () tuple2!7654)

(declare-fun readBitPure!0 (BitStream!3526) tuple2!7654)

(assert (=> b!94498 (= lt!138834 (readBitPure!0 bitStream1!8))))

(declare-fun b!94499 () Bool)

(declare-fun res!77854 () Bool)

(assert (=> b!94499 (=> (not res!77854) (not e!61995))))

(assert (=> b!94499 (= res!77854 (validate_offset_bits!1 ((_ sign_extend 32) (size!2011 (buf!2372 bitStream2!8))) ((_ sign_extend 32) (currentByte!4735 bitStream2!8)) ((_ sign_extend 32) (currentBit!4730 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94500 () Bool)

(declare-fun res!77857 () Bool)

(assert (=> b!94500 (=> (not res!77857) (not e!61995))))

(declare-datatypes ((List!869 0))(
  ( (Nil!866) (Cons!865 (h!984 Bool) (t!1619 List!869)) )
))
(declare-fun listBits!13 () List!869)

(declare-fun length!460 (List!869) Int)

(assert (=> b!94500 (= res!77857 (> (length!460 listBits!13) 0))))

(declare-fun b!94501 () Bool)

(declare-fun res!77860 () Bool)

(assert (=> b!94501 (=> (not res!77860) (not e!61995))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94501 (= res!77860 (bvslt (bitIndex!0 (size!2011 (buf!2372 base!8)) (currentByte!4735 base!8) (currentBit!4730 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94502 () Bool)

(declare-fun res!77851 () Bool)

(assert (=> b!94502 (=> (not res!77851) (not e!61995))))

(assert (=> b!94502 (= res!77851 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94503 () Bool)

(declare-fun e!61998 () Bool)

(declare-fun thiss!1534 () BitStream!3526)

(assert (=> b!94503 (= e!61998 (array_inv!1828 (buf!2372 thiss!1534)))))

(declare-fun res!77856 () Bool)

(assert (=> start!18950 (=> (not res!77856) (not e!61995))))

(assert (=> start!18950 (= res!77856 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18950 e!61995))

(assert (=> start!18950 true))

(declare-fun e!61996 () Bool)

(declare-fun inv!12 (BitStream!3526) Bool)

(assert (=> start!18950 (and (inv!12 bitStream1!8) e!61996)))

(assert (=> start!18950 (and (inv!12 bitStream2!8) e!61993)))

(declare-fun e!61997 () Bool)

(assert (=> start!18950 (and (inv!12 base!8) e!61997)))

(assert (=> start!18950 (and (inv!12 thiss!1534) e!61998)))

(declare-fun b!94504 () Bool)

(declare-fun res!77858 () Bool)

(assert (=> b!94504 (=> (not res!77858) (not e!61995))))

(assert (=> b!94504 (= res!77858 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94505 () Bool)

(assert (=> b!94505 (= e!61997 (array_inv!1828 (buf!2372 base!8)))))

(declare-fun b!94506 () Bool)

(declare-fun res!77862 () Bool)

(assert (=> b!94506 (=> (not res!77862) (not e!61995))))

(assert (=> b!94506 (= res!77862 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2011 (buf!2372 bitStream1!8)) (currentByte!4735 bitStream1!8) (currentBit!4730 bitStream1!8))) (bitIndex!0 (size!2011 (buf!2372 bitStream2!8)) (currentByte!4735 bitStream2!8) (currentBit!4730 bitStream2!8))))))

(declare-fun b!94507 () Bool)

(declare-fun res!77852 () Bool)

(assert (=> b!94507 (=> (not res!77852) (not e!61995))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3526 BitStream!3526 (_ BitVec 64)) List!869)

(assert (=> b!94507 (= res!77852 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94508 () Bool)

(assert (=> b!94508 (= e!61996 (array_inv!1828 (buf!2372 bitStream1!8)))))

(assert (= (and start!18950 res!77856) b!94500))

(assert (= (and b!94500 res!77857) b!94504))

(assert (= (and b!94504 res!77858) b!94502))

(assert (= (and b!94502 res!77851) b!94494))

(assert (= (and b!94494 res!77859) b!94493))

(assert (= (and b!94493 res!77853) b!94501))

(assert (= (and b!94501 res!77860) b!94506))

(assert (= (and b!94506 res!77862) b!94495))

(assert (= (and b!94495 res!77855) b!94499))

(assert (= (and b!94499 res!77854) b!94507))

(assert (= (and b!94507 res!77852) b!94496))

(assert (= (and b!94496 res!77861) b!94498))

(assert (= start!18950 b!94508))

(assert (= start!18950 b!94497))

(assert (= start!18950 b!94505))

(assert (= start!18950 b!94503))

(declare-fun m!138077 () Bool)

(assert (=> b!94502 m!138077))

(declare-fun m!138079 () Bool)

(assert (=> b!94494 m!138079))

(declare-fun m!138081 () Bool)

(assert (=> b!94501 m!138081))

(declare-fun m!138083 () Bool)

(assert (=> start!18950 m!138083))

(declare-fun m!138085 () Bool)

(assert (=> start!18950 m!138085))

(declare-fun m!138087 () Bool)

(assert (=> start!18950 m!138087))

(declare-fun m!138089 () Bool)

(assert (=> start!18950 m!138089))

(declare-fun m!138091 () Bool)

(assert (=> b!94503 m!138091))

(declare-fun m!138093 () Bool)

(assert (=> b!94497 m!138093))

(declare-fun m!138095 () Bool)

(assert (=> b!94498 m!138095))

(declare-fun m!138097 () Bool)

(assert (=> b!94499 m!138097))

(declare-fun m!138099 () Bool)

(assert (=> b!94504 m!138099))

(declare-fun m!138101 () Bool)

(assert (=> b!94508 m!138101))

(declare-fun m!138103 () Bool)

(assert (=> b!94507 m!138103))

(declare-fun m!138105 () Bool)

(assert (=> b!94505 m!138105))

(declare-fun m!138107 () Bool)

(assert (=> b!94506 m!138107))

(declare-fun m!138109 () Bool)

(assert (=> b!94506 m!138109))

(declare-fun m!138111 () Bool)

(assert (=> b!94495 m!138111))

(declare-fun m!138113 () Bool)

(assert (=> b!94500 m!138113))

(push 1)

(assert (not b!94502))

(assert (not b!94504))

(assert (not b!94494))

(assert (not start!18950))

(assert (not b!94508))

(assert (not b!94506))

(assert (not b!94495))

(assert (not b!94505))

(assert (not b!94497))

(assert (not b!94499))

(assert (not b!94507))

(assert (not b!94498))

(assert (not b!94503))

(assert (not b!94500))

(assert (not b!94501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

