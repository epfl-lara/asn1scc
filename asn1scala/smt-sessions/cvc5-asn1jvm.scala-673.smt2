; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18848 () Bool)

(assert start!18848)

(declare-fun res!77495 () Bool)

(declare-fun e!61710 () Bool)

(assert (=> start!18848 (=> (not res!77495) (not e!61710))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18848 (= res!77495 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18848 e!61710))

(assert (=> start!18848 true))

(declare-datatypes ((array!4401 0))(
  ( (array!4402 (arr!2613 (Array (_ BitVec 32) (_ BitVec 8))) (size!1999 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3514 0))(
  ( (BitStream!3515 (buf!2366 array!4401) (currentByte!4714 (_ BitVec 32)) (currentBit!4709 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3514)

(declare-fun e!61703 () Bool)

(declare-fun inv!12 (BitStream!3514) Bool)

(assert (=> start!18848 (and (inv!12 bitStream1!8) e!61703)))

(declare-fun bitStream2!8 () BitStream!3514)

(declare-fun e!61705 () Bool)

(assert (=> start!18848 (and (inv!12 bitStream2!8) e!61705)))

(declare-fun base!8 () BitStream!3514)

(declare-fun e!61706 () Bool)

(assert (=> start!18848 (and (inv!12 base!8) e!61706)))

(declare-fun thiss!1534 () BitStream!3514)

(declare-fun e!61707 () Bool)

(assert (=> start!18848 (and (inv!12 thiss!1534) e!61707)))

(declare-fun b!93992 () Bool)

(declare-fun res!77505 () Bool)

(assert (=> b!93992 (=> (not res!77505) (not e!61710))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93992 (= res!77505 (bvslt (bitIndex!0 (size!1999 (buf!2366 base!8)) (currentByte!4714 base!8) (currentBit!4709 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93993 () Bool)

(declare-fun res!77499 () Bool)

(assert (=> b!93993 (=> (not res!77499) (not e!61710))))

(declare-fun isPrefixOf!0 (BitStream!3514 BitStream!3514) Bool)

(assert (=> b!93993 (= res!77499 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93994 () Bool)

(declare-fun res!77497 () Bool)

(assert (=> b!93994 (=> (not res!77497) (not e!61710))))

(assert (=> b!93994 (= res!77497 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93995 () Bool)

(declare-fun res!77503 () Bool)

(assert (=> b!93995 (=> (not res!77503) (not e!61710))))

(declare-datatypes ((List!863 0))(
  ( (Nil!860) (Cons!859 (h!978 Bool) (t!1613 List!863)) )
))
(declare-fun listBits!13 () List!863)

(declare-fun length!454 (List!863) Int)

(assert (=> b!93995 (= res!77503 (> (length!454 listBits!13) 0))))

(declare-fun b!93996 () Bool)

(declare-fun res!77504 () Bool)

(assert (=> b!93996 (=> (not res!77504) (not e!61710))))

(assert (=> b!93996 (= res!77504 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93997 () Bool)

(declare-fun res!77500 () Bool)

(assert (=> b!93997 (=> (not res!77500) (not e!61710))))

(assert (=> b!93997 (= res!77500 (and (= (buf!2366 bitStream1!8) (buf!2366 bitStream2!8)) (= (buf!2366 bitStream1!8) (buf!2366 base!8))))))

(declare-fun b!93998 () Bool)

(declare-fun array_inv!1822 (array!4401) Bool)

(assert (=> b!93998 (= e!61703 (array_inv!1822 (buf!2366 bitStream1!8)))))

(declare-fun b!93999 () Bool)

(declare-fun res!77494 () Bool)

(assert (=> b!93999 (=> (not res!77494) (not e!61710))))

(assert (=> b!93999 (= res!77494 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94000 () Bool)

(declare-fun res!77496 () Bool)

(assert (=> b!94000 (=> (not res!77496) (not e!61710))))

(assert (=> b!94000 (= res!77496 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1999 (buf!2366 bitStream1!8)) (currentByte!4714 bitStream1!8) (currentBit!4709 bitStream1!8))) (bitIndex!0 (size!1999 (buf!2366 bitStream2!8)) (currentByte!4714 bitStream2!8) (currentBit!4709 bitStream2!8))))))

(declare-fun b!94001 () Bool)

(assert (=> b!94001 (= e!61705 (array_inv!1822 (buf!2366 bitStream2!8)))))

(declare-fun b!94002 () Bool)

(declare-fun res!77498 () Bool)

(assert (=> b!94002 (=> (not res!77498) (not e!61710))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3514 BitStream!3514 (_ BitVec 64)) List!863)

(assert (=> b!94002 (= res!77498 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94003 () Bool)

(declare-fun res!77502 () Bool)

(assert (=> b!94003 (=> (not res!77502) (not e!61710))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94003 (= res!77502 (validate_offset_bits!1 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream2!8))) ((_ sign_extend 32) (currentByte!4714 bitStream2!8)) ((_ sign_extend 32) (currentBit!4709 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94004 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94004 (= e!61710 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))) ((_ sign_extend 32) (currentByte!4714 bitStream1!8)) ((_ sign_extend 32) (currentBit!4709 bitStream1!8)))))))

(declare-fun b!94005 () Bool)

(assert (=> b!94005 (= e!61707 (array_inv!1822 (buf!2366 thiss!1534)))))

(declare-fun b!94006 () Bool)

(assert (=> b!94006 (= e!61706 (array_inv!1822 (buf!2366 base!8)))))

(declare-fun b!94007 () Bool)

(declare-fun res!77501 () Bool)

(assert (=> b!94007 (=> (not res!77501) (not e!61710))))

(assert (=> b!94007 (= res!77501 (validate_offset_bits!1 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))) ((_ sign_extend 32) (currentByte!4714 bitStream1!8)) ((_ sign_extend 32) (currentBit!4709 bitStream1!8)) nBits!484))))

(assert (= (and start!18848 res!77495) b!93995))

(assert (= (and b!93995 res!77503) b!93993))

(assert (= (and b!93993 res!77499) b!93996))

(assert (= (and b!93996 res!77504) b!93994))

(assert (= (and b!93994 res!77497) b!93997))

(assert (= (and b!93997 res!77500) b!93992))

(assert (= (and b!93992 res!77505) b!94000))

(assert (= (and b!94000 res!77496) b!94007))

(assert (= (and b!94007 res!77501) b!94003))

(assert (= (and b!94003 res!77502) b!94002))

(assert (= (and b!94002 res!77498) b!93999))

(assert (= (and b!93999 res!77494) b!94004))

(assert (= start!18848 b!93998))

(assert (= start!18848 b!94001))

(assert (= start!18848 b!94006))

(assert (= start!18848 b!94005))

(declare-fun m!137675 () Bool)

(assert (=> start!18848 m!137675))

(declare-fun m!137677 () Bool)

(assert (=> start!18848 m!137677))

(declare-fun m!137679 () Bool)

(assert (=> start!18848 m!137679))

(declare-fun m!137681 () Bool)

(assert (=> start!18848 m!137681))

(declare-fun m!137683 () Bool)

(assert (=> b!94005 m!137683))

(declare-fun m!137685 () Bool)

(assert (=> b!93998 m!137685))

(declare-fun m!137687 () Bool)

(assert (=> b!94004 m!137687))

(declare-fun m!137689 () Bool)

(assert (=> b!94001 m!137689))

(declare-fun m!137691 () Bool)

(assert (=> b!94000 m!137691))

(declare-fun m!137693 () Bool)

(assert (=> b!94000 m!137693))

(declare-fun m!137695 () Bool)

(assert (=> b!93995 m!137695))

(declare-fun m!137697 () Bool)

(assert (=> b!94003 m!137697))

(declare-fun m!137699 () Bool)

(assert (=> b!94002 m!137699))

(declare-fun m!137701 () Bool)

(assert (=> b!93992 m!137701))

(declare-fun m!137703 () Bool)

(assert (=> b!93996 m!137703))

(declare-fun m!137705 () Bool)

(assert (=> b!93993 m!137705))

(declare-fun m!137707 () Bool)

(assert (=> b!93994 m!137707))

(declare-fun m!137709 () Bool)

(assert (=> b!94006 m!137709))

(declare-fun m!137711 () Bool)

(assert (=> b!94007 m!137711))

(push 1)

(assert (not b!94004))

(assert (not b!94002))

(assert (not b!94007))

(assert (not b!94006))

(assert (not b!93992))

(assert (not b!93995))

(assert (not b!94005))

(assert (not start!18848))

(assert (not b!93994))

(assert (not b!94001))

(assert (not b!93998))

(assert (not b!93996))

(assert (not b!93993))

(assert (not b!94003))

(assert (not b!94000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29228 () Bool)

(assert (=> d!29228 (= (array_inv!1822 (buf!2366 base!8)) (bvsge (size!1999 (buf!2366 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94006 d!29228))

(declare-fun d!29232 () Bool)

(declare-fun size!2002 (List!863) Int)

(assert (=> d!29232 (= (length!454 listBits!13) (size!2002 listBits!13))))

(declare-fun bs!7192 () Bool)

(assert (= bs!7192 d!29232))

(declare-fun m!137807 () Bool)

(assert (=> bs!7192 m!137807))

(assert (=> b!93995 d!29232))

(declare-fun d!29236 () Bool)

(declare-fun res!77609 () Bool)

(declare-fun e!61784 () Bool)

(assert (=> d!29236 (=> (not res!77609) (not e!61784))))

(assert (=> d!29236 (= res!77609 (= (size!1999 (buf!2366 bitStream1!8)) (size!1999 (buf!2366 bitStream2!8))))))

(assert (=> d!29236 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61784)))

(declare-fun b!94135 () Bool)

(declare-fun res!77611 () Bool)

(assert (=> b!94135 (=> (not res!77611) (not e!61784))))

(assert (=> b!94135 (= res!77611 (bvsle (bitIndex!0 (size!1999 (buf!2366 bitStream1!8)) (currentByte!4714 bitStream1!8) (currentBit!4709 bitStream1!8)) (bitIndex!0 (size!1999 (buf!2366 bitStream2!8)) (currentByte!4714 bitStream2!8) (currentBit!4709 bitStream2!8))))))

(declare-fun b!94136 () Bool)

(declare-fun e!61785 () Bool)

(assert (=> b!94136 (= e!61784 e!61785)))

(declare-fun res!77610 () Bool)

(assert (=> b!94136 (=> res!77610 e!61785)))

(assert (=> b!94136 (= res!77610 (= (size!1999 (buf!2366 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94137 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4401 array!4401 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94137 (= e!61785 (arrayBitRangesEq!0 (buf!2366 bitStream1!8) (buf!2366 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1999 (buf!2366 bitStream1!8)) (currentByte!4714 bitStream1!8) (currentBit!4709 bitStream1!8))))))

(assert (= (and d!29236 res!77609) b!94135))

(assert (= (and b!94135 res!77611) b!94136))

(assert (= (and b!94136 (not res!77610)) b!94137))

(assert (=> b!94135 m!137691))

(assert (=> b!94135 m!137693))

(assert (=> b!94137 m!137691))

(assert (=> b!94137 m!137691))

(declare-fun m!137811 () Bool)

(assert (=> b!94137 m!137811))

(assert (=> b!93994 d!29236))

(declare-fun d!29248 () Bool)

(assert (=> d!29248 (= (array_inv!1822 (buf!2366 thiss!1534)) (bvsge (size!1999 (buf!2366 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94005 d!29248))

(declare-fun d!29250 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29250 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))) ((_ sign_extend 32) (currentByte!4714 bitStream1!8)) ((_ sign_extend 32) (currentBit!4709 bitStream1!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))) ((_ sign_extend 32) (currentByte!4714 bitStream1!8)) ((_ sign_extend 32) (currentBit!4709 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7198 () Bool)

(assert (= bs!7198 d!29250))

(declare-fun m!137813 () Bool)

(assert (=> bs!7198 m!137813))

(assert (=> b!94004 d!29250))

(declare-fun d!29252 () Bool)

(assert (=> d!29252 (= (array_inv!1822 (buf!2366 bitStream1!8)) (bvsge (size!1999 (buf!2366 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!93998 d!29252))

(declare-fun d!29254 () Bool)

(declare-fun res!77612 () Bool)

(declare-fun e!61786 () Bool)

(assert (=> d!29254 (=> (not res!77612) (not e!61786))))

(assert (=> d!29254 (= res!77612 (= (size!1999 (buf!2366 bitStream2!8)) (size!1999 (buf!2366 base!8))))))

(assert (=> d!29254 (= (isPrefixOf!0 bitStream2!8 base!8) e!61786)))

(declare-fun b!94138 () Bool)

(declare-fun res!77614 () Bool)

(assert (=> b!94138 (=> (not res!77614) (not e!61786))))

(assert (=> b!94138 (= res!77614 (bvsle (bitIndex!0 (size!1999 (buf!2366 bitStream2!8)) (currentByte!4714 bitStream2!8) (currentBit!4709 bitStream2!8)) (bitIndex!0 (size!1999 (buf!2366 base!8)) (currentByte!4714 base!8) (currentBit!4709 base!8))))))

(declare-fun b!94139 () Bool)

(declare-fun e!61787 () Bool)

(assert (=> b!94139 (= e!61786 e!61787)))

(declare-fun res!77613 () Bool)

(assert (=> b!94139 (=> res!77613 e!61787)))

(assert (=> b!94139 (= res!77613 (= (size!1999 (buf!2366 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94140 () Bool)

(assert (=> b!94140 (= e!61787 (arrayBitRangesEq!0 (buf!2366 bitStream2!8) (buf!2366 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1999 (buf!2366 bitStream2!8)) (currentByte!4714 bitStream2!8) (currentBit!4709 bitStream2!8))))))

(assert (= (and d!29254 res!77612) b!94138))

(assert (= (and b!94138 res!77614) b!94139))

(assert (= (and b!94139 (not res!77613)) b!94140))

(assert (=> b!94138 m!137693))

(assert (=> b!94138 m!137701))

(assert (=> b!94140 m!137693))

(assert (=> b!94140 m!137693))

(declare-fun m!137815 () Bool)

(assert (=> b!94140 m!137815))

(assert (=> b!93996 d!29254))

(declare-fun d!29256 () Bool)

(assert (=> d!29256 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))) ((_ sign_extend 32) (currentByte!4714 bitStream1!8)) ((_ sign_extend 32) (currentBit!4709 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))) ((_ sign_extend 32) (currentByte!4714 bitStream1!8)) ((_ sign_extend 32) (currentBit!4709 bitStream1!8))) nBits!484))))

(declare-fun bs!7199 () Bool)

(assert (= bs!7199 d!29256))

(assert (=> bs!7199 m!137813))

(assert (=> b!94007 d!29256))

(declare-fun d!29258 () Bool)

(assert (=> d!29258 (= (array_inv!1822 (buf!2366 bitStream2!8)) (bvsge (size!1999 (buf!2366 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94001 d!29258))

(declare-fun d!29260 () Bool)

(declare-fun e!61796 () Bool)

(assert (=> d!29260 e!61796))

(declare-fun res!77620 () Bool)

(assert (=> d!29260 (=> (not res!77620) (not e!61796))))

(declare-fun lt!138651 () (_ BitVec 64))

(declare-fun lt!138654 () (_ BitVec 64))

(declare-fun lt!138650 () (_ BitVec 64))

(assert (=> d!29260 (= res!77620 (= lt!138654 (bvsub lt!138651 lt!138650)))))

(assert (=> d!29260 (or (= (bvand lt!138651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138651 lt!138650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29260 (= lt!138650 (remainingBits!0 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))) ((_ sign_extend 32) (currentByte!4714 bitStream1!8)) ((_ sign_extend 32) (currentBit!4709 bitStream1!8))))))

(declare-fun lt!138649 () (_ BitVec 64))

(declare-fun lt!138652 () (_ BitVec 64))

(assert (=> d!29260 (= lt!138651 (bvmul lt!138649 lt!138652))))

(assert (=> d!29260 (or (= lt!138649 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138652 (bvsdiv (bvmul lt!138649 lt!138652) lt!138649)))))

(assert (=> d!29260 (= lt!138652 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29260 (= lt!138649 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))))))

(assert (=> d!29260 (= lt!138654 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4714 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4709 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29260 (invariant!0 (currentBit!4709 bitStream1!8) (currentByte!4714 bitStream1!8) (size!1999 (buf!2366 bitStream1!8)))))

(assert (=> d!29260 (= (bitIndex!0 (size!1999 (buf!2366 bitStream1!8)) (currentByte!4714 bitStream1!8) (currentBit!4709 bitStream1!8)) lt!138654)))

(declare-fun b!94157 () Bool)

(declare-fun res!77619 () Bool)

(assert (=> b!94157 (=> (not res!77619) (not e!61796))))

(assert (=> b!94157 (= res!77619 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138654))))

(declare-fun b!94158 () Bool)

(declare-fun lt!138653 () (_ BitVec 64))

(assert (=> b!94158 (= e!61796 (bvsle lt!138654 (bvmul lt!138653 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94158 (or (= lt!138653 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138653 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138653)))))

(assert (=> b!94158 (= lt!138653 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream1!8))))))

(assert (= (and d!29260 res!77620) b!94157))

(assert (= (and b!94157 res!77619) b!94158))

(assert (=> d!29260 m!137813))

(declare-fun m!137835 () Bool)

(assert (=> d!29260 m!137835))

(assert (=> b!94000 d!29260))

(declare-fun d!29280 () Bool)

(declare-fun e!61797 () Bool)

(assert (=> d!29280 e!61797))

(declare-fun res!77622 () Bool)

(assert (=> d!29280 (=> (not res!77622) (not e!61797))))

(declare-fun lt!138656 () (_ BitVec 64))

(declare-fun lt!138657 () (_ BitVec 64))

(declare-fun lt!138660 () (_ BitVec 64))

(assert (=> d!29280 (= res!77622 (= lt!138660 (bvsub lt!138657 lt!138656)))))

(assert (=> d!29280 (or (= (bvand lt!138657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138657 lt!138656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29280 (= lt!138656 (remainingBits!0 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream2!8))) ((_ sign_extend 32) (currentByte!4714 bitStream2!8)) ((_ sign_extend 32) (currentBit!4709 bitStream2!8))))))

(declare-fun lt!138655 () (_ BitVec 64))

(declare-fun lt!138658 () (_ BitVec 64))

(assert (=> d!29280 (= lt!138657 (bvmul lt!138655 lt!138658))))

(assert (=> d!29280 (or (= lt!138655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138658 (bvsdiv (bvmul lt!138655 lt!138658) lt!138655)))))

(assert (=> d!29280 (= lt!138658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29280 (= lt!138655 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream2!8))))))

(assert (=> d!29280 (= lt!138660 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4714 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4709 bitStream2!8))))))

(assert (=> d!29280 (invariant!0 (currentBit!4709 bitStream2!8) (currentByte!4714 bitStream2!8) (size!1999 (buf!2366 bitStream2!8)))))

(assert (=> d!29280 (= (bitIndex!0 (size!1999 (buf!2366 bitStream2!8)) (currentByte!4714 bitStream2!8) (currentBit!4709 bitStream2!8)) lt!138660)))

(declare-fun b!94159 () Bool)

(declare-fun res!77621 () Bool)

(assert (=> b!94159 (=> (not res!77621) (not e!61797))))

(assert (=> b!94159 (= res!77621 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138660))))

(declare-fun b!94160 () Bool)

(declare-fun lt!138659 () (_ BitVec 64))

(assert (=> b!94160 (= e!61797 (bvsle lt!138660 (bvmul lt!138659 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94160 (or (= lt!138659 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138659 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138659)))))

(assert (=> b!94160 (= lt!138659 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream2!8))))))

(assert (= (and d!29280 res!77622) b!94159))

(assert (= (and b!94159 res!77621) b!94160))

(declare-fun m!137837 () Bool)

(assert (=> d!29280 m!137837))

(declare-fun m!137839 () Bool)

(assert (=> d!29280 m!137839))

(assert (=> b!94000 d!29280))

(declare-fun d!29282 () Bool)

(declare-fun res!77623 () Bool)

(declare-fun e!61798 () Bool)

(assert (=> d!29282 (=> (not res!77623) (not e!61798))))

(assert (=> d!29282 (= res!77623 (= (size!1999 (buf!2366 bitStream1!8)) (size!1999 (buf!2366 base!8))))))

(assert (=> d!29282 (= (isPrefixOf!0 bitStream1!8 base!8) e!61798)))

(declare-fun b!94161 () Bool)

(declare-fun res!77625 () Bool)

(assert (=> b!94161 (=> (not res!77625) (not e!61798))))

(assert (=> b!94161 (= res!77625 (bvsle (bitIndex!0 (size!1999 (buf!2366 bitStream1!8)) (currentByte!4714 bitStream1!8) (currentBit!4709 bitStream1!8)) (bitIndex!0 (size!1999 (buf!2366 base!8)) (currentByte!4714 base!8) (currentBit!4709 base!8))))))

(declare-fun b!94162 () Bool)

(declare-fun e!61799 () Bool)

(assert (=> b!94162 (= e!61798 e!61799)))

(declare-fun res!77624 () Bool)

(assert (=> b!94162 (=> res!77624 e!61799)))

(assert (=> b!94162 (= res!77624 (= (size!1999 (buf!2366 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94163 () Bool)

(assert (=> b!94163 (= e!61799 (arrayBitRangesEq!0 (buf!2366 bitStream1!8) (buf!2366 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1999 (buf!2366 bitStream1!8)) (currentByte!4714 bitStream1!8) (currentBit!4709 bitStream1!8))))))

(assert (= (and d!29282 res!77623) b!94161))

(assert (= (and b!94161 res!77625) b!94162))

(assert (= (and b!94162 (not res!77624)) b!94163))

(assert (=> b!94161 m!137691))

(assert (=> b!94161 m!137701))

(assert (=> b!94163 m!137691))

(assert (=> b!94163 m!137691))

(declare-fun m!137841 () Bool)

(assert (=> b!94163 m!137841))

(assert (=> b!93993 d!29282))

(declare-fun d!29284 () Bool)

(assert (=> d!29284 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4709 bitStream1!8) (currentByte!4714 bitStream1!8) (size!1999 (buf!2366 bitStream1!8))))))

(declare-fun bs!7205 () Bool)

(assert (= bs!7205 d!29284))

(assert (=> bs!7205 m!137835))

(assert (=> start!18848 d!29284))

(declare-fun d!29286 () Bool)

(assert (=> d!29286 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4709 bitStream2!8) (currentByte!4714 bitStream2!8) (size!1999 (buf!2366 bitStream2!8))))))

(declare-fun bs!7206 () Bool)

(assert (= bs!7206 d!29286))

(assert (=> bs!7206 m!137839))

(assert (=> start!18848 d!29286))

(declare-fun d!29288 () Bool)

(assert (=> d!29288 (= (inv!12 base!8) (invariant!0 (currentBit!4709 base!8) (currentByte!4714 base!8) (size!1999 (buf!2366 base!8))))))

(declare-fun bs!7207 () Bool)

(assert (= bs!7207 d!29288))

(declare-fun m!137843 () Bool)

(assert (=> bs!7207 m!137843))

(assert (=> start!18848 d!29288))

(declare-fun d!29290 () Bool)

(assert (=> d!29290 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4709 thiss!1534) (currentByte!4714 thiss!1534) (size!1999 (buf!2366 thiss!1534))))))

(declare-fun bs!7208 () Bool)

(assert (= bs!7208 d!29290))

(declare-fun m!137845 () Bool)

(assert (=> bs!7208 m!137845))

(assert (=> start!18848 d!29290))

(declare-fun d!29292 () Bool)

(declare-fun e!61800 () Bool)

(assert (=> d!29292 e!61800))

(declare-fun res!77627 () Bool)

(assert (=> d!29292 (=> (not res!77627) (not e!61800))))

(declare-fun lt!138666 () (_ BitVec 64))

(declare-fun lt!138663 () (_ BitVec 64))

(declare-fun lt!138662 () (_ BitVec 64))

(assert (=> d!29292 (= res!77627 (= lt!138666 (bvsub lt!138663 lt!138662)))))

(assert (=> d!29292 (or (= (bvand lt!138663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138662 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138663 lt!138662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29292 (= lt!138662 (remainingBits!0 ((_ sign_extend 32) (size!1999 (buf!2366 base!8))) ((_ sign_extend 32) (currentByte!4714 base!8)) ((_ sign_extend 32) (currentBit!4709 base!8))))))

(declare-fun lt!138661 () (_ BitVec 64))

(declare-fun lt!138664 () (_ BitVec 64))

(assert (=> d!29292 (= lt!138663 (bvmul lt!138661 lt!138664))))

(assert (=> d!29292 (or (= lt!138661 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138664 (bvsdiv (bvmul lt!138661 lt!138664) lt!138661)))))

(assert (=> d!29292 (= lt!138664 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29292 (= lt!138661 ((_ sign_extend 32) (size!1999 (buf!2366 base!8))))))

(assert (=> d!29292 (= lt!138666 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4714 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4709 base!8))))))

(assert (=> d!29292 (invariant!0 (currentBit!4709 base!8) (currentByte!4714 base!8) (size!1999 (buf!2366 base!8)))))

(assert (=> d!29292 (= (bitIndex!0 (size!1999 (buf!2366 base!8)) (currentByte!4714 base!8) (currentBit!4709 base!8)) lt!138666)))

(declare-fun b!94164 () Bool)

(declare-fun res!77626 () Bool)

(assert (=> b!94164 (=> (not res!77626) (not e!61800))))

(assert (=> b!94164 (= res!77626 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138666))))

(declare-fun b!94165 () Bool)

(declare-fun lt!138665 () (_ BitVec 64))

(assert (=> b!94165 (= e!61800 (bvsle lt!138666 (bvmul lt!138665 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94165 (or (= lt!138665 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138665 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138665)))))

(assert (=> b!94165 (= lt!138665 ((_ sign_extend 32) (size!1999 (buf!2366 base!8))))))

(assert (= (and d!29292 res!77627) b!94164))

(assert (= (and b!94164 res!77626) b!94165))

(declare-fun m!137847 () Bool)

(assert (=> d!29292 m!137847))

(assert (=> d!29292 m!137843))

(assert (=> b!93992 d!29292))

(declare-fun d!29294 () Bool)

(assert (=> d!29294 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream2!8))) ((_ sign_extend 32) (currentByte!4714 bitStream2!8)) ((_ sign_extend 32) (currentBit!4709 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1999 (buf!2366 bitStream2!8))) ((_ sign_extend 32) (currentByte!4714 bitStream2!8)) ((_ sign_extend 32) (currentBit!4709 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7209 () Bool)

(assert (= bs!7209 d!29294))

(assert (=> bs!7209 m!137837))

(assert (=> b!94003 d!29294))

(declare-fun b!94194 () Bool)

(declare-fun e!61815 () Bool)

(declare-fun lt!138699 () List!863)

(assert (=> b!94194 (= e!61815 (> (length!454 lt!138699) 0))))

(declare-fun b!94191 () Bool)

(declare-datatypes ((tuple2!7634 0))(
  ( (tuple2!7635 (_1!4064 List!863) (_2!4064 BitStream!3514)) )
))
(declare-fun e!61816 () tuple2!7634)

(assert (=> b!94191 (= e!61816 (tuple2!7635 Nil!860 bitStream1!8))))

(declare-fun b!94192 () Bool)

(declare-datatypes ((tuple2!7636 0))(
  ( (tuple2!7637 (_1!4065 Bool) (_2!4065 BitStream!3514)) )
))
(declare-fun lt!138697 () tuple2!7636)

(declare-fun lt!138698 () (_ BitVec 64))

(assert (=> b!94192 (= e!61816 (tuple2!7635 (Cons!859 (_1!4065 lt!138697) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4065 lt!138697) (bvsub nBits!484 lt!138698))) (_2!4065 lt!138697)))))

(declare-fun readBit!0 (BitStream!3514) tuple2!7636)

(assert (=> b!94192 (= lt!138697 (readBit!0 bitStream1!8))))

(assert (=> b!94192 (= lt!138698 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!29296 () Bool)

(assert (=> d!29296 e!61815))

(declare-fun c!5931 () Bool)

(assert (=> d!29296 (= c!5931 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29296 (= lt!138699 (_1!4064 e!61816))))

(declare-fun c!5930 () Bool)

(assert (=> d!29296 (= c!5930 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29296 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29296 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138699)))

(declare-fun b!94193 () Bool)

(declare-fun isEmpty!251 (List!863) Bool)

(assert (=> b!94193 (= e!61815 (isEmpty!251 lt!138699))))

(assert (= (and d!29296 c!5930) b!94191))

(assert (= (and d!29296 (not c!5930)) b!94192))

(assert (= (and d!29296 c!5931) b!94193))

(assert (= (and d!29296 (not c!5931)) b!94194))

(declare-fun m!137855 () Bool)

(assert (=> b!94194 m!137855))

(declare-fun m!137857 () Bool)

(assert (=> b!94192 m!137857))

(declare-fun m!137859 () Bool)

(assert (=> b!94192 m!137859))

(declare-fun m!137861 () Bool)

(assert (=> b!94193 m!137861))

(assert (=> b!94002 d!29296))

(push 1)

(assert (not d!29288))

(assert (not d!29292))

(assert (not d!29260))

(assert (not d!29256))

(assert (not b!94140))

(assert (not d!29286))

(assert (not b!94163))

(assert (not b!94161))

(assert (not d!29232))

(assert (not b!94193))

(assert (not b!94137))

(assert (not d!29284))

(assert (not b!94138))

(assert (not b!94194))

(assert (not b!94135))

(assert (not b!94192))

(assert (not d!29280))

(assert (not d!29294))

(assert (not d!29250))

(assert (not d!29290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

