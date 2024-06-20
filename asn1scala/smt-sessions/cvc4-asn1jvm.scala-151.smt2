; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3524 () Bool)

(assert start!3524)

(declare-fun b!15423 () Bool)

(declare-fun e!9653 () Bool)

(declare-datatypes ((array!931 0))(
  ( (array!932 (arr!825 (Array (_ BitVec 32) (_ BitVec 8))) (size!396 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!752 0))(
  ( (BitStream!753 (buf!753 array!931) (currentByte!1916 (_ BitVec 32)) (currentBit!1911 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1850 0))(
  ( (tuple2!1851 (_1!986 BitStream!752) (_2!986 Bool)) )
))
(declare-fun lt!23372 () tuple2!1850)

(declare-datatypes ((tuple2!1852 0))(
  ( (tuple2!1853 (_1!987 BitStream!752) (_2!987 BitStream!752)) )
))
(declare-fun lt!23369 () tuple2!1852)

(assert (=> b!15423 (= e!9653 (not (or (not (_2!986 lt!23372)) (not (= (_1!986 lt!23372) (_2!987 lt!23369))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!752 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1850)

(assert (=> b!15423 (= lt!23372 (checkBitsLoopPure!0 (_1!987 lt!23369) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1280 0))(
  ( (Unit!1281) )
))
(declare-datatypes ((tuple2!1854 0))(
  ( (tuple2!1855 (_1!988 Unit!1280) (_2!988 BitStream!752)) )
))
(declare-fun lt!23366 () tuple2!1854)

(declare-fun thiss!1073 () BitStream!752)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15423 (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23366)))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073)) nBits!313)))

(declare-fun lt!23373 () Unit!1280)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!752 array!931 (_ BitVec 64)) Unit!1280)

(assert (=> b!15423 (= lt!23373 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!753 (_2!988 lt!23366)) nBits!313))))

(declare-fun reader!0 (BitStream!752 BitStream!752) tuple2!1852)

(assert (=> b!15423 (= lt!23369 (reader!0 thiss!1073 (_2!988 lt!23366)))))

(declare-fun res!14355 () Bool)

(declare-fun e!9654 () Bool)

(assert (=> start!3524 (=> (not res!14355) (not e!9654))))

(assert (=> start!3524 (= res!14355 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3524 e!9654))

(assert (=> start!3524 true))

(declare-fun e!9652 () Bool)

(declare-fun inv!12 (BitStream!752) Bool)

(assert (=> start!3524 (and (inv!12 thiss!1073) e!9652)))

(declare-fun b!15424 () Bool)

(declare-fun array_inv!385 (array!931) Bool)

(assert (=> b!15424 (= e!9652 (array_inv!385 (buf!753 thiss!1073)))))

(declare-fun b!15425 () Bool)

(declare-fun res!14353 () Bool)

(assert (=> b!15425 (=> (not res!14353) (not e!9654))))

(assert (=> b!15425 (= res!14353 (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 thiss!1073))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073)) nBits!313))))

(declare-fun b!15426 () Bool)

(declare-fun res!14356 () Bool)

(assert (=> b!15426 (=> (not res!14356) (not e!9653))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15426 (= res!14356 (= (bitIndex!0 (size!396 (buf!753 (_2!988 lt!23366))) (currentByte!1916 (_2!988 lt!23366)) (currentBit!1911 (_2!988 lt!23366))) (bvadd (bitIndex!0 (size!396 (buf!753 thiss!1073)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073)) nBits!313)))))

(declare-fun b!15427 () Bool)

(declare-fun lt!23367 () tuple2!1852)

(assert (=> b!15427 (= e!9654 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 (_1!987 lt!23367)))) ((_ sign_extend 32) (currentByte!1916 (_1!987 lt!23367))) ((_ sign_extend 32) (currentBit!1911 (_1!987 lt!23367))) nBits!313)))))

(assert (=> b!15427 (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23366)))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073)) nBits!313)))

(declare-fun lt!23370 () Unit!1280)

