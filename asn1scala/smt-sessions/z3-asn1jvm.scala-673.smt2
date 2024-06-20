; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18850 () Bool)

(assert start!18850)

(declare-fun b!94040 () Bool)

(declare-fun res!77532 () Bool)

(declare-fun e!61737 () Bool)

(assert (=> b!94040 (=> (not res!77532) (not e!61737))))

(declare-datatypes ((array!4403 0))(
  ( (array!4404 (arr!2614 (Array (_ BitVec 32) (_ BitVec 8))) (size!2000 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3516 0))(
  ( (BitStream!3517 (buf!2367 array!4403) (currentByte!4715 (_ BitVec 32)) (currentBit!4710 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3516)

(declare-fun bitStream2!8 () BitStream!3516)

(declare-fun isPrefixOf!0 (BitStream!3516 BitStream!3516) Bool)

(assert (=> b!94040 (= res!77532 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94041 () Bool)

(declare-fun res!77533 () Bool)

(assert (=> b!94041 (=> (not res!77533) (not e!61737))))

(declare-fun base!8 () BitStream!3516)

(assert (=> b!94041 (= res!77533 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94042 () Bool)

(declare-fun res!77530 () Bool)

(assert (=> b!94042 (=> (not res!77530) (not e!61737))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94042 (= res!77530 (validate_offset_bits!1 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream2!8))) ((_ sign_extend 32) (currentByte!4715 bitStream2!8)) ((_ sign_extend 32) (currentBit!4710 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94043 () Bool)

(declare-fun res!77537 () Bool)

(assert (=> b!94043 (=> (not res!77537) (not e!61737))))

(declare-datatypes ((List!864 0))(
  ( (Nil!861) (Cons!860 (h!979 Bool) (t!1614 List!864)) )
))
(declare-fun listBits!13 () List!864)

(declare-fun length!455 (List!864) Int)

(assert (=> b!94043 (= res!77537 (> (length!455 listBits!13) 0))))

(declare-fun b!94044 () Bool)

(declare-fun res!77531 () Bool)

(assert (=> b!94044 (=> (not res!77531) (not e!61737))))

(declare-fun thiss!1534 () BitStream!3516)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3516 BitStream!3516 (_ BitVec 64)) List!864)

(assert (=> b!94044 (= res!77531 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94045 () Bool)

(declare-fun res!77536 () Bool)

(assert (=> b!94045 (=> (not res!77536) (not e!61737))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94045 (= res!77536 (bvslt (bitIndex!0 (size!2000 (buf!2367 base!8)) (currentByte!4715 base!8) (currentBit!4710 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94046 () Bool)

(declare-fun res!77539 () Bool)

(assert (=> b!94046 (=> (not res!77539) (not e!61737))))

(assert (=> b!94046 (= res!77539 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94047 () Bool)

(declare-fun res!77535 () Bool)

(assert (=> b!94047 (=> (not res!77535) (not e!61737))))

(assert (=> b!94047 (= res!77535 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2000 (buf!2367 bitStream1!8)) (currentByte!4715 bitStream1!8) (currentBit!4710 bitStream1!8))) (bitIndex!0 (size!2000 (buf!2367 bitStream2!8)) (currentByte!4715 bitStream2!8) (currentBit!4710 bitStream2!8))))))

(declare-fun b!94048 () Bool)

(declare-fun e!61733 () Bool)

(declare-fun array_inv!1823 (array!4403) Bool)

(assert (=> b!94048 (= e!61733 (array_inv!1823 (buf!2367 base!8)))))

(declare-fun b!94049 () Bool)

(declare-fun e!61729 () Bool)

(assert (=> b!94049 (= e!61729 (array_inv!1823 (buf!2367 bitStream1!8)))))

(declare-fun res!77541 () Bool)

(assert (=> start!18850 (=> (not res!77541) (not e!61737))))

(assert (=> start!18850 (= res!77541 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18850 e!61737))

(assert (=> start!18850 true))

(declare-fun inv!12 (BitStream!3516) Bool)

(assert (=> start!18850 (and (inv!12 bitStream1!8) e!61729)))

(declare-fun e!61730 () Bool)

(assert (=> start!18850 (and (inv!12 bitStream2!8) e!61730)))

(assert (=> start!18850 (and (inv!12 base!8) e!61733)))

(declare-fun e!61735 () Bool)

(assert (=> start!18850 (and (inv!12 thiss!1534) e!61735)))

(declare-fun b!94050 () Bool)

(declare-fun res!77538 () Bool)

(assert (=> b!94050 (=> (not res!77538) (not e!61737))))

(assert (=> b!94050 (= res!77538 (validate_offset_bits!1 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))) ((_ sign_extend 32) (currentByte!4715 bitStream1!8)) ((_ sign_extend 32) (currentBit!4710 bitStream1!8)) nBits!484))))

(declare-fun b!94051 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94051 (= e!61737 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))) ((_ sign_extend 32) (currentByte!4715 bitStream1!8)) ((_ sign_extend 32) (currentBit!4710 bitStream1!8)))))))

(declare-fun b!94052 () Bool)

(assert (=> b!94052 (= e!61735 (array_inv!1823 (buf!2367 thiss!1534)))))

(declare-fun b!94053 () Bool)

(assert (=> b!94053 (= e!61730 (array_inv!1823 (buf!2367 bitStream2!8)))))

(declare-fun b!94054 () Bool)

(declare-fun res!77540 () Bool)

(assert (=> b!94054 (=> (not res!77540) (not e!61737))))

(assert (=> b!94054 (= res!77540 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94055 () Bool)

(declare-fun res!77534 () Bool)

(assert (=> b!94055 (=> (not res!77534) (not e!61737))))

(assert (=> b!94055 (= res!77534 (and (= (buf!2367 bitStream1!8) (buf!2367 bitStream2!8)) (= (buf!2367 bitStream1!8) (buf!2367 base!8))))))

(assert (= (and start!18850 res!77541) b!94043))

(assert (= (and b!94043 res!77537) b!94041))

(assert (= (and b!94041 res!77533) b!94046))

(assert (= (and b!94046 res!77539) b!94040))

(assert (= (and b!94040 res!77532) b!94055))

(assert (= (and b!94055 res!77534) b!94045))

(assert (= (and b!94045 res!77536) b!94047))

(assert (= (and b!94047 res!77535) b!94050))

(assert (= (and b!94050 res!77538) b!94042))

(assert (= (and b!94042 res!77530) b!94044))

(assert (= (and b!94044 res!77531) b!94054))

(assert (= (and b!94054 res!77540) b!94051))

(assert (= start!18850 b!94049))

(assert (= start!18850 b!94053))

(assert (= start!18850 b!94048))

(assert (= start!18850 b!94052))

(declare-fun m!137713 () Bool)

(assert (=> b!94043 m!137713))

(declare-fun m!137715 () Bool)

(assert (=> b!94042 m!137715))

(declare-fun m!137717 () Bool)

(assert (=> b!94053 m!137717))

(declare-fun m!137719 () Bool)

(assert (=> b!94041 m!137719))

(declare-fun m!137721 () Bool)

(assert (=> b!94045 m!137721))

(declare-fun m!137723 () Bool)

(assert (=> start!18850 m!137723))

(declare-fun m!137725 () Bool)

(assert (=> start!18850 m!137725))

(declare-fun m!137727 () Bool)

(assert (=> start!18850 m!137727))

(declare-fun m!137729 () Bool)

(assert (=> start!18850 m!137729))

(declare-fun m!137731 () Bool)

(assert (=> b!94044 m!137731))

(declare-fun m!137733 () Bool)

(assert (=> b!94049 m!137733))

(declare-fun m!137735 () Bool)

(assert (=> b!94040 m!137735))

(declare-fun m!137737 () Bool)

(assert (=> b!94048 m!137737))

(declare-fun m!137739 () Bool)

(assert (=> b!94050 m!137739))

(declare-fun m!137741 () Bool)

(assert (=> b!94046 m!137741))

(declare-fun m!137743 () Bool)

(assert (=> b!94051 m!137743))

(declare-fun m!137745 () Bool)

(assert (=> b!94047 m!137745))

(declare-fun m!137747 () Bool)

(assert (=> b!94047 m!137747))

(declare-fun m!137749 () Bool)

(assert (=> b!94052 m!137749))

(check-sat (not b!94050) (not start!18850) (not b!94041) (not b!94044) (not b!94045) (not b!94043) (not b!94046) (not b!94047) (not b!94053) (not b!94040) (not b!94048) (not b!94049) (not b!94052) (not b!94042) (not b!94051))
(check-sat)
(get-model)

(declare-fun d!29208 () Bool)

(declare-fun e!61767 () Bool)

(assert (=> d!29208 e!61767))

(declare-fun res!77583 () Bool)

(assert (=> d!29208 (=> (not res!77583) (not e!61767))))

(declare-fun lt!138611 () (_ BitVec 64))

(declare-fun lt!138614 () (_ BitVec 64))

(declare-fun lt!138610 () (_ BitVec 64))

(assert (=> d!29208 (= res!77583 (= lt!138614 (bvsub lt!138610 lt!138611)))))

(assert (=> d!29208 (or (= (bvand lt!138610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138610 lt!138611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29208 (= lt!138611 (remainingBits!0 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))) ((_ sign_extend 32) (currentByte!4715 bitStream1!8)) ((_ sign_extend 32) (currentBit!4710 bitStream1!8))))))

(declare-fun lt!138612 () (_ BitVec 64))

(declare-fun lt!138615 () (_ BitVec 64))

(assert (=> d!29208 (= lt!138610 (bvmul lt!138612 lt!138615))))

(assert (=> d!29208 (or (= lt!138612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138615 (bvsdiv (bvmul lt!138612 lt!138615) lt!138612)))))

(assert (=> d!29208 (= lt!138615 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29208 (= lt!138612 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))))))

(assert (=> d!29208 (= lt!138614 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4715 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4710 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29208 (invariant!0 (currentBit!4710 bitStream1!8) (currentByte!4715 bitStream1!8) (size!2000 (buf!2367 bitStream1!8)))))

(assert (=> d!29208 (= (bitIndex!0 (size!2000 (buf!2367 bitStream1!8)) (currentByte!4715 bitStream1!8) (currentBit!4710 bitStream1!8)) lt!138614)))

(declare-fun b!94108 () Bool)

(declare-fun res!77582 () Bool)

(assert (=> b!94108 (=> (not res!77582) (not e!61767))))

(assert (=> b!94108 (= res!77582 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138614))))

(declare-fun b!94109 () Bool)

(declare-fun lt!138613 () (_ BitVec 64))

(assert (=> b!94109 (= e!61767 (bvsle lt!138614 (bvmul lt!138613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94109 (or (= lt!138613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138613)))))

(assert (=> b!94109 (= lt!138613 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))))))

(assert (= (and d!29208 res!77583) b!94108))

(assert (= (and b!94108 res!77582) b!94109))

(declare-fun m!137789 () Bool)

(assert (=> d!29208 m!137789))

(declare-fun m!137791 () Bool)

(assert (=> d!29208 m!137791))

(assert (=> b!94047 d!29208))

(declare-fun d!29210 () Bool)

(declare-fun e!61768 () Bool)

(assert (=> d!29210 e!61768))

(declare-fun res!77585 () Bool)

(assert (=> d!29210 (=> (not res!77585) (not e!61768))))

(declare-fun lt!138616 () (_ BitVec 64))

(declare-fun lt!138617 () (_ BitVec 64))

(declare-fun lt!138620 () (_ BitVec 64))

(assert (=> d!29210 (= res!77585 (= lt!138620 (bvsub lt!138616 lt!138617)))))

(assert (=> d!29210 (or (= (bvand lt!138616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138617 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138616 lt!138617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29210 (= lt!138617 (remainingBits!0 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream2!8))) ((_ sign_extend 32) (currentByte!4715 bitStream2!8)) ((_ sign_extend 32) (currentBit!4710 bitStream2!8))))))

(declare-fun lt!138618 () (_ BitVec 64))

(declare-fun lt!138621 () (_ BitVec 64))

(assert (=> d!29210 (= lt!138616 (bvmul lt!138618 lt!138621))))

(assert (=> d!29210 (or (= lt!138618 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138621 (bvsdiv (bvmul lt!138618 lt!138621) lt!138618)))))

(assert (=> d!29210 (= lt!138621 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29210 (= lt!138618 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream2!8))))))

(assert (=> d!29210 (= lt!138620 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4715 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4710 bitStream2!8))))))

(assert (=> d!29210 (invariant!0 (currentBit!4710 bitStream2!8) (currentByte!4715 bitStream2!8) (size!2000 (buf!2367 bitStream2!8)))))

(assert (=> d!29210 (= (bitIndex!0 (size!2000 (buf!2367 bitStream2!8)) (currentByte!4715 bitStream2!8) (currentBit!4710 bitStream2!8)) lt!138620)))

(declare-fun b!94110 () Bool)

(declare-fun res!77584 () Bool)

(assert (=> b!94110 (=> (not res!77584) (not e!61768))))

(assert (=> b!94110 (= res!77584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138620))))

