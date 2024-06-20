; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17050 () Bool)

(assert start!17050)

(declare-fun b!83376 () Bool)

(declare-fun e!55420 () Bool)

(declare-datatypes ((array!3827 0))(
  ( (array!3828 (arr!2379 (Array (_ BitVec 32) (_ BitVec 8))) (size!1742 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3046 0))(
  ( (BitStream!3047 (buf!2132 array!3827) (currentByte!4226 (_ BitVec 32)) (currentBit!4221 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3046)

(declare-fun array_inv!1588 (array!3827) Bool)

(assert (=> b!83376 (= e!55420 (array_inv!1588 (buf!2132 b2!98)))))

(declare-fun b!83377 () Bool)

(declare-fun e!55419 () Bool)

(declare-fun e!55417 () Bool)

(assert (=> b!83377 (= e!55419 e!55417)))

(declare-fun res!68585 () Bool)

(assert (=> b!83377 (=> (not res!68585) (not e!55417))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!132894 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83377 (= res!68585 (= (bvadd lt!132894 b1b2Diff!1) (bitIndex!0 (size!1742 (buf!2132 b2!98)) (currentByte!4226 b2!98) (currentBit!4221 b2!98))))))

(declare-fun b1!98 () BitStream!3046)

(assert (=> b!83377 (= lt!132894 (bitIndex!0 (size!1742 (buf!2132 b1!98)) (currentByte!4226 b1!98) (currentBit!4221 b1!98)))))

(declare-fun res!68586 () Bool)

(assert (=> start!17050 (=> (not res!68586) (not e!55419))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!17050 (= res!68586 (and (= (size!1742 (buf!2132 b1!98)) (size!1742 (buf!2132 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17050 e!55419))

(declare-fun e!55418 () Bool)

(declare-fun inv!12 (BitStream!3046) Bool)

(assert (=> start!17050 (and (inv!12 b1!98) e!55418)))

(assert (=> start!17050 (and (inv!12 b2!98) e!55420)))

(assert (=> start!17050 true))

(declare-fun b!83378 () Bool)

(assert (=> b!83378 (= e!55418 (array_inv!1588 (buf!2132 b1!98)))))

(declare-fun lt!132895 () (_ BitVec 64))

(declare-fun lt!132893 () (_ BitVec 64))

(declare-fun b!83379 () Bool)

(assert (=> b!83379 (= e!55417 (not (or (= lt!132895 (bvand lt!132894 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!132895 (bvand lt!132893 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!132897 () (_ BitVec 64))

(assert (=> b!83379 (= lt!132895 (bvand lt!132897 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83379 (= (remainingBits!0 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))) ((_ sign_extend 32) (currentByte!4226 b1!98)) ((_ sign_extend 32) (currentBit!4221 b1!98))) lt!132893)))

(assert (=> b!83379 (= lt!132893 (bvsub lt!132897 lt!132894))))

(assert (=> b!83379 (= lt!132897 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98)))))))

(declare-datatypes ((Unit!5587 0))(
  ( (Unit!5588) )
))
(declare-fun lt!132896 () Unit!5587)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3046) Unit!5587)

(assert (=> b!83379 (= lt!132896 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83380 () Bool)

(declare-fun res!68587 () Bool)

(assert (=> b!83380 (=> (not res!68587) (not e!55419))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83380 (= res!68587 (validate_offset_bits!1 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))) ((_ sign_extend 32) (currentByte!4226 b1!98)) ((_ sign_extend 32) (currentBit!4221 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!17050 res!68586) b!83380))

(assert (= (and b!83380 res!68587) b!83377))

(assert (= (and b!83377 res!68585) b!83379))

(assert (= start!17050 b!83378))

(assert (= start!17050 b!83376))

(declare-fun m!129951 () Bool)

(assert (=> b!83380 m!129951))

(declare-fun m!129953 () Bool)

(assert (=> b!83378 m!129953))

(declare-fun m!129955 () Bool)

(assert (=> b!83377 m!129955))

(declare-fun m!129957 () Bool)

(assert (=> b!83377 m!129957))

(declare-fun m!129959 () Bool)

(assert (=> b!83379 m!129959))

(declare-fun m!129961 () Bool)

(assert (=> b!83379 m!129961))

(declare-fun m!129963 () Bool)

(assert (=> start!17050 m!129963))

(declare-fun m!129965 () Bool)

(assert (=> start!17050 m!129965))

(declare-fun m!129967 () Bool)

(assert (=> b!83376 m!129967))

(push 1)

(assert (not b!83380))

(assert (not b!83379))

(assert (not start!17050))

(assert (not b!83377))

(assert (not b!83378))

(assert (not b!83376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26640 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26640 (= (inv!12 b1!98) (invariant!0 (currentBit!4221 b1!98) (currentByte!4226 b1!98) (size!1742 (buf!2132 b1!98))))))

(declare-fun bs!6553 () Bool)

(assert (= bs!6553 d!26640))

(declare-fun m!130005 () Bool)

(assert (=> bs!6553 m!130005))

(assert (=> start!17050 d!26640))

(declare-fun d!26642 () Bool)

(assert (=> d!26642 (= (inv!12 b2!98) (invariant!0 (currentBit!4221 b2!98) (currentByte!4226 b2!98) (size!1742 (buf!2132 b2!98))))))

(declare-fun bs!6554 () Bool)

(assert (= bs!6554 d!26642))

(declare-fun m!130007 () Bool)

(assert (=> bs!6554 m!130007))

(assert (=> start!17050 d!26642))

(declare-fun d!26644 () Bool)

(assert (=> d!26644 (= (array_inv!1588 (buf!2132 b2!98)) (bvsge (size!1742 (buf!2132 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83376 d!26644))

(declare-fun d!26646 () Bool)

(assert (=> d!26646 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))) ((_ sign_extend 32) (currentByte!4226 b1!98)) ((_ sign_extend 32) (currentBit!4221 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))) ((_ sign_extend 32) (currentByte!4226 b1!98)) ((_ sign_extend 32) (currentBit!4221 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6555 () Bool)

(assert (= bs!6555 d!26646))

(assert (=> bs!6555 m!129959))

(assert (=> b!83380 d!26646))

(declare-fun d!26648 () Bool)

(assert (=> d!26648 (= (remainingBits!0 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))) ((_ sign_extend 32) (currentByte!4226 b1!98)) ((_ sign_extend 32) (currentBit!4221 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4226 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4221 b1!98)))))))

(assert (=> b!83379 d!26648))

(declare-fun d!26650 () Bool)

(declare-fun lt!132963 () (_ BitVec 64))

(declare-fun lt!132964 () (_ BitVec 64))

(assert (=> d!26650 (= (remainingBits!0 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))) ((_ sign_extend 32) (currentByte!4226 b1!98)) ((_ sign_extend 32) (currentBit!4221 b1!98))) (bvsub lt!132963 lt!132964))))

(assert (=> d!26650 (or (= (bvand lt!132963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132964 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132963 lt!132964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26650 (= lt!132964 (bitIndex!0 (size!1742 (buf!2132 b1!98)) (currentByte!4226 b1!98) (currentBit!4221 b1!98)))))

(declare-fun lt!132962 () (_ BitVec 64))

(declare-fun lt!132966 () (_ BitVec 64))

(assert (=> d!26650 (= lt!132963 (bvmul lt!132962 lt!132966))))

(assert (=> d!26650 (or (= lt!132962 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132966 (bvsdiv (bvmul lt!132962 lt!132966) lt!132962)))))

(assert (=> d!26650 (= lt!132966 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26650 (= lt!132962 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))))))

(declare-fun lt!132965 () Unit!5587)

(declare-fun choose!23 (BitStream!3046) Unit!5587)

(assert (=> d!26650 (= lt!132965 (choose!23 b1!98))))

(assert (=> d!26650 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132965)))

(declare-fun bs!6556 () Bool)

(assert (= bs!6556 d!26650))

(assert (=> bs!6556 m!129959))

(assert (=> bs!6556 m!129957))

(declare-fun m!130015 () Bool)

(assert (=> bs!6556 m!130015))

(assert (=> b!83379 d!26650))

(declare-fun d!26660 () Bool)

(assert (=> d!26660 (= (array_inv!1588 (buf!2132 b1!98)) (bvsge (size!1742 (buf!2132 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83378 d!26660))

(declare-fun d!26662 () Bool)

(declare-fun e!55465 () Bool)

(assert (=> d!26662 e!55465))

(declare-fun res!68619 () Bool)

(assert (=> d!26662 (=> (not res!68619) (not e!55465))))

(declare-fun lt!133009 () (_ BitVec 64))

(declare-fun lt!133012 () (_ BitVec 64))

(declare-fun lt!133010 () (_ BitVec 64))

(assert (=> d!26662 (= res!68619 (= lt!133010 (bvsub lt!133012 lt!133009)))))

(assert (=> d!26662 (or (= (bvand lt!133012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133009 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133012 lt!133009) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26662 (= lt!133009 (remainingBits!0 ((_ sign_extend 32) (size!1742 (buf!2132 b2!98))) ((_ sign_extend 32) (currentByte!4226 b2!98)) ((_ sign_extend 32) (currentBit!4221 b2!98))))))

(declare-fun lt!133014 () (_ BitVec 64))

(declare-fun lt!133011 () (_ BitVec 64))

(assert (=> d!26662 (= lt!133012 (bvmul lt!133014 lt!133011))))

(assert (=> d!26662 (or (= lt!133014 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133011 (bvsdiv (bvmul lt!133014 lt!133011) lt!133014)))))

(assert (=> d!26662 (= lt!133011 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26662 (= lt!133014 ((_ sign_extend 32) (size!1742 (buf!2132 b2!98))))))

(assert (=> d!26662 (= lt!133010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4226 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4221 b2!98))))))

(assert (=> d!26662 (invariant!0 (currentBit!4221 b2!98) (currentByte!4226 b2!98) (size!1742 (buf!2132 b2!98)))))

(assert (=> d!26662 (= (bitIndex!0 (size!1742 (buf!2132 b2!98)) (currentByte!4226 b2!98) (currentBit!4221 b2!98)) lt!133010)))

(declare-fun b!83426 () Bool)

(declare-fun res!68618 () Bool)

(assert (=> b!83426 (=> (not res!68618) (not e!55465))))

(assert (=> b!83426 (= res!68618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133010))))

(declare-fun b!83427 () Bool)

(declare-fun lt!133013 () (_ BitVec 64))

(assert (=> b!83427 (= e!55465 (bvsle lt!133010 (bvmul lt!133013 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83427 (or (= lt!133013 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133013 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133013)))))

(assert (=> b!83427 (= lt!133013 ((_ sign_extend 32) (size!1742 (buf!2132 b2!98))))))

(assert (= (and d!26662 res!68619) b!83426))

(assert (= (and b!83426 res!68618) b!83427))

(declare-fun m!130021 () Bool)

(assert (=> d!26662 m!130021))

(assert (=> d!26662 m!130007))

(assert (=> b!83377 d!26662))

(declare-fun d!26680 () Bool)

(declare-fun e!55466 () Bool)

(assert (=> d!26680 e!55466))

(declare-fun res!68621 () Bool)

(assert (=> d!26680 (=> (not res!68621) (not e!55466))))

(declare-fun lt!133016 () (_ BitVec 64))

(declare-fun lt!133015 () (_ BitVec 64))

(declare-fun lt!133018 () (_ BitVec 64))

(assert (=> d!26680 (= res!68621 (= lt!133016 (bvsub lt!133018 lt!133015)))))

(assert (=> d!26680 (or (= (bvand lt!133018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133015 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133018 lt!133015) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26680 (= lt!133015 (remainingBits!0 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))) ((_ sign_extend 32) (currentByte!4226 b1!98)) ((_ sign_extend 32) (currentBit!4221 b1!98))))))

(declare-fun lt!133020 () (_ BitVec 64))

(declare-fun lt!133017 () (_ BitVec 64))

(assert (=> d!26680 (= lt!133018 (bvmul lt!133020 lt!133017))))

(assert (=> d!26680 (or (= lt!133020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133017 (bvsdiv (bvmul lt!133020 lt!133017) lt!133020)))))

(assert (=> d!26680 (= lt!133017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26680 (= lt!133020 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))))))

(assert (=> d!26680 (= lt!133016 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4226 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4221 b1!98))))))

(assert (=> d!26680 (invariant!0 (currentBit!4221 b1!98) (currentByte!4226 b1!98) (size!1742 (buf!2132 b1!98)))))

(assert (=> d!26680 (= (bitIndex!0 (size!1742 (buf!2132 b1!98)) (currentByte!4226 b1!98) (currentBit!4221 b1!98)) lt!133016)))

(declare-fun b!83428 () Bool)

(declare-fun res!68620 () Bool)

(assert (=> b!83428 (=> (not res!68620) (not e!55466))))

(assert (=> b!83428 (= res!68620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133016))))

(declare-fun b!83429 () Bool)

(declare-fun lt!133019 () (_ BitVec 64))

(assert (=> b!83429 (= e!55466 (bvsle lt!133016 (bvmul lt!133019 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83429 (or (= lt!133019 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133019 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133019)))))

(assert (=> b!83429 (= lt!133019 ((_ sign_extend 32) (size!1742 (buf!2132 b1!98))))))

(assert (= (and d!26680 res!68621) b!83428))

(assert (= (and b!83428 res!68620) b!83429))

(assert (=> d!26680 m!129959))

(assert (=> d!26680 m!130005))

(assert (=> b!83377 d!26680))

(push 1)

(assert (not d!26650))

(assert (not d!26646))

(assert (not d!26640))

(assert (not d!26642))

(assert (not d!26680))

(assert (not d!26662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