(assert (=> b!15427 (= lt!23370 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!753 (_2!988 lt!23366)) nBits!313))))

(assert (=> b!15427 (= lt!23367 (reader!0 thiss!1073 (_2!988 lt!23366)))))

(declare-fun lt!23374 () Bool)

(declare-fun isPrefixOf!0 (BitStream!752 BitStream!752) Bool)

(assert (=> b!15427 (= lt!23374 (isPrefixOf!0 thiss!1073 (_2!988 lt!23366)))))

(declare-fun lt!23371 () (_ BitVec 64))

(assert (=> b!15427 (= lt!23371 (bitIndex!0 (size!396 (buf!753 (_2!988 lt!23366))) (currentByte!1916 (_2!988 lt!23366)) (currentBit!1911 (_2!988 lt!23366))))))

(declare-fun lt!23368 () (_ BitVec 64))

(assert (=> b!15427 (= lt!23368 (bitIndex!0 (size!396 (buf!753 thiss!1073)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073)))))

(assert (=> b!15427 e!9653))

(declare-fun res!14354 () Bool)

(assert (=> b!15427 (=> (not res!14354) (not e!9653))))

(assert (=> b!15427 (= res!14354 (= (size!396 (buf!753 thiss!1073)) (size!396 (buf!753 (_2!988 lt!23366)))))))

(declare-fun appendNBits!0 (BitStream!752 (_ BitVec 64) Bool) tuple2!1854)

(assert (=> b!15427 (= lt!23366 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15428 () Bool)

(declare-fun res!14357 () Bool)

(assert (=> b!15428 (=> (not res!14357) (not e!9653))))

(assert (=> b!15428 (= res!14357 (isPrefixOf!0 thiss!1073 (_2!988 lt!23366)))))

(assert (= (and start!3524 res!14355) b!15425))

(assert (= (and b!15425 res!14353) b!15427))

(assert (= (and b!15427 res!14354) b!15426))

(assert (= (and b!15426 res!14356) b!15428))

(assert (= (and b!15428 res!14357) b!15423))

(assert (= start!3524 b!15424))

(declare-fun m!22065 () Bool)

(assert (=> b!15428 m!22065))

(declare-fun m!22067 () Bool)

(assert (=> b!15425 m!22067))

(declare-fun m!22069 () Bool)

(assert (=> b!15426 m!22069))

(declare-fun m!22071 () Bool)

(assert (=> b!15426 m!22071))

(declare-fun m!22073 () Bool)

(assert (=> b!15423 m!22073))

(declare-fun m!22075 () Bool)

(assert (=> b!15423 m!22075))

(declare-fun m!22077 () Bool)

(assert (=> b!15423 m!22077))

(declare-fun m!22079 () Bool)

(assert (=> b!15423 m!22079))

(assert (=> b!15427 m!22071))

(assert (=> b!15427 m!22075))

(declare-fun m!22081 () Bool)

(assert (=> b!15427 m!22081))

(assert (=> b!15427 m!22065))

(assert (=> b!15427 m!22069))

(assert (=> b!15427 m!22077))

(assert (=> b!15427 m!22079))

(declare-fun m!22083 () Bool)

(assert (=> b!15427 m!22083))

(declare-fun m!22085 () Bool)

(assert (=> start!3524 m!22085))

(declare-fun m!22087 () Bool)

(assert (=> b!15424 m!22087))

(push 1)

(assert (not b!15424))

(assert (not b!15427))

(assert (not b!15423))

(assert (not b!15425))

(assert (not start!3524))

(assert (not b!15428))

(assert (not b!15426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5008 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5008 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1911 thiss!1073) (currentByte!1916 thiss!1073) (size!396 (buf!753 thiss!1073))))))

(declare-fun bs!1396 () Bool)

(assert (= bs!1396 d!5008))

(declare-fun m!22091 () Bool)

(assert (=> bs!1396 m!22091))

(assert (=> start!3524 d!5008))