(declare-fun b!94111 () Bool)

(declare-fun lt!138619 () (_ BitVec 64))

(assert (=> b!94111 (= e!61768 (bvsle lt!138620 (bvmul lt!138619 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94111 (or (= lt!138619 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138619 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138619)))))

(assert (=> b!94111 (= lt!138619 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream2!8))))))

(assert (= (and d!29210 res!77585) b!94110))

(assert (= (and b!94110 res!77584) b!94111))

(declare-fun m!137793 () Bool)

(assert (=> d!29210 m!137793))

(declare-fun m!137795 () Bool)

(assert (=> d!29210 m!137795))

(assert (=> b!94047 d!29210))

(declare-fun d!29212 () Bool)

(declare-fun e!61769 () Bool)

(assert (=> d!29212 e!61769))

(declare-fun res!77587 () Bool)

(assert (=> d!29212 (=> (not res!77587) (not e!61769))))

(declare-fun lt!138623 () (_ BitVec 64))

(declare-fun lt!138626 () (_ BitVec 64))

(declare-fun lt!138622 () (_ BitVec 64))

(assert (=> d!29212 (= res!77587 (= lt!138626 (bvsub lt!138622 lt!138623)))))

(assert (=> d!29212 (or (= (bvand lt!138622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138622 lt!138623) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29212 (= lt!138623 (remainingBits!0 ((_ sign_extend 32) (size!2000 (buf!2367 base!8))) ((_ sign_extend 32) (currentByte!4715 base!8)) ((_ sign_extend 32) (currentBit!4710 base!8))))))

(declare-fun lt!138624 () (_ BitVec 64))

(declare-fun lt!138627 () (_ BitVec 64))

(assert (=> d!29212 (= lt!138622 (bvmul lt!138624 lt!138627))))

(assert (=> d!29212 (or (= lt!138624 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138627 (bvsdiv (bvmul lt!138624 lt!138627) lt!138624)))))

(assert (=> d!29212 (= lt!138627 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29212 (= lt!138624 ((_ sign_extend 32) (size!2000 (buf!2367 base!8))))))

(assert (=> d!29212 (= lt!138626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4715 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4710 base!8))))))

