; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18906 () Bool)

(assert start!18906)

(declare-fun b!94335 () Bool)

(declare-fun res!77747 () Bool)

(declare-fun e!61903 () Bool)

(assert (=> b!94335 (=> (not res!77747) (not e!61903))))

(declare-datatypes ((array!4414 0))(
  ( (array!4415 (arr!2618 (Array (_ BitVec 32) (_ BitVec 8))) (size!2007 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3524 0))(
  ( (BitStream!3525 (buf!2371 array!4414) (currentByte!4728 (_ BitVec 32)) (currentBit!4723 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3524)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94335 (= res!77747 (bvslt (bitIndex!0 (size!2007 (buf!2371 base!8)) (currentByte!4728 base!8) (currentBit!4723 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94336 () Bool)

(declare-fun res!77743 () Bool)

(assert (=> b!94336 (=> (not res!77743) (not e!61903))))

(declare-fun bitStream1!8 () BitStream!3524)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94336 (= res!77743 (validate_offset_bits!1 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream1!8))) ((_ sign_extend 32) (currentByte!4728 bitStream1!8)) ((_ sign_extend 32) (currentBit!4723 bitStream1!8)) nBits!484))))

(declare-fun b!94337 () Bool)

(declare-fun res!77741 () Bool)

(assert (=> b!94337 (=> (not res!77741) (not e!61903))))

(declare-datatypes ((List!868 0))(
  ( (Nil!865) (Cons!864 (h!983 Bool) (t!1618 List!868)) )
))
(declare-fun listBits!13 () List!868)

(declare-fun length!459 (List!868) Int)

(assert (=> b!94337 (= res!77741 (> (length!459 listBits!13) 0))))

(declare-fun b!94338 () Bool)

(declare-fun e!61901 () Bool)

(declare-fun thiss!1534 () BitStream!3524)

(declare-fun array_inv!1827 (array!4414) Bool)

(assert (=> b!94338 (= e!61901 (array_inv!1827 (buf!2371 thiss!1534)))))

(declare-fun b!94339 () Bool)

(declare-fun res!77746 () Bool)

(assert (=> b!94339 (=> (not res!77746) (not e!61903))))

(declare-fun bitStream2!8 () BitStream!3524)

(assert (=> b!94339 (= res!77746 (and (= (buf!2371 bitStream1!8) (buf!2371 bitStream2!8)) (= (buf!2371 bitStream1!8) (buf!2371 base!8))))))

(declare-fun b!94340 () Bool)

(declare-fun res!77748 () Bool)

(assert (=> b!94340 (=> (not res!77748) (not e!61903))))

(declare-fun isPrefixOf!0 (BitStream!3524 BitStream!3524) Bool)

(assert (=> b!94340 (= res!77748 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94341 () Bool)

(declare-fun res!77750 () Bool)

(assert (=> b!94341 (=> (not res!77750) (not e!61903))))

(assert (=> b!94341 (= res!77750 (validate_offset_bits!1 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream2!8))) ((_ sign_extend 32) (currentByte!4728 bitStream2!8)) ((_ sign_extend 32) (currentBit!4723 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!77742 () Bool)

(assert (=> start!18906 (=> (not res!77742) (not e!61903))))

(assert (=> start!18906 (= res!77742 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18906 e!61903))

(assert (=> start!18906 true))

(declare-fun e!61900 () Bool)

(declare-fun inv!12 (BitStream!3524) Bool)

(assert (=> start!18906 (and (inv!12 bitStream1!8) e!61900)))

(declare-fun e!61907 () Bool)

(assert (=> start!18906 (and (inv!12 bitStream2!8) e!61907)))

(declare-fun e!61908 () Bool)

(assert (=> start!18906 (and (inv!12 base!8) e!61908)))

(assert (=> start!18906 (and (inv!12 thiss!1534) e!61901)))

(declare-fun b!94342 () Bool)

(declare-fun res!77751 () Bool)

(assert (=> b!94342 (=> (not res!77751) (not e!61903))))

(assert (=> b!94342 (= res!77751 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94343 () Bool)

(assert (=> b!94343 (= e!61907 (array_inv!1827 (buf!2371 bitStream2!8)))))

(declare-fun b!94344 () Bool)

(declare-fun res!77749 () Bool)

(assert (=> b!94344 (=> (not res!77749) (not e!61903))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3524 BitStream!3524 (_ BitVec 64)) List!868)

(assert (=> b!94344 (= res!77749 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94345 () Bool)

(declare-fun res!77744 () Bool)

(assert (=> b!94345 (=> (not res!77744) (not e!61903))))

(assert (=> b!94345 (= res!77744 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94346 () Bool)

(assert (=> b!94346 (= e!61903 (and (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (= listBits!13 Nil!865)))))

(declare-fun b!94347 () Bool)

(assert (=> b!94347 (= e!61900 (array_inv!1827 (buf!2371 bitStream1!8)))))

(declare-fun b!94348 () Bool)

(assert (=> b!94348 (= e!61908 (array_inv!1827 (buf!2371 base!8)))))

(declare-fun b!94349 () Bool)

(declare-fun res!77745 () Bool)

(assert (=> b!94349 (=> (not res!77745) (not e!61903))))

(assert (=> b!94349 (= res!77745 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2007 (buf!2371 bitStream1!8)) (currentByte!4728 bitStream1!8) (currentBit!4723 bitStream1!8))) (bitIndex!0 (size!2007 (buf!2371 bitStream2!8)) (currentByte!4728 bitStream2!8) (currentBit!4723 bitStream2!8))))))

(assert (= (and start!18906 res!77742) b!94337))

(assert (= (and b!94337 res!77741) b!94342))

(assert (= (and b!94342 res!77751) b!94345))

(assert (= (and b!94345 res!77744) b!94340))

(assert (= (and b!94340 res!77748) b!94339))

(assert (= (and b!94339 res!77746) b!94335))

(assert (= (and b!94335 res!77747) b!94349))

(assert (= (and b!94349 res!77745) b!94336))

(assert (= (and b!94336 res!77743) b!94341))

(assert (= (and b!94341 res!77750) b!94344))

(assert (= (and b!94344 res!77749) b!94346))

(assert (= start!18906 b!94347))

(assert (= start!18906 b!94343))

(assert (= start!18906 b!94348))

(assert (= start!18906 b!94338))

(declare-fun m!137951 () Bool)

(assert (=> b!94342 m!137951))

(declare-fun m!137953 () Bool)

(assert (=> b!94335 m!137953))

(declare-fun m!137955 () Bool)

(assert (=> b!94336 m!137955))

(declare-fun m!137957 () Bool)

(assert (=> b!94345 m!137957))

(declare-fun m!137959 () Bool)

(assert (=> start!18906 m!137959))

(declare-fun m!137961 () Bool)

(assert (=> start!18906 m!137961))

(declare-fun m!137963 () Bool)

(assert (=> start!18906 m!137963))

(declare-fun m!137965 () Bool)

(assert (=> start!18906 m!137965))

(declare-fun m!137967 () Bool)

(assert (=> b!94349 m!137967))

(declare-fun m!137969 () Bool)

(assert (=> b!94349 m!137969))

(declare-fun m!137971 () Bool)

(assert (=> b!94348 m!137971))

(declare-fun m!137973 () Bool)

(assert (=> b!94341 m!137973))

(declare-fun m!137975 () Bool)

(assert (=> b!94344 m!137975))

(declare-fun m!137977 () Bool)

(assert (=> b!94347 m!137977))

(declare-fun m!137979 () Bool)

(assert (=> b!94343 m!137979))

(declare-fun m!137981 () Bool)

(assert (=> b!94338 m!137981))

(declare-fun m!137983 () Bool)

(assert (=> b!94337 m!137983))

(declare-fun m!137985 () Bool)

(assert (=> b!94340 m!137985))

(push 1)

(assert (not b!94338))

(assert (not b!94345))

(assert (not b!94348))

(assert (not b!94344))

(assert (not b!94340))

(assert (not start!18906))

(assert (not b!94335))

(assert (not b!94337))

(assert (not b!94342))

(assert (not b!94343))

(assert (not b!94336))

(assert (not b!94347))

(assert (not b!94341))

(assert (not b!94349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29368 () Bool)

(assert (=> d!29368 (= (array_inv!1827 (buf!2371 thiss!1534)) (bvsge (size!2007 (buf!2371 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94338 d!29368))

(declare-fun d!29372 () Bool)

(declare-fun e!61940 () Bool)

(assert (=> d!29372 e!61940))

(declare-fun res!77794 () Bool)

(assert (=> d!29372 (=> (not res!77794) (not e!61940))))

(declare-fun lt!138770 () (_ BitVec 64))

(declare-fun lt!138769 () (_ BitVec 64))

(declare-fun lt!138768 () (_ BitVec 64))

(assert (=> d!29372 (= res!77794 (= lt!138770 (bvsub lt!138768 lt!138769)))))

(assert (=> d!29372 (or (= (bvand lt!138768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138769 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138768 lt!138769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29372 (= lt!138769 (remainingBits!0 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream1!8))) ((_ sign_extend 32) (currentByte!4728 bitStream1!8)) ((_ sign_extend 32) (currentBit!4723 bitStream1!8))))))

(declare-fun lt!138767 () (_ BitVec 64))

(declare-fun lt!138771 () (_ BitVec 64))

(assert (=> d!29372 (= lt!138768 (bvmul lt!138767 lt!138771))))

(assert (=> d!29372 (or (= lt!138767 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138771 (bvsdiv (bvmul lt!138767 lt!138771) lt!138767)))))

(assert (=> d!29372 (= lt!138771 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29372 (= lt!138767 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream1!8))))))

(assert (=> d!29372 (= lt!138770 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4728 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4723 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29372 (invariant!0 (currentBit!4723 bitStream1!8) (currentByte!4728 bitStream1!8) (size!2007 (buf!2371 bitStream1!8)))))

(assert (=> d!29372 (= (bitIndex!0 (size!2007 (buf!2371 bitStream1!8)) (currentByte!4728 bitStream1!8) (currentBit!4723 bitStream1!8)) lt!138770)))

(declare-fun b!94403 () Bool)

(declare-fun res!77793 () Bool)

(assert (=> b!94403 (=> (not res!77793) (not e!61940))))

(assert (=> b!94403 (= res!77793 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138770))))

(declare-fun b!94404 () Bool)

(declare-fun lt!138766 () (_ BitVec 64))

(assert (=> b!94404 (= e!61940 (bvsle lt!138770 (bvmul lt!138766 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94404 (or (= lt!138766 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138766 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138766)))))

(assert (=> b!94404 (= lt!138766 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream1!8))))))

(assert (= (and d!29372 res!77794) b!94403))

(assert (= (and b!94403 res!77793) b!94404))

(declare-fun m!138023 () Bool)

(assert (=> d!29372 m!138023))

(declare-fun m!138025 () Bool)

(assert (=> d!29372 m!138025))

(assert (=> b!94349 d!29372))

(declare-fun d!29376 () Bool)

(declare-fun e!61941 () Bool)

(assert (=> d!29376 e!61941))

(declare-fun res!77796 () Bool)

(assert (=> d!29376 (=> (not res!77796) (not e!61941))))

(declare-fun lt!138777 () (_ BitVec 64))

(declare-fun lt!138776 () (_ BitVec 64))

(declare-fun lt!138778 () (_ BitVec 64))

(assert (=> d!29376 (= res!77796 (= lt!138778 (bvsub lt!138776 lt!138777)))))

(assert (=> d!29376 (or (= (bvand lt!138776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138777 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138776 lt!138777) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29376 (= lt!138777 (remainingBits!0 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream2!8))) ((_ sign_extend 32) (currentByte!4728 bitStream2!8)) ((_ sign_extend 32) (currentBit!4723 bitStream2!8))))))

(declare-fun lt!138775 () (_ BitVec 64))

(declare-fun lt!138779 () (_ BitVec 64))

(assert (=> d!29376 (= lt!138776 (bvmul lt!138775 lt!138779))))

(assert (=> d!29376 (or (= lt!138775 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138779 (bvsdiv (bvmul lt!138775 lt!138779) lt!138775)))))

(assert (=> d!29376 (= lt!138779 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29376 (= lt!138775 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream2!8))))))

(assert (=> d!29376 (= lt!138778 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4728 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4723 bitStream2!8))))))

(assert (=> d!29376 (invariant!0 (currentBit!4723 bitStream2!8) (currentByte!4728 bitStream2!8) (size!2007 (buf!2371 bitStream2!8)))))

(assert (=> d!29376 (= (bitIndex!0 (size!2007 (buf!2371 bitStream2!8)) (currentByte!4728 bitStream2!8) (currentBit!4723 bitStream2!8)) lt!138778)))

(declare-fun b!94407 () Bool)

(declare-fun res!77795 () Bool)

(assert (=> b!94407 (=> (not res!77795) (not e!61941))))

(assert (=> b!94407 (= res!77795 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138778))))

(declare-fun b!94408 () Bool)

(declare-fun lt!138774 () (_ BitVec 64))

(assert (=> b!94408 (= e!61941 (bvsle lt!138778 (bvmul lt!138774 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94408 (or (= lt!138774 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138774 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138774)))))

(assert (=> b!94408 (= lt!138774 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream2!8))))))

(assert (= (and d!29376 res!77796) b!94407))

(assert (= (and b!94407 res!77795) b!94408))

(declare-fun m!138027 () Bool)

(assert (=> d!29376 m!138027))

(declare-fun m!138029 () Bool)

(assert (=> d!29376 m!138029))

(assert (=> b!94349 d!29376))

(declare-fun d!29378 () Bool)

(assert (=> d!29378 (= (array_inv!1827 (buf!2371 bitStream1!8)) (bvsge (size!2007 (buf!2371 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!94347 d!29378))

(declare-fun d!29380 () Bool)

(declare-fun size!2009 (List!868) Int)

(assert (=> d!29380 (= (length!459 listBits!13) (size!2009 listBits!13))))

(declare-fun bs!7225 () Bool)

(assert (= bs!7225 d!29380))

(declare-fun m!138031 () Bool)

(assert (=> bs!7225 m!138031))

(assert (=> b!94337 d!29380))

(declare-fun d!29382 () Bool)

(assert (=> d!29382 (= (array_inv!1827 (buf!2371 base!8)) (bvsge (size!2007 (buf!2371 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94348 d!29382))

(declare-fun d!29384 () Bool)

(assert (=> d!29384 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream2!8))) ((_ sign_extend 32) (currentByte!4728 bitStream2!8)) ((_ sign_extend 32) (currentBit!4723 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream2!8))) ((_ sign_extend 32) (currentByte!4728 bitStream2!8)) ((_ sign_extend 32) (currentBit!4723 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7226 () Bool)

(assert (= bs!7226 d!29384))

(assert (=> bs!7226 m!138027))

(assert (=> b!94341 d!29384))

(declare-fun d!29386 () Bool)

(declare-fun res!77807 () Bool)

(declare-fun e!61954 () Bool)

(assert (=> d!29386 (=> (not res!77807) (not e!61954))))

(assert (=> d!29386 (= res!77807 (= (size!2007 (buf!2371 bitStream1!8)) (size!2007 (buf!2371 bitStream2!8))))))

(assert (=> d!29386 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61954)))

(declare-fun b!94428 () Bool)

(declare-fun res!77808 () Bool)

(assert (=> b!94428 (=> (not res!77808) (not e!61954))))

(assert (=> b!94428 (= res!77808 (bvsle (bitIndex!0 (size!2007 (buf!2371 bitStream1!8)) (currentByte!4728 bitStream1!8) (currentBit!4723 bitStream1!8)) (bitIndex!0 (size!2007 (buf!2371 bitStream2!8)) (currentByte!4728 bitStream2!8) (currentBit!4723 bitStream2!8))))))

(declare-fun b!94429 () Bool)

(declare-fun e!61955 () Bool)

(assert (=> b!94429 (= e!61954 e!61955)))

(declare-fun res!77806 () Bool)

(assert (=> b!94429 (=> res!77806 e!61955)))

(assert (=> b!94429 (= res!77806 (= (size!2007 (buf!2371 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94430 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4414 array!4414 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94430 (= e!61955 (arrayBitRangesEq!0 (buf!2371 bitStream1!8) (buf!2371 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2007 (buf!2371 bitStream1!8)) (currentByte!4728 bitStream1!8) (currentBit!4723 bitStream1!8))))))

(assert (= (and d!29386 res!77807) b!94428))

(assert (= (and b!94428 res!77808) b!94429))

(assert (= (and b!94429 (not res!77806)) b!94430))

(assert (=> b!94428 m!137967))

(assert (=> b!94428 m!137969))

(assert (=> b!94430 m!137967))

(assert (=> b!94430 m!137967))

(declare-fun m!138045 () Bool)

(assert (=> b!94430 m!138045))

(assert (=> b!94340 d!29386))

(declare-fun d!29394 () Bool)

(assert (=> d!29394 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4723 bitStream1!8) (currentByte!4728 bitStream1!8) (size!2007 (buf!2371 bitStream1!8))))))

(declare-fun bs!7228 () Bool)

(assert (= bs!7228 d!29394))

(assert (=> bs!7228 m!138025))

(assert (=> start!18906 d!29394))

(declare-fun d!29396 () Bool)

(assert (=> d!29396 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4723 bitStream2!8) (currentByte!4728 bitStream2!8) (size!2007 (buf!2371 bitStream2!8))))))

(declare-fun bs!7229 () Bool)

(assert (= bs!7229 d!29396))

(assert (=> bs!7229 m!138029))

(assert (=> start!18906 d!29396))

(declare-fun d!29398 () Bool)

(assert (=> d!29398 (= (inv!12 base!8) (invariant!0 (currentBit!4723 base!8) (currentByte!4728 base!8) (size!2007 (buf!2371 base!8))))))

(declare-fun bs!7230 () Bool)

(assert (= bs!7230 d!29398))

(declare-fun m!138047 () Bool)

(assert (=> bs!7230 m!138047))

(assert (=> start!18906 d!29398))

(declare-fun d!29400 () Bool)

(assert (=> d!29400 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4723 thiss!1534) (currentByte!4728 thiss!1534) (size!2007 (buf!2371 thiss!1534))))))

(declare-fun bs!7231 () Bool)

(assert (= bs!7231 d!29400))

(declare-fun m!138049 () Bool)

(assert (=> bs!7231 m!138049))

(assert (=> start!18906 d!29400))

(declare-fun d!29402 () Bool)

(assert (=> d!29402 (= (array_inv!1827 (buf!2371 bitStream2!8)) (bvsge (size!2007 (buf!2371 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94343 d!29402))

(declare-datatypes ((tuple2!7650 0))(
  ( (tuple2!7651 (_1!4072 Bool) (_2!4072 BitStream!3524)) )
))
(declare-fun lt!138823 () tuple2!7650)

(declare-fun b!94450 () Bool)

(declare-datatypes ((tuple2!7652 0))(
  ( (tuple2!7653 (_1!4073 List!868) (_2!4073 BitStream!3524)) )
))
(declare-fun e!61966 () tuple2!7652)

(declare-fun lt!138825 () (_ BitVec 64))

(assert (=> b!94450 (= e!61966 (tuple2!7653 (Cons!864 (_1!4072 lt!138823) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4072 lt!138823) (bvsub nBits!484 lt!138825))) (_2!4072 lt!138823)))))

(declare-fun readBit!0 (BitStream!3524) tuple2!7650)

(assert (=> b!94450 (= lt!138823 (readBit!0 bitStream1!8))))

(assert (=> b!94450 (= lt!138825 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!94452 () Bool)

(declare-fun e!61965 () Bool)

(declare-fun lt!138824 () List!868)

(assert (=> b!94452 (= e!61965 (> (length!459 lt!138824) 0))))

(declare-fun b!94449 () Bool)

(assert (=> b!94449 (= e!61966 (tuple2!7653 Nil!865 bitStream1!8))))

(declare-fun d!29404 () Bool)

(assert (=> d!29404 e!61965))

(declare-fun c!5955 () Bool)

(assert (=> d!29404 (= c!5955 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29404 (= lt!138824 (_1!4073 e!61966))))

(declare-fun c!5954 () Bool)

(assert (=> d!29404 (= c!5954 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29404 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29404 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138824)))

(declare-fun b!94451 () Bool)

(declare-fun isEmpty!255 (List!868) Bool)

(assert (=> b!94451 (= e!61965 (isEmpty!255 lt!138824))))

(assert (= (and d!29404 c!5954) b!94449))

(assert (= (and d!29404 (not c!5954)) b!94450))

(assert (= (and d!29404 c!5955) b!94451))

(assert (= (and d!29404 (not c!5955)) b!94452))

(declare-fun m!138061 () Bool)

(assert (=> b!94450 m!138061))

(declare-fun m!138063 () Bool)

(assert (=> b!94450 m!138063))

(declare-fun m!138065 () Bool)

(assert (=> b!94452 m!138065))

(declare-fun m!138067 () Bool)

(assert (=> b!94451 m!138067))

(assert (=> b!94344 d!29404))

(declare-fun d!29418 () Bool)

(declare-fun res!77820 () Bool)

(declare-fun e!61967 () Bool)

(assert (=> d!29418 (=> (not res!77820) (not e!61967))))

(assert (=> d!29418 (= res!77820 (= (size!2007 (buf!2371 bitStream1!8)) (size!2007 (buf!2371 base!8))))))

(assert (=> d!29418 (= (isPrefixOf!0 bitStream1!8 base!8) e!61967)))

(declare-fun b!94453 () Bool)

(declare-fun res!77821 () Bool)

(assert (=> b!94453 (=> (not res!77821) (not e!61967))))

(assert (=> b!94453 (= res!77821 (bvsle (bitIndex!0 (size!2007 (buf!2371 bitStream1!8)) (currentByte!4728 bitStream1!8) (currentBit!4723 bitStream1!8)) (bitIndex!0 (size!2007 (buf!2371 base!8)) (currentByte!4728 base!8) (currentBit!4723 base!8))))))

(declare-fun b!94454 () Bool)

(declare-fun e!61968 () Bool)

(assert (=> b!94454 (= e!61967 e!61968)))

(declare-fun res!77819 () Bool)

(assert (=> b!94454 (=> res!77819 e!61968)))

(assert (=> b!94454 (= res!77819 (= (size!2007 (buf!2371 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94455 () Bool)

(assert (=> b!94455 (= e!61968 (arrayBitRangesEq!0 (buf!2371 bitStream1!8) (buf!2371 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2007 (buf!2371 bitStream1!8)) (currentByte!4728 bitStream1!8) (currentBit!4723 bitStream1!8))))))

(assert (= (and d!29418 res!77820) b!94453))

(assert (= (and b!94453 res!77821) b!94454))

(assert (= (and b!94454 (not res!77819)) b!94455))

(assert (=> b!94453 m!137967))

(assert (=> b!94453 m!137953))

(assert (=> b!94455 m!137967))

(assert (=> b!94455 m!137967))

(declare-fun m!138071 () Bool)

(assert (=> b!94455 m!138071))

(assert (=> b!94342 d!29418))

(declare-fun d!29426 () Bool)

(declare-fun e!61969 () Bool)

(assert (=> d!29426 e!61969))

(declare-fun res!77823 () Bool)

(assert (=> d!29426 (=> (not res!77823) (not e!61969))))

(declare-fun lt!138828 () (_ BitVec 64))

(declare-fun lt!138829 () (_ BitVec 64))

(declare-fun lt!138830 () (_ BitVec 64))

(assert (=> d!29426 (= res!77823 (= lt!138830 (bvsub lt!138828 lt!138829)))))

(assert (=> d!29426 (or (= (bvand lt!138828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138829 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138828 lt!138829) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29426 (= lt!138829 (remainingBits!0 ((_ sign_extend 32) (size!2007 (buf!2371 base!8))) ((_ sign_extend 32) (currentByte!4728 base!8)) ((_ sign_extend 32) (currentBit!4723 base!8))))))

(declare-fun lt!138827 () (_ BitVec 64))

(declare-fun lt!138831 () (_ BitVec 64))

(assert (=> d!29426 (= lt!138828 (bvmul lt!138827 lt!138831))))

(assert (=> d!29426 (or (= lt!138827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138831 (bvsdiv (bvmul lt!138827 lt!138831) lt!138827)))))

(assert (=> d!29426 (= lt!138831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29426 (= lt!138827 ((_ sign_extend 32) (size!2007 (buf!2371 base!8))))))

(assert (=> d!29426 (= lt!138830 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4728 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4723 base!8))))))

(assert (=> d!29426 (invariant!0 (currentBit!4723 base!8) (currentByte!4728 base!8) (size!2007 (buf!2371 base!8)))))

(assert (=> d!29426 (= (bitIndex!0 (size!2007 (buf!2371 base!8)) (currentByte!4728 base!8) (currentBit!4723 base!8)) lt!138830)))

(declare-fun b!94456 () Bool)

(declare-fun res!77822 () Bool)

(assert (=> b!94456 (=> (not res!77822) (not e!61969))))

(assert (=> b!94456 (= res!77822 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138830))))

(declare-fun b!94457 () Bool)

(declare-fun lt!138826 () (_ BitVec 64))

(assert (=> b!94457 (= e!61969 (bvsle lt!138830 (bvmul lt!138826 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94457 (or (= lt!138826 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138826 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138826)))))

(assert (=> b!94457 (= lt!138826 ((_ sign_extend 32) (size!2007 (buf!2371 base!8))))))

(assert (= (and d!29426 res!77823) b!94456))

(assert (= (and b!94456 res!77822) b!94457))

(declare-fun m!138073 () Bool)

(assert (=> d!29426 m!138073))

(assert (=> d!29426 m!138047))

(assert (=> b!94335 d!29426))

(declare-fun d!29428 () Bool)

(assert (=> d!29428 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream1!8))) ((_ sign_extend 32) (currentByte!4728 bitStream1!8)) ((_ sign_extend 32) (currentBit!4723 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2007 (buf!2371 bitStream1!8))) ((_ sign_extend 32) (currentByte!4728 bitStream1!8)) ((_ sign_extend 32) (currentBit!4723 bitStream1!8))) nBits!484))))

(declare-fun bs!7237 () Bool)

(assert (= bs!7237 d!29428))

(assert (=> bs!7237 m!138023))

(assert (=> b!94336 d!29428))

(declare-fun d!29430 () Bool)

(declare-fun res!77825 () Bool)

(declare-fun e!61970 () Bool)

(assert (=> d!29430 (=> (not res!77825) (not e!61970))))

(assert (=> d!29430 (= res!77825 (= (size!2007 (buf!2371 bitStream2!8)) (size!2007 (buf!2371 base!8))))))

(assert (=> d!29430 (= (isPrefixOf!0 bitStream2!8 base!8) e!61970)))

(declare-fun b!94458 () Bool)

(declare-fun res!77826 () Bool)

(assert (=> b!94458 (=> (not res!77826) (not e!61970))))

(assert (=> b!94458 (= res!77826 (bvsle (bitIndex!0 (size!2007 (buf!2371 bitStream2!8)) (currentByte!4728 bitStream2!8) (currentBit!4723 bitStream2!8)) (bitIndex!0 (size!2007 (buf!2371 base!8)) (currentByte!4728 base!8) (currentBit!4723 base!8))))))

(declare-fun b!94459 () Bool)

(declare-fun e!61971 () Bool)

(assert (=> b!94459 (= e!61970 e!61971)))

(declare-fun res!77824 () Bool)

(assert (=> b!94459 (=> res!77824 e!61971)))

(assert (=> b!94459 (= res!77824 (= (size!2007 (buf!2371 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94460 () Bool)

(assert (=> b!94460 (= e!61971 (arrayBitRangesEq!0 (buf!2371 bitStream2!8) (buf!2371 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2007 (buf!2371 bitStream2!8)) (currentByte!4728 bitStream2!8) (currentBit!4723 bitStream2!8))))))

(assert (= (and d!29430 res!77825) b!94458))

(assert (= (and b!94458 res!77826) b!94459))

(assert (= (and b!94459 (not res!77824)) b!94460))

(assert (=> b!94458 m!137969))

(assert (=> b!94458 m!137953))

(assert (=> b!94460 m!137969))

(assert (=> b!94460 m!137969))

(declare-fun m!138075 () Bool)

(assert (=> b!94460 m!138075))

(assert (=> b!94345 d!29430))

(push 1)

(assert (not b!94452))

(assert (not b!94428))

(assert (not d!29428))

(assert (not b!94453))

(assert (not b!94455))

(assert (not d!29376))

(assert (not b!94430))

(assert (not d!29380))

(assert (not d!29396))

(assert (not d!29384))

(assert (not d!29372))

(assert (not b!94458))

(assert (not b!94451))

(assert (not b!94450))

(assert (not d!29394))

(assert (not d!29400))

(assert (not d!29398))

(assert (not d!29426))

(assert (not b!94460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