(declare-fun d!5012 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5012 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 thiss!1073))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!396 (buf!753 thiss!1073))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073))) nBits!313))))

(declare-fun bs!1397 () Bool)

(assert (= bs!1397 d!5012))

(declare-fun m!22093 () Bool)

(assert (=> bs!1397 m!22093))

(assert (=> b!15425 d!5012))

(declare-fun d!5014 () Bool)

(declare-fun e!9657 () Bool)

(assert (=> d!5014 e!9657))

(declare-fun res!14363 () Bool)

(assert (=> d!5014 (=> (not res!14363) (not e!9657))))

(declare-fun lt!23394 () (_ BitVec 64))

(declare-fun lt!23391 () (_ BitVec 64))

(declare-fun lt!23393 () (_ BitVec 64))

(assert (=> d!5014 (= res!14363 (= lt!23393 (bvsub lt!23391 lt!23394)))))

(assert (=> d!5014 (or (= (bvand lt!23391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23391 lt!23394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5014 (= lt!23394 (remainingBits!0 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23366)))) ((_ sign_extend 32) (currentByte!1916 (_2!988 lt!23366))) ((_ sign_extend 32) (currentBit!1911 (_2!988 lt!23366)))))))

(declare-fun lt!23395 () (_ BitVec 64))

(declare-fun lt!23392 () (_ BitVec 64))

(assert (=> d!5014 (= lt!23391 (bvmul lt!23395 lt!23392))))

(assert (=> d!5014 (or (= lt!23395 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23392 (bvsdiv (bvmul lt!23395 lt!23392) lt!23395)))))

(assert (=> d!5014 (= lt!23392 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5014 (= lt!23395 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23366)))))))

(assert (=> d!5014 (= lt!23393 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1916 (_2!988 lt!23366))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1911 (_2!988 lt!23366)))))))

(assert (=> d!5014 (invariant!0 (currentBit!1911 (_2!988 lt!23366)) (currentByte!1916 (_2!988 lt!23366)) (size!396 (buf!753 (_2!988 lt!23366))))))

(assert (=> d!5014 (= (bitIndex!0 (size!396 (buf!753 (_2!988 lt!23366))) (currentByte!1916 (_2!988 lt!23366)) (currentBit!1911 (_2!988 lt!23366))) lt!23393)))

(declare-fun b!15433 () Bool)

(declare-fun res!14362 () Bool)

(assert (=> b!15433 (=> (not res!14362) (not e!9657))))

(assert (=> b!15433 (= res!14362 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23393))))

(declare-fun b!15434 () Bool)

(declare-fun lt!23390 () (_ BitVec 64))

(assert (=> b!15434 (= e!9657 (bvsle lt!23393 (bvmul lt!23390 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15434 (or (= lt!23390 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23390 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23390)))))

(assert (=> b!15434 (= lt!23390 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23366)))))))

(assert (= (and d!5014 res!14363) b!15433))

(assert (= (and b!15433 res!14362) b!15434))

(declare-fun m!22103 () Bool)

(assert (=> d!5014 m!22103))

(declare-fun m!22105 () Bool)

(assert (=> d!5014 m!22105))

(assert (=> b!15426 d!5014))

(declare-fun d!5026 () Bool)

(declare-fun e!9658 () Bool)

(assert (=> d!5026 e!9658))

(declare-fun res!14365 () Bool)

(assert (=> d!5026 (=> (not res!14365) (not e!9658))))

(declare-fun lt!23397 () (_ BitVec 64))

(declare-fun lt!23400 () (_ BitVec 64))

(declare-fun lt!23399 () (_ BitVec 64))

(assert (=> d!5026 (= res!14365 (= lt!23399 (bvsub lt!23397 lt!23400)))))