(assert (=> d!29212 (invariant!0 (currentBit!4710 base!8) (currentByte!4715 base!8) (size!2000 (buf!2367 base!8)))))

(assert (=> d!29212 (= (bitIndex!0 (size!2000 (buf!2367 base!8)) (currentByte!4715 base!8) (currentBit!4710 base!8)) lt!138626)))

(declare-fun b!94112 () Bool)

(declare-fun res!77586 () Bool)

(assert (=> b!94112 (=> (not res!77586) (not e!61769))))

(assert (=> b!94112 (= res!77586 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138626))))

(declare-fun b!94113 () Bool)

(declare-fun lt!138625 () (_ BitVec 64))

(assert (=> b!94113 (= e!61769 (bvsle lt!138626 (bvmul lt!138625 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94113 (or (= lt!138625 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138625 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138625)))))

(assert (=> b!94113 (= lt!138625 ((_ sign_extend 32) (size!2000 (buf!2367 base!8))))))

(assert (= (and d!29212 res!77587) b!94112))

(assert (= (and b!94112 res!77586) b!94113))

(declare-fun m!137797 () Bool)

(assert (=> d!29212 m!137797))

(declare-fun m!137799 () Bool)

(assert (=> d!29212 m!137799))

(assert (=> b!94045 d!29212))

(declare-fun d!29214 () Bool)

(declare-fun res!77595 () Bool)

(declare-fun e!61774 () Bool)

(assert (=> d!29214 (=> (not res!77595) (not e!61774))))

(assert (=> d!29214 (= res!77595 (= (size!2000 (buf!2367 bitStream2!8)) (size!2000 (buf!2367 base!8))))))

(assert (=> d!29214 (= (isPrefixOf!0 bitStream2!8 base!8) e!61774)))

(declare-fun b!94120 () Bool)

(declare-fun res!77594 () Bool)

(assert (=> b!94120 (=> (not res!77594) (not e!61774))))

(assert (=> b!94120 (= res!77594 (bvsle (bitIndex!0 (size!2000 (buf!2367 bitStream2!8)) (currentByte!4715 bitStream2!8) (currentBit!4710 bitStream2!8)) (bitIndex!0 (size!2000 (buf!2367 base!8)) (currentByte!4715 base!8) (currentBit!4710 base!8))))))

(declare-fun b!94121 () Bool)

(declare-fun e!61775 () Bool)

(assert (=> b!94121 (= e!61774 e!61775)))

(declare-fun res!77596 () Bool)

(assert (=> b!94121 (=> res!77596 e!61775)))

(assert (=> b!94121 (= res!77596 (= (size!2000 (buf!2367 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94122 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4403 array!4403 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94122 (= e!61775 (arrayBitRangesEq!0 (buf!2367 bitStream2!8) (buf!2367 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2000 (buf!2367 bitStream2!8)) (currentByte!4715 bitStream2!8) (currentBit!4710 bitStream2!8))))))

(assert (= (and d!29214 res!77595) b!94120))

(assert (= (and b!94120 res!77594) b!94121))

(assert (= (and b!94121 (not res!77596)) b!94122))

(assert (=> b!94120 m!137747))

(assert (=> b!94120 m!137721))

(assert (=> b!94122 m!137747))

(assert (=> b!94122 m!137747))

(declare-fun m!137801 () Bool)

(assert (=> b!94122 m!137801))

(assert (=> b!94046 d!29214))

(declare-fun d!29216 () Bool)

(assert (=> d!29216 (= (array_inv!1823 (buf!2367 bitStream1!8)) (bvsge (size!2000 (buf!2367 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!94049 d!29216))

(declare-fun d!29218 () Bool)

(assert (=> d!29218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))) ((_ sign_extend 32) (currentByte!4715 bitStream1!8)) ((_ sign_extend 32) (currentBit!4710 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))) ((_ sign_extend 32) (currentByte!4715 bitStream1!8)) ((_ sign_extend 32) (currentBit!4710 bitStream1!8))) nBits!484))))

(declare-fun bs!7190 () Bool)

(assert (= bs!7190 d!29218))

(assert (=> bs!7190 m!137789))

(assert (=> b!94050 d!29218))

(declare-fun d!29220 () Bool)

(assert (=> d!29220 (= (array_inv!1823 (buf!2367 base!8)) (bvsge (size!2000 (buf!2367 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94048 d!29220))

(declare-fun d!29222 () Bool)

(assert (=> d!29222 (= (array_inv!1823 (buf!2367 thiss!1534)) (bvsge (size!2000 (buf!2367 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94052 d!29222))

(declare-fun d!29224 () Bool)

(declare-fun res!77598 () Bool)

(declare-fun e!61776 () Bool)

(assert (=> d!29224 (=> (not res!77598) (not e!61776))))

(assert (=> d!29224 (= res!77598 (= (size!2000 (buf!2367 bitStream1!8)) (size!2000 (buf!2367 base!8))))))

(assert (=> d!29224 (= (isPrefixOf!0 bitStream1!8 base!8) e!61776)))

(declare-fun b!94123 () Bool)

(declare-fun res!77597 () Bool)

(assert (=> b!94123 (=> (not res!77597) (not e!61776))))

(assert (=> b!94123 (= res!77597 (bvsle (bitIndex!0 (size!2000 (buf!2367 bitStream1!8)) (currentByte!4715 bitStream1!8) (currentBit!4710 bitStream1!8)) (bitIndex!0 (size!2000 (buf!2367 base!8)) (currentByte!4715 base!8) (currentBit!4710 base!8))))))

(declare-fun b!94124 () Bool)

(declare-fun e!61777 () Bool)

(assert (=> b!94124 (= e!61776 e!61777)))

(declare-fun res!77599 () Bool)

(assert (=> b!94124 (=> res!77599 e!61777)))

(assert (=> b!94124 (= res!77599 (= (size!2000 (buf!2367 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94125 () Bool)

(assert (=> b!94125 (= e!61777 (arrayBitRangesEq!0 (buf!2367 bitStream1!8) (buf!2367 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2000 (buf!2367 bitStream1!8)) (currentByte!4715 bitStream1!8) (currentBit!4710 bitStream1!8))))))

(assert (= (and d!29224 res!77598) b!94123))

(assert (= (and b!94123 res!77597) b!94124))

(assert (= (and b!94124 (not res!77599)) b!94125))

(assert (=> b!94123 m!137745))

(assert (=> b!94123 m!137721))

(assert (=> b!94125 m!137745))

(assert (=> b!94125 m!137745))

(declare-fun m!137803 () Bool)

(assert (=> b!94125 m!137803))

(assert (=> b!94041 d!29224))

(declare-fun d!29226 () Bool)

(assert (=> d!29226 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream2!8))) ((_ sign_extend 32) (currentByte!4715 bitStream2!8)) ((_ sign_extend 32) (currentBit!4710 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream2!8))) ((_ sign_extend 32) (currentByte!4715 bitStream2!8)) ((_ sign_extend 32) (currentBit!4710 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7191 () Bool)

(assert (= bs!7191 d!29226))

(assert (=> bs!7191 m!137793))

(assert (=> b!94042 d!29226))

(declare-fun d!29230 () Bool)

(declare-fun res!77601 () Bool)

(declare-fun e!61778 () Bool)

(assert (=> d!29230 (=> (not res!77601) (not e!61778))))

(assert (=> d!29230 (= res!77601 (= (size!2000 (buf!2367 bitStream1!8)) (size!2000 (buf!2367 bitStream2!8))))))

(assert (=> d!29230 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61778)))

(declare-fun b!94126 () Bool)

(declare-fun res!77600 () Bool)

(assert (=> b!94126 (=> (not res!77600) (not e!61778))))

(assert (=> b!94126 (= res!77600 (bvsle (bitIndex!0 (size!2000 (buf!2367 bitStream1!8)) (currentByte!4715 bitStream1!8) (currentBit!4710 bitStream1!8)) (bitIndex!0 (size!2000 (buf!2367 bitStream2!8)) (currentByte!4715 bitStream2!8) (currentBit!4710 bitStream2!8))))))

(declare-fun b!94127 () Bool)

(declare-fun e!61779 () Bool)

(assert (=> b!94127 (= e!61778 e!61779)))

(declare-fun res!77602 () Bool)

(assert (=> b!94127 (=> res!77602 e!61779)))

(assert (=> b!94127 (= res!77602 (= (size!2000 (buf!2367 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94128 () Bool)

(assert (=> b!94128 (= e!61779 (arrayBitRangesEq!0 (buf!2367 bitStream1!8) (buf!2367 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2000 (buf!2367 bitStream1!8)) (currentByte!4715 bitStream1!8) (currentBit!4710 bitStream1!8))))))

(assert (= (and d!29230 res!77601) b!94126))

(assert (= (and b!94126 res!77600) b!94127))

(assert (= (and b!94127 (not res!77602)) b!94128))

(assert (=> b!94126 m!137745))

(assert (=> b!94126 m!137747))

(assert (=> b!94128 m!137745))

(assert (=> b!94128 m!137745))

(declare-fun m!137805 () Bool)

(assert (=> b!94128 m!137805))

(assert (=> b!94040 d!29230))

(declare-fun d!29234 () Bool)

(assert (=> d!29234 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4710 bitStream1!8) (currentByte!4715 bitStream1!8) (size!2000 (buf!2367 bitStream1!8))))))

(declare-fun bs!7193 () Bool)

(assert (= bs!7193 d!29234))

(assert (=> bs!7193 m!137791))

(assert (=> start!18850 d!29234))

(declare-fun d!29238 () Bool)

(assert (=> d!29238 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4710 bitStream2!8) (currentByte!4715 bitStream2!8) (size!2000 (buf!2367 bitStream2!8))))))

(declare-fun bs!7194 () Bool)

(assert (= bs!7194 d!29238))

(assert (=> bs!7194 m!137795))

(assert (=> start!18850 d!29238))

(declare-fun d!29240 () Bool)

(assert (=> d!29240 (= (inv!12 base!8) (invariant!0 (currentBit!4710 base!8) (currentByte!4715 base!8) (size!2000 (buf!2367 base!8))))))

(declare-fun bs!7195 () Bool)

(assert (= bs!7195 d!29240))

(assert (=> bs!7195 m!137799))

(assert (=> start!18850 d!29240))

(declare-fun d!29242 () Bool)

(assert (=> d!29242 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4710 thiss!1534) (currentByte!4715 thiss!1534) (size!2000 (buf!2367 thiss!1534))))))

(declare-fun bs!7196 () Bool)

(assert (= bs!7196 d!29242))

(declare-fun m!137809 () Bool)

(assert (=> bs!7196 m!137809))

(assert (=> start!18850 d!29242))

(declare-fun d!29244 () Bool)

(assert (=> d!29244 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))) ((_ sign_extend 32) (currentByte!4715 bitStream1!8)) ((_ sign_extend 32) (currentBit!4710 bitStream1!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2000 (buf!2367 bitStream1!8))) ((_ sign_extend 32) (currentByte!4715 bitStream1!8)) ((_ sign_extend 32) (currentBit!4710 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7197 () Bool)

(assert (= bs!7197 d!29244))

(assert (=> bs!7197 m!137789))

(assert (=> b!94051 d!29244))

(declare-fun d!29246 () Bool)

(declare-fun e!61792 () Bool)

(assert (=> d!29246 e!61792))

(declare-fun c!5924 () Bool)

(assert (=> d!29246 (= c!5924 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!138634 () List!864)

(declare-datatypes ((tuple2!7630 0))(
  ( (tuple2!7631 (_1!4062 List!864) (_2!4062 BitStream!3516)) )
))
(declare-fun e!61793 () tuple2!7630)

(assert (=> d!29246 (= lt!138634 (_1!4062 e!61793))))

(declare-fun c!5925 () Bool)

(assert (=> d!29246 (= c!5925 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29246 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29246 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138634)))

(declare-fun b!94151 () Bool)

(declare-fun isEmpty!250 (List!864) Bool)

(assert (=> b!94151 (= e!61792 (isEmpty!250 lt!138634))))

(declare-fun b!94152 () Bool)

(assert (=> b!94152 (= e!61792 (> (length!455 lt!138634) 0))))

(declare-datatypes ((tuple2!7632 0))(
  ( (tuple2!7633 (_1!4063 Bool) (_2!4063 BitStream!3516)) )
))
(declare-fun lt!138636 () tuple2!7632)

(declare-fun lt!138635 () (_ BitVec 64))

(declare-fun b!94150 () Bool)

(assert (=> b!94150 (= e!61793 (tuple2!7631 (Cons!860 (_1!4063 lt!138636) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4063 lt!138636) (bvsub nBits!484 lt!138635))) (_2!4063 lt!138636)))))

(declare-fun readBit!0 (BitStream!3516) tuple2!7632)

(assert (=> b!94150 (= lt!138636 (readBit!0 bitStream1!8))))

(assert (=> b!94150 (= lt!138635 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!94149 () Bool)

(assert (=> b!94149 (= e!61793 (tuple2!7631 Nil!861 bitStream1!8))))

(assert (= (and d!29246 c!5925) b!94149))

(assert (= (and d!29246 (not c!5925)) b!94150))

(assert (= (and d!29246 c!5924) b!94151))

(assert (= (and d!29246 (not c!5924)) b!94152))

(declare-fun m!137817 () Bool)

(assert (=> b!94151 m!137817))

(declare-fun m!137819 () Bool)

(assert (=> b!94152 m!137819))

(declare-fun m!137821 () Bool)

(assert (=> b!94150 m!137821))

(declare-fun m!137823 () Bool)

(assert (=> b!94150 m!137823))

(assert (=> b!94044 d!29246))

(declare-fun d!29264 () Bool)

(assert (=> d!29264 (= (array_inv!1823 (buf!2367 bitStream2!8)) (bvsge (size!2000 (buf!2367 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94053 d!29264))

(declare-fun d!29266 () Bool)

(declare-fun size!2003 (List!864) Int)

(assert (=> d!29266 (= (length!455 listBits!13) (size!2003 listBits!13))))

(declare-fun bs!7200 () Bool)

(assert (= bs!7200 d!29266))

(declare-fun m!137825 () Bool)

(assert (=> bs!7200 m!137825))

(assert (=> b!94043 d!29266))

(check-sat (not d!29244) (not b!94122) (not d!29208) (not d!29240) (not b!94150) (not d!29242) (not b!94120) (not b!94126) (not d!29210) (not d!29266) (not d!29218) (not d!29212) (not d!29234) (not d!29238) (not b!94128) (not d!29226) (not b!94152) (not b!94123) (not b!94151) (not b!94125))