(assert (=> d!5026 (or (= (bvand lt!23397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23397 lt!23400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5026 (= lt!23400 (remainingBits!0 ((_ sign_extend 32) (size!396 (buf!753 thiss!1073))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073))))))

(declare-fun lt!23401 () (_ BitVec 64))

(declare-fun lt!23398 () (_ BitVec 64))

(assert (=> d!5026 (= lt!23397 (bvmul lt!23401 lt!23398))))

(assert (=> d!5026 (or (= lt!23401 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23398 (bvsdiv (bvmul lt!23401 lt!23398) lt!23401)))))

(assert (=> d!5026 (= lt!23398 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5026 (= lt!23401 ((_ sign_extend 32) (size!396 (buf!753 thiss!1073))))))

(assert (=> d!5026 (= lt!23399 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1916 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1911 thiss!1073))))))

(assert (=> d!5026 (invariant!0 (currentBit!1911 thiss!1073) (currentByte!1916 thiss!1073) (size!396 (buf!753 thiss!1073)))))

(assert (=> d!5026 (= (bitIndex!0 (size!396 (buf!753 thiss!1073)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073)) lt!23399)))

(declare-fun b!15435 () Bool)

(declare-fun res!14364 () Bool)

(assert (=> b!15435 (=> (not res!14364) (not e!9658))))

(assert (=> b!15435 (= res!14364 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23399))))

(declare-fun b!15436 () Bool)

(declare-fun lt!23396 () (_ BitVec 64))

(assert (=> b!15436 (= e!9658 (bvsle lt!23399 (bvmul lt!23396 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15436 (or (= lt!23396 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23396 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23396)))))

(assert (=> b!15436 (= lt!23396 ((_ sign_extend 32) (size!396 (buf!753 thiss!1073))))))

(assert (= (and d!5026 res!14365) b!15435))

(assert (= (and b!15435 res!14364) b!15436))

(assert (=> d!5026 m!22093))

(assert (=> d!5026 m!22091))

(assert (=> b!15426 d!5026))

(declare-fun d!5028 () Bool)

(assert (=> d!5028 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23366)))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23366)))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073))) nBits!313))))

(declare-fun bs!1402 () Bool)

(assert (= bs!1402 d!5028))

(declare-fun m!22107 () Bool)

(assert (=> bs!1402 m!22107))

(assert (=> b!15427 d!5028))

(declare-fun d!5030 () Bool)

(assert (=> d!5030 (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23366)))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073)) nBits!313)))

(declare-fun lt!23404 () Unit!1280)

(declare-fun choose!9 (BitStream!752 array!931 (_ BitVec 64) BitStream!752) Unit!1280)

(assert (=> d!5030 (= lt!23404 (choose!9 thiss!1073 (buf!753 (_2!988 lt!23366)) nBits!313 (BitStream!753 (buf!753 (_2!988 lt!23366)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073))))))

(assert (=> d!5030 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!753 (_2!988 lt!23366)) nBits!313) lt!23404)))

(declare-fun bs!1403 () Bool)

(assert (= bs!1403 d!5030))

(assert (=> bs!1403 m!22075))

(declare-fun m!22109 () Bool)

(assert (=> bs!1403 m!22109))

(assert (=> b!15427 d!5030))

(assert (=> b!15427 d!5026))

(declare-fun d!5032 () Bool)

(assert (=> d!5032 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 (_1!987 lt!23367)))) ((_ sign_extend 32) (currentByte!1916 (_1!987 lt!23367))) ((_ sign_extend 32) (currentBit!1911 (_1!987 lt!23367))) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!396 (buf!753 (_1!987 lt!23367)))) ((_ sign_extend 32) (currentByte!1916 (_1!987 lt!23367))) ((_ sign_extend 32) (currentBit!1911 (_1!987 lt!23367)))) nBits!313))))

(declare-fun bs!1404 () Bool)

(assert (= bs!1404 d!5032))

(declare-fun m!22111 () Bool)

(assert (=> bs!1404 m!22111))

(assert (=> b!15427 d!5032))

(declare-fun d!5034 () Bool)

(declare-fun res!14372 () Bool)

(declare-fun e!9664 () Bool)

(assert (=> d!5034 (=> (not res!14372) (not e!9664))))

(assert (=> d!5034 (= res!14372 (= (size!396 (buf!753 thiss!1073)) (size!396 (buf!753 (_2!988 lt!23366)))))))

(assert (=> d!5034 (= (isPrefixOf!0 thiss!1073 (_2!988 lt!23366)) e!9664)))

(declare-fun b!15443 () Bool)

(declare-fun res!14373 () Bool)

(assert (=> b!15443 (=> (not res!14373) (not e!9664))))

(assert (=> b!15443 (= res!14373 (bvsle (bitIndex!0 (size!396 (buf!753 thiss!1073)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073)) (bitIndex!0 (size!396 (buf!753 (_2!988 lt!23366))) (currentByte!1916 (_2!988 lt!23366)) (currentBit!1911 (_2!988 lt!23366)))))))

(declare-fun b!15444 () Bool)

(declare-fun e!9663 () Bool)

(assert (=> b!15444 (= e!9664 e!9663)))

(declare-fun res!14374 () Bool)

(assert (=> b!15444 (=> res!14374 e!9663)))

(assert (=> b!15444 (= res!14374 (= (size!396 (buf!753 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!15445 () Bool)

(declare-fun arrayBitRangesEq!0 (array!931 array!931 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15445 (= e!9663 (arrayBitRangesEq!0 (buf!753 thiss!1073) (buf!753 (_2!988 lt!23366)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!396 (buf!753 thiss!1073)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073))))))

(assert (= (and d!5034 res!14372) b!15443))

(assert (= (and b!15443 res!14373) b!15444))

(assert (= (and b!15444 (not res!14374)) b!15445))

(assert (=> b!15443 m!22071))

(assert (=> b!15443 m!22069))

(assert (=> b!15445 m!22071))

(assert (=> b!15445 m!22071))

(declare-fun m!22113 () Bool)

(assert (=> b!15445 m!22113))

(assert (=> b!15427 d!5034))

(declare-fun b!15506 () Bool)

(declare-fun e!9696 () Bool)

(assert (=> b!15506 (= e!9696 (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 thiss!1073))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073)) nBits!313))))

(declare-fun d!5036 () Bool)

(declare-fun e!9695 () Bool)

(assert (=> d!5036 e!9695))

(declare-fun res!14427 () Bool)

(assert (=> d!5036 (=> (not res!14427) (not e!9695))))

(declare-fun lt!23528 () tuple2!1854)

(assert (=> d!5036 (= res!14427 (= (size!396 (buf!753 thiss!1073)) (size!396 (buf!753 (_2!988 lt!23528)))))))

(declare-fun choose!36 (BitStream!752 (_ BitVec 64) Bool) tuple2!1854)

(assert (=> d!5036 (= lt!23528 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!5036 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5036 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!23528)))

(declare-fun b!15505 () Bool)

(declare-fun lt!23530 () tuple2!1850)

(declare-fun lt!23526 () tuple2!1852)

(assert (=> b!15505 (= e!9695 (and (_2!986 lt!23530) (= (_1!986 lt!23530) (_2!987 lt!23526))))))

(assert (=> b!15505 (= lt!23530 (checkBitsLoopPure!0 (_1!987 lt!23526) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!23527 () Unit!1280)

(declare-fun lt!23529 () Unit!1280)

(assert (=> b!15505 (= lt!23527 lt!23529)))

(assert (=> b!15505 (validate_offset_bits!1 ((_ sign_extend 32) (size!396 (buf!753 (_2!988 lt!23528)))) ((_ sign_extend 32) (currentByte!1916 thiss!1073)) ((_ sign_extend 32) (currentBit!1911 thiss!1073)) nBits!313)))

(assert (=> b!15505 (= lt!23529 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!753 (_2!988 lt!23528)) nBits!313))))

(assert (=> b!15505 e!9696))

(declare-fun res!14426 () Bool)

(assert (=> b!15505 (=> (not res!14426) (not e!9696))))

(assert (=> b!15505 (= res!14426 (and (= (size!396 (buf!753 thiss!1073)) (size!396 (buf!753 (_2!988 lt!23528)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15505 (= lt!23526 (reader!0 thiss!1073 (_2!988 lt!23528)))))

(declare-fun b!15503 () Bool)

(declare-fun res!14429 () Bool)

(assert (=> b!15503 (=> (not res!14429) (not e!9695))))

(declare-fun lt!23525 () (_ BitVec 64))

(assert (=> b!15503 (= res!14429 (= (bitIndex!0 (size!396 (buf!753 (_2!988 lt!23528))) (currentByte!1916 (_2!988 lt!23528)) (currentBit!1911 (_2!988 lt!23528))) (bvadd lt!23525 nBits!313)))))

(assert (=> b!15503 (or (not (= (bvand lt!23525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!23525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!23525 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15503 (= lt!23525 (bitIndex!0 (size!396 (buf!753 thiss!1073)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073)))))

(declare-fun b!15504 () Bool)

(declare-fun res!14428 () Bool)

(assert (=> b!15504 (=> (not res!14428) (not e!9695))))

(assert (=> b!15504 (= res!14428 (isPrefixOf!0 thiss!1073 (_2!988 lt!23528)))))

(assert (= (and d!5036 res!14427) b!15503))

(assert (= (and b!15503 res!14429) b!15504))

(assert (= (and b!15504 res!14428) b!15505))

(assert (= (and b!15505 res!14426) b!15506))

(declare-fun m!22163 () Bool)

(assert (=> b!15504 m!22163))

(declare-fun m!22165 () Bool)

(assert (=> b!15503 m!22165))

(assert (=> b!15503 m!22071))

(declare-fun m!22167 () Bool)

(assert (=> d!5036 m!22167))

(declare-fun m!22169 () Bool)

(assert (=> b!15505 m!22169))

(declare-fun m!22171 () Bool)

(assert (=> b!15505 m!22171))

(declare-fun m!22173 () Bool)

(assert (=> b!15505 m!22173))

(declare-fun m!22175 () Bool)

(assert (=> b!15505 m!22175))

(assert (=> b!15506 m!22067))

(assert (=> b!15427 d!5036))

(assert (=> b!15427 d!5014))

(declare-fun b!15544 () Bool)

(declare-fun e!9714 () Unit!1280)

(declare-fun Unit!1283 () Unit!1280)

(assert (=> b!15544 (= e!9714 Unit!1283)))

(declare-fun b!15545 () Bool)

(declare-fun res!14458 () Bool)

(declare-fun e!9713 () Bool)

(assert (=> b!15545 (=> (not res!14458) (not e!9713))))

(declare-fun lt!23659 () tuple2!1852)

(assert (=> b!15545 (= res!14458 (isPrefixOf!0 (_1!987 lt!23659) thiss!1073))))

(declare-fun b!15546 () Bool)

(declare-fun res!14457 () Bool)

(assert (=> b!15546 (=> (not res!14457) (not e!9713))))

(assert (=> b!15546 (= res!14457 (isPrefixOf!0 (_2!987 lt!23659) (_2!988 lt!23366)))))

(declare-fun b!15547 () Bool)

(declare-fun lt!23657 () Unit!1280)

(assert (=> b!15547 (= e!9714 lt!23657)))

(declare-fun lt!23653 () (_ BitVec 64))

(assert (=> b!15547 (= lt!23653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23664 () (_ BitVec 64))

(assert (=> b!15547 (= lt!23664 (bitIndex!0 (size!396 (buf!753 thiss!1073)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!931 array!931 (_ BitVec 64) (_ BitVec 64)) Unit!1280)

(assert (=> b!15547 (= lt!23657 (arrayBitRangesEqSymmetric!0 (buf!753 thiss!1073) (buf!753 (_2!988 lt!23366)) lt!23653 lt!23664))))

(assert (=> b!15547 (arrayBitRangesEq!0 (buf!753 (_2!988 lt!23366)) (buf!753 thiss!1073) lt!23653 lt!23664)))

(declare-fun b!15548 () Bool)

(declare-fun lt!23649 () (_ BitVec 64))

(declare-fun lt!23656 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!752 (_ BitVec 64)) BitStream!752)

(assert (=> b!15548 (= e!9713 (= (_1!987 lt!23659) (withMovedBitIndex!0 (_2!987 lt!23659) (bvsub lt!23649 lt!23656))))))

(assert (=> b!15548 (or (= (bvand lt!23649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23649 lt!23656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15548 (= lt!23656 (bitIndex!0 (size!396 (buf!753 (_2!988 lt!23366))) (currentByte!1916 (_2!988 lt!23366)) (currentBit!1911 (_2!988 lt!23366))))))

(assert (=> b!15548 (= lt!23649 (bitIndex!0 (size!396 (buf!753 thiss!1073)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073)))))

(declare-fun d!5056 () Bool)

(assert (=> d!5056 e!9713))

(declare-fun res!14459 () Bool)

(assert (=> d!5056 (=> (not res!14459) (not e!9713))))

(assert (=> d!5056 (= res!14459 (isPrefixOf!0 (_1!987 lt!23659) (_2!987 lt!23659)))))

(declare-fun lt!23666 () BitStream!752)

(assert (=> d!5056 (= lt!23659 (tuple2!1853 lt!23666 (_2!988 lt!23366)))))

(declare-fun lt!23663 () Unit!1280)

(declare-fun lt!23651 () Unit!1280)

(assert (=> d!5056 (= lt!23663 lt!23651)))

(assert (=> d!5056 (isPrefixOf!0 lt!23666 (_2!988 lt!23366))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!752 BitStream!752 BitStream!752) Unit!1280)

(assert (=> d!5056 (= lt!23651 (lemmaIsPrefixTransitive!0 lt!23666 (_2!988 lt!23366) (_2!988 lt!23366)))))

(declare-fun lt!23650 () Unit!1280)

(declare-fun lt!23660 () Unit!1280)

(assert (=> d!5056 (= lt!23650 lt!23660)))

(assert (=> d!5056 (isPrefixOf!0 lt!23666 (_2!988 lt!23366))))

(assert (=> d!5056 (= lt!23660 (lemmaIsPrefixTransitive!0 lt!23666 thiss!1073 (_2!988 lt!23366)))))

(declare-fun lt!23662 () Unit!1280)

(assert (=> d!5056 (= lt!23662 e!9714)))

(declare-fun c!1048 () Bool)

(assert (=> d!5056 (= c!1048 (not (= (size!396 (buf!753 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!23665 () Unit!1280)

(declare-fun lt!23668 () Unit!1280)

(assert (=> d!5056 (= lt!23665 lt!23668)))

(assert (=> d!5056 (isPrefixOf!0 (_2!988 lt!23366) (_2!988 lt!23366))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!752) Unit!1280)

(assert (=> d!5056 (= lt!23668 (lemmaIsPrefixRefl!0 (_2!988 lt!23366)))))

(declare-fun lt!23652 () Unit!1280)

(declare-fun lt!23655 () Unit!1280)

(assert (=> d!5056 (= lt!23652 lt!23655)))

(assert (=> d!5056 (= lt!23655 (lemmaIsPrefixRefl!0 (_2!988 lt!23366)))))

(declare-fun lt!23654 () Unit!1280)

(declare-fun lt!23667 () Unit!1280)

(assert (=> d!5056 (= lt!23654 lt!23667)))

(assert (=> d!5056 (isPrefixOf!0 lt!23666 lt!23666)))

(assert (=> d!5056 (= lt!23667 (lemmaIsPrefixRefl!0 lt!23666))))

(declare-fun lt!23658 () Unit!1280)

(declare-fun lt!23661 () Unit!1280)

(assert (=> d!5056 (= lt!23658 lt!23661)))

(assert (=> d!5056 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!5056 (= lt!23661 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!5056 (= lt!23666 (BitStream!753 (buf!753 (_2!988 lt!23366)) (currentByte!1916 thiss!1073) (currentBit!1911 thiss!1073)))))

(assert (=> d!5056 (isPrefixOf!0 thiss!1073 (_2!988 lt!23366))))

(assert (=> d!5056 (= (reader!0 thiss!1073 (_2!988 lt!23366)) lt!23659)))

(assert (= (and d!5056 c!1048) b!15547))

(assert (= (and d!5056 (not c!1048)) b!15544))

(assert (= (and d!5056 res!14459) b!15545))

(assert (= (and b!15545 res!14458) b!15546))

(assert (= (and b!15546 res!14457) b!15548))

(declare-fun m!22223 () Bool)

(assert (=> b!15545 m!22223))

(declare-fun m!22225 () Bool)

(assert (=> b!15548 m!22225))

(assert (=> b!15548 m!22069))

(assert (=> b!15548 m!22071))

(assert (=> b!15547 m!22071))

(declare-fun m!22227 () Bool)

(assert (=> b!15547 m!22227))

(declare-fun m!22229 () Bool)

(assert (=> b!15547 m!22229))

(declare-fun m!22231 () Bool)

(assert (=> d!5056 m!22231))

(declare-fun m!22233 () Bool)

(assert (=> d!5056 m!22233))

(declare-fun m!22235 () Bool)

(assert (=> d!5056 m!22235))

(declare-fun m!22237 () Bool)

(assert (=> d!5056 m!22237))

(declare-fun m!22239 () Bool)

(assert (=> d!5056 m!22239))

(declare-fun m!22241 () Bool)

(assert (=> d!5056 m!22241))

(declare-fun m!22243 () Bool)

(assert (=> d!5056 m!22243))

(assert (=> d!5056 m!22065))

(declare-fun m!22245 () Bool)

(assert (=> d!5056 m!22245))

(declare-fun m!22247 () Bool)

(assert (=> d!5056 m!22247))

(declare-fun m!22249 () Bool)

(assert (=> d!5056 m!22249))

(declare-fun m!22251 () Bool)

(assert (=> b!15546 m!22251))

(assert (=> b!15427 d!5056))

(assert (=> b!15428 d!5034))

(declare-fun d!5064 () Bool)

(declare-datatypes ((tuple2!1858 0))(
  ( (tuple2!1859 (_1!990 Bool) (_2!990 BitStream!752)) )
))
(declare-fun lt!23674 () tuple2!1858)

(declare-fun checkBitsLoop!0 (BitStream!752 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1858)

(assert (=> d!5064 (= lt!23674 (checkBitsLoop!0 (_1!987 lt!23369) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5064 (= (checkBitsLoopPure!0 (_1!987 lt!23369) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1851 (_2!990 lt!23674) (_1!990 lt!23674)))))

(declare-fun bs!1409 () Bool)

(assert (= bs!1409 d!5064))

(declare-fun m!22255 () Bool)

(assert (=> bs!1409 m!22255))

(assert (=> b!15423 d!5064))

(assert (=> b!15423 d!5028))

(assert (=> b!15423 d!5030))

(assert (=> b!15423 d!5056))

(declare-fun d!5070 () Bool)

(assert (=> d!5070 (= (array_inv!385 (buf!753 thiss!1073)) (bvsge (size!396 (buf!753 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!15424 d!5070))

(push 1)

(assert (not b!15547))

(assert (not d!5012))

(assert (not b!15545))

(assert (not b!15506))

(assert (not d!5014))

(assert (not d!5064))

(assert (not b!15503))

(assert (not b!15504))

(assert (not d!5026))

(assert (not b!15445))

(assert (not b!15548))

(assert (not d!5056))

(assert (not b!15505))

(assert (not d!5028))

(assert (not b!15443))

(assert (not d!5008))

(assert (not d!5032))

(assert (not b!15546))

(assert (not d!5036))

(assert (not d!5030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

