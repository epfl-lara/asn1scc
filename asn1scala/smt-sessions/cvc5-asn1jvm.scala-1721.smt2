; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47504 () Bool)

(assert start!47504)

(declare-fun b!226411 () Bool)

(declare-fun res!189977 () Bool)

(declare-fun e!154773 () Bool)

(assert (=> b!226411 (=> (not res!189977) (not e!154773))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226411 (= res!189977 (bvslt i!761 to!496))))

(declare-fun b!226413 () Bool)

(declare-fun e!154774 () Bool)

(declare-datatypes ((array!11327 0))(
  ( (array!11328 (arr!5932 (Array (_ BitVec 32) (_ BitVec 8))) (size!4969 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9034 0))(
  ( (BitStream!9035 (buf!5510 array!11327) (currentByte!10324 (_ BitVec 32)) (currentBit!10319 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9034)

(declare-fun array_inv!4710 (array!11327) Bool)

(assert (=> b!226413 (= e!154774 (array_inv!4710 (buf!5510 thiss!1870)))))

(declare-fun lt!360294 () (_ BitVec 64))

(declare-fun lt!360298 () (_ BitVec 64))

(declare-fun lt!360293 () (_ BitVec 64))

(declare-fun b!226412 () Bool)

(assert (=> b!226412 (= e!154773 (not (or (not (= lt!360298 (bvand lt!360294 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!360298 (bvand (bvadd lt!360293 lt!360294) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226412 (= lt!360298 (bvand lt!360293 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!360297 () (_ BitVec 32))

(assert (=> b!226412 (= lt!360294 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!360297)))))

(declare-fun lt!360300 () (_ BitVec 64))

(assert (=> b!226412 (= lt!360293 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!360300))))

(declare-datatypes ((tuple2!19412 0))(
  ( (tuple2!19413 (_1!10508 (_ BitVec 8)) (_2!10508 BitStream!9034)) )
))
(declare-fun lt!360296 () tuple2!19412)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226412 (= lt!360293 (bitIndex!0 (size!4969 (buf!5510 (_2!10508 lt!360296))) (currentByte!10324 (_2!10508 lt!360296)) (currentBit!10319 (_2!10508 lt!360296))))))

(assert (=> b!226412 (= lt!360300 (bitIndex!0 (size!4969 (buf!5510 thiss!1870)) (currentByte!10324 thiss!1870) (currentBit!10319 thiss!1870)))))

(declare-fun arr!308 () array!11327)

(declare-datatypes ((Unit!16749 0))(
  ( (Unit!16750) )
))
(declare-datatypes ((tuple3!1320 0))(
  ( (tuple3!1321 (_1!10509 Unit!16749) (_2!10509 BitStream!9034) (_3!802 array!11327)) )
))
(declare-fun lt!360295 () tuple3!1320)

(declare-fun readByteArrayLoop!0 (BitStream!9034 array!11327 (_ BitVec 32) (_ BitVec 32)) tuple3!1320)

(assert (=> b!226412 (= lt!360295 (readByteArrayLoop!0 (_2!10508 lt!360296) (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226412 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4969 (buf!5510 (_2!10508 lt!360296)))) ((_ sign_extend 32) (currentByte!10324 (_2!10508 lt!360296))) ((_ sign_extend 32) (currentBit!10319 (_2!10508 lt!360296))) lt!360297)))

(assert (=> b!226412 (= lt!360297 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360299 () Unit!16749)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9034 BitStream!9034 (_ BitVec 64) (_ BitVec 32)) Unit!16749)

(assert (=> b!226412 (= lt!360299 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10508 lt!360296) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9034) tuple2!19412)

(assert (=> b!226412 (= lt!360296 (readByte!0 thiss!1870))))

(declare-fun res!189979 () Bool)

(assert (=> start!47504 (=> (not res!189979) (not e!154773))))

(assert (=> start!47504 (= res!189979 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4969 arr!308))))))

(assert (=> start!47504 e!154773))

(assert (=> start!47504 true))

(assert (=> start!47504 (array_inv!4710 arr!308)))

(declare-fun inv!12 (BitStream!9034) Bool)

(assert (=> start!47504 (and (inv!12 thiss!1870) e!154774)))

(declare-fun b!226410 () Bool)

(declare-fun res!189978 () Bool)

(assert (=> b!226410 (=> (not res!189978) (not e!154773))))

(assert (=> b!226410 (= res!189978 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4969 (buf!5510 thiss!1870))) ((_ sign_extend 32) (currentByte!10324 thiss!1870)) ((_ sign_extend 32) (currentBit!10319 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47504 res!189979) b!226410))

(assert (= (and b!226410 res!189978) b!226411))

(assert (= (and b!226411 res!189977) b!226412))

(assert (= start!47504 b!226413))

(declare-fun m!347785 () Bool)

(assert (=> b!226413 m!347785))

(declare-fun m!347787 () Bool)

(assert (=> b!226412 m!347787))

(declare-fun m!347789 () Bool)

(assert (=> b!226412 m!347789))

(declare-fun m!347791 () Bool)

(assert (=> b!226412 m!347791))

(declare-fun m!347793 () Bool)

(assert (=> b!226412 m!347793))

(declare-fun m!347795 () Bool)

(assert (=> b!226412 m!347795))

(declare-fun m!347797 () Bool)

(assert (=> b!226412 m!347797))

(declare-fun m!347799 () Bool)

(assert (=> b!226412 m!347799))

(declare-fun m!347801 () Bool)

(assert (=> start!47504 m!347801))

(declare-fun m!347803 () Bool)

(assert (=> start!47504 m!347803))

(declare-fun m!347805 () Bool)

(assert (=> b!226410 m!347805))

(push 1)

(assert (not b!226410))

(assert (not start!47504))

(assert (not b!226413))

(assert (not b!226412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76830 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76830 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4969 (buf!5510 thiss!1870))) ((_ sign_extend 32) (currentByte!10324 thiss!1870)) ((_ sign_extend 32) (currentBit!10319 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4969 (buf!5510 thiss!1870))) ((_ sign_extend 32) (currentByte!10324 thiss!1870)) ((_ sign_extend 32) (currentBit!10319 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18786 () Bool)

(assert (= bs!18786 d!76830))

(declare-fun m!347851 () Bool)

(assert (=> bs!18786 m!347851))

(assert (=> b!226410 d!76830))

(declare-fun d!76832 () Bool)

(assert (=> d!76832 (= (array_inv!4710 arr!308) (bvsge (size!4969 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47504 d!76832))

(declare-fun d!76834 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76834 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10319 thiss!1870) (currentByte!10324 thiss!1870) (size!4969 (buf!5510 thiss!1870))))))

(declare-fun bs!18787 () Bool)

(assert (= bs!18787 d!76834))

(declare-fun m!347853 () Bool)

(assert (=> bs!18787 m!347853))

(assert (=> start!47504 d!76834))

(declare-fun d!76836 () Bool)

(assert (=> d!76836 (= (array_inv!4710 (buf!5510 thiss!1870)) (bvsge (size!4969 (buf!5510 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226413 d!76836))

(declare-fun d!76838 () Bool)

(declare-fun lt!360367 () (_ BitVec 8))

(declare-fun lt!360368 () (_ BitVec 8))

(assert (=> d!76838 (= lt!360367 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5932 (buf!5510 thiss!1870)) (currentByte!10324 thiss!1870))) ((_ sign_extend 24) lt!360368))))))

(assert (=> d!76838 (= lt!360368 ((_ extract 7 0) (currentBit!10319 thiss!1870)))))

(declare-fun e!154803 () Bool)

(assert (=> d!76838 e!154803))

(declare-fun res!190004 () Bool)

(assert (=> d!76838 (=> (not res!190004) (not e!154803))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76838 (= res!190004 (validate_offset_bits!1 ((_ sign_extend 32) (size!4969 (buf!5510 thiss!1870))) ((_ sign_extend 32) (currentByte!10324 thiss!1870)) ((_ sign_extend 32) (currentBit!10319 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19418 0))(
  ( (tuple2!19419 (_1!10514 Unit!16749) (_2!10514 (_ BitVec 8))) )
))
(declare-fun Unit!16755 () Unit!16749)

(declare-fun Unit!16756 () Unit!16749)

(assert (=> d!76838 (= (readByte!0 thiss!1870) (tuple2!19413 (_2!10514 (ite (bvsgt ((_ sign_extend 24) lt!360368) #b00000000000000000000000000000000) (tuple2!19419 Unit!16755 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!360367) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5932 (buf!5510 thiss!1870)) (bvadd (currentByte!10324 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!360368)))))))) (tuple2!19419 Unit!16756 lt!360367))) (BitStream!9035 (buf!5510 thiss!1870) (bvadd (currentByte!10324 thiss!1870) #b00000000000000000000000000000001) (currentBit!10319 thiss!1870))))))

(declare-fun b!226442 () Bool)

(declare-fun e!154804 () Bool)

(assert (=> b!226442 (= e!154803 e!154804)))

(declare-fun res!190003 () Bool)

(assert (=> b!226442 (=> (not res!190003) (not e!154804))))

(declare-fun lt!360369 () tuple2!19412)

(assert (=> b!226442 (= res!190003 (= (buf!5510 (_2!10508 lt!360369)) (buf!5510 thiss!1870)))))

(declare-fun lt!360366 () (_ BitVec 8))

(declare-fun lt!360365 () (_ BitVec 8))

(declare-fun Unit!16757 () Unit!16749)

(declare-fun Unit!16758 () Unit!16749)

(assert (=> b!226442 (= lt!360369 (tuple2!19413 (_2!10514 (ite (bvsgt ((_ sign_extend 24) lt!360366) #b00000000000000000000000000000000) (tuple2!19419 Unit!16757 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!360365) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5932 (buf!5510 thiss!1870)) (bvadd (currentByte!10324 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!360366)))))))) (tuple2!19419 Unit!16758 lt!360365))) (BitStream!9035 (buf!5510 thiss!1870) (bvadd (currentByte!10324 thiss!1870) #b00000000000000000000000000000001) (currentBit!10319 thiss!1870))))))

(assert (=> b!226442 (= lt!360365 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5932 (buf!5510 thiss!1870)) (currentByte!10324 thiss!1870))) ((_ sign_extend 24) lt!360366))))))

(assert (=> b!226442 (= lt!360366 ((_ extract 7 0) (currentBit!10319 thiss!1870)))))

(declare-fun lt!360364 () (_ BitVec 64))

(declare-fun b!226443 () Bool)

(declare-fun lt!360363 () (_ BitVec 64))

(assert (=> b!226443 (= e!154804 (= (bitIndex!0 (size!4969 (buf!5510 (_2!10508 lt!360369))) (currentByte!10324 (_2!10508 lt!360369)) (currentBit!10319 (_2!10508 lt!360369))) (bvadd lt!360364 lt!360363)))))

(assert (=> b!226443 (or (not (= (bvand lt!360364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360363 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!360364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!360364 lt!360363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226443 (= lt!360363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226443 (= lt!360364 (bitIndex!0 (size!4969 (buf!5510 thiss!1870)) (currentByte!10324 thiss!1870) (currentBit!10319 thiss!1870)))))

(assert (= (and d!76838 res!190004) b!226442))

(assert (= (and b!226442 res!190003) b!226443))

(declare-fun m!347855 () Bool)

(assert (=> d!76838 m!347855))

(declare-fun m!347857 () Bool)

(assert (=> d!76838 m!347857))

(declare-fun m!347859 () Bool)

(assert (=> d!76838 m!347859))

(assert (=> b!226442 m!347859))

(assert (=> b!226442 m!347855))

(declare-fun m!347861 () Bool)

(assert (=> b!226443 m!347861))

(assert (=> b!226443 m!347799))

(assert (=> b!226412 d!76838))

(declare-fun d!76840 () Bool)

(declare-fun e!154807 () Bool)

(assert (=> d!76840 e!154807))

(declare-fun res!190011 () Bool)

(assert (=> d!76840 (=> (not res!190011) (not e!154807))))

(declare-fun lt!360384 () (_ BitVec 64))

(declare-fun lt!360382 () (_ BitVec 64))

(declare-fun lt!360385 () (_ BitVec 64))

(assert (=> d!76840 (= res!190011 (= lt!360382 (bvsub lt!360385 lt!360384)))))

(assert (=> d!76840 (or (= (bvand lt!360385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360384 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360385 lt!360384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76840 (= lt!360384 (remainingBits!0 ((_ sign_extend 32) (size!4969 (buf!5510 (_2!10508 lt!360296)))) ((_ sign_extend 32) (currentByte!10324 (_2!10508 lt!360296))) ((_ sign_extend 32) (currentBit!10319 (_2!10508 lt!360296)))))))

(declare-fun lt!360383 () (_ BitVec 64))

(declare-fun lt!360386 () (_ BitVec 64))

(assert (=> d!76840 (= lt!360385 (bvmul lt!360383 lt!360386))))

(assert (=> d!76840 (or (= lt!360383 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360386 (bvsdiv (bvmul lt!360383 lt!360386) lt!360383)))))

(assert (=> d!76840 (= lt!360386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76840 (= lt!360383 ((_ sign_extend 32) (size!4969 (buf!5510 (_2!10508 lt!360296)))))))

(assert (=> d!76840 (= lt!360382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10324 (_2!10508 lt!360296))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10319 (_2!10508 lt!360296)))))))

(assert (=> d!76840 (invariant!0 (currentBit!10319 (_2!10508 lt!360296)) (currentByte!10324 (_2!10508 lt!360296)) (size!4969 (buf!5510 (_2!10508 lt!360296))))))

(assert (=> d!76840 (= (bitIndex!0 (size!4969 (buf!5510 (_2!10508 lt!360296))) (currentByte!10324 (_2!10508 lt!360296)) (currentBit!10319 (_2!10508 lt!360296))) lt!360382)))

(declare-fun b!226448 () Bool)

(declare-fun res!190012 () Bool)

(assert (=> b!226448 (=> (not res!190012) (not e!154807))))

(assert (=> b!226448 (= res!190012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360382))))

(declare-fun b!226449 () Bool)

(declare-fun lt!360387 () (_ BitVec 64))

(assert (=> b!226449 (= e!154807 (bvsle lt!360382 (bvmul lt!360387 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226449 (or (= lt!360387 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360387 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360387)))))

(assert (=> b!226449 (= lt!360387 ((_ sign_extend 32) (size!4969 (buf!5510 (_2!10508 lt!360296)))))))

(assert (= (and d!76840 res!190011) b!226448))

(assert (= (and b!226448 res!190012) b!226449))

(declare-fun m!347873 () Bool)

(assert (=> d!76840 m!347873))

(declare-fun m!347875 () Bool)

(assert (=> d!76840 m!347875))

(assert (=> b!226412 d!76840))

(declare-fun d!76864 () Bool)

(declare-fun e!154808 () Bool)

(assert (=> d!76864 e!154808))

(declare-fun res!190013 () Bool)

(assert (=> d!76864 (=> (not res!190013) (not e!154808))))

(declare-fun lt!360388 () (_ BitVec 64))

(declare-fun lt!360391 () (_ BitVec 64))

(declare-fun lt!360390 () (_ BitVec 64))

(assert (=> d!76864 (= res!190013 (= lt!360388 (bvsub lt!360391 lt!360390)))))

(assert (=> d!76864 (or (= (bvand lt!360391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360391 lt!360390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76864 (= lt!360390 (remainingBits!0 ((_ sign_extend 32) (size!4969 (buf!5510 thiss!1870))) ((_ sign_extend 32) (currentByte!10324 thiss!1870)) ((_ sign_extend 32) (currentBit!10319 thiss!1870))))))

(declare-fun lt!360389 () (_ BitVec 64))

(declare-fun lt!360392 () (_ BitVec 64))

(assert (=> d!76864 (= lt!360391 (bvmul lt!360389 lt!360392))))

(assert (=> d!76864 (or (= lt!360389 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360392 (bvsdiv (bvmul lt!360389 lt!360392) lt!360389)))))

(assert (=> d!76864 (= lt!360392 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76864 (= lt!360389 ((_ sign_extend 32) (size!4969 (buf!5510 thiss!1870))))))

(assert (=> d!76864 (= lt!360388 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10324 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10319 thiss!1870))))))

(assert (=> d!76864 (invariant!0 (currentBit!10319 thiss!1870) (currentByte!10324 thiss!1870) (size!4969 (buf!5510 thiss!1870)))))

(assert (=> d!76864 (= (bitIndex!0 (size!4969 (buf!5510 thiss!1870)) (currentByte!10324 thiss!1870) (currentBit!10319 thiss!1870)) lt!360388)))

(declare-fun b!226450 () Bool)

(declare-fun res!190014 () Bool)

(assert (=> b!226450 (=> (not res!190014) (not e!154808))))

(assert (=> b!226450 (= res!190014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360388))))

(declare-fun b!226451 () Bool)

(declare-fun lt!360393 () (_ BitVec 64))

(assert (=> b!226451 (= e!154808 (bvsle lt!360388 (bvmul lt!360393 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226451 (or (= lt!360393 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360393 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360393)))))

(assert (=> b!226451 (= lt!360393 ((_ sign_extend 32) (size!4969 (buf!5510 thiss!1870))))))

(assert (= (and d!76864 res!190013) b!226450))

(assert (= (and b!226450 res!190014) b!226451))

(assert (=> d!76864 m!347851))

(assert (=> d!76864 m!347853))

(assert (=> b!226412 d!76864))

(declare-fun d!76866 () Bool)

(declare-fun e!154811 () Bool)

(assert (=> d!76866 e!154811))

(declare-fun res!190017 () Bool)

(assert (=> d!76866 (=> (not res!190017) (not e!154811))))

(assert (=> d!76866 (= res!190017 (and (or (let ((rhs!3881 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3881 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3881) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76867 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76867 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76867 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3880 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3880 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3880) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!360401 () Unit!16749)

(declare-fun choose!57 (BitStream!9034 BitStream!9034 (_ BitVec 64) (_ BitVec 32)) Unit!16749)

(assert (=> d!76866 (= lt!360401 (choose!57 thiss!1870 (_2!10508 lt!360296) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76866 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10508 lt!360296) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!360401)))

(declare-fun b!226454 () Bool)

(declare-fun lt!360400 () (_ BitVec 32))

(assert (=> b!226454 (= e!154811 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4969 (buf!5510 (_2!10508 lt!360296)))) ((_ sign_extend 32) (currentByte!10324 (_2!10508 lt!360296))) ((_ sign_extend 32) (currentBit!10319 (_2!10508 lt!360296))) (bvsub (bvsub to!496 i!761) lt!360400)))))

(assert (=> b!226454 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!360400 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!360400) #b10000000000000000000000000000000)))))

(declare-fun lt!360402 () (_ BitVec 64))

(assert (=> b!226454 (= lt!360400 ((_ extract 31 0) lt!360402))))

(assert (=> b!226454 (and (bvslt lt!360402 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!360402 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226454 (= lt!360402 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76866 res!190017) b!226454))

(declare-fun m!347877 () Bool)

(assert (=> d!76866 m!347877))

(declare-fun m!347879 () Bool)

(assert (=> b!226454 m!347879))

(assert (=> b!226412 d!76866))

(declare-fun lt!360580 () Unit!16749)

(declare-fun e!154842 () tuple3!1320)

(declare-fun b!226496 () Bool)

(assert (=> b!226496 (= e!154842 (tuple3!1321 lt!360580 (_2!10508 lt!360296) (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))))))

(declare-fun call!3727 () (_ BitVec 64))

(assert (=> b!226496 (= call!3727 call!3727)))

(declare-fun lt!360590 () Unit!16749)

(declare-fun Unit!16759 () Unit!16749)

(assert (=> b!226496 (= lt!360590 Unit!16759)))

(declare-fun lt!360574 () Unit!16749)

(declare-fun arrayRangesEqReflexiveLemma!121 (array!11327) Unit!16749)

(assert (=> b!226496 (= lt!360574 (arrayRangesEqReflexiveLemma!121 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))))))

(declare-fun call!3728 () Bool)

(assert (=> b!226496 call!3728))

(declare-fun lt!360601 () Unit!16749)

(assert (=> b!226496 (= lt!360601 lt!360574)))

(declare-fun lt!360589 () array!11327)

(assert (=> b!226496 (= lt!360589 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)))))

(declare-fun lt!360596 () array!11327)

(assert (=> b!226496 (= lt!360596 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)))))

(declare-fun lt!360602 () (_ BitVec 32))

(assert (=> b!226496 (= lt!360602 #b00000000000000000000000000000000)))

(declare-fun lt!360591 () (_ BitVec 32))

(assert (=> b!226496 (= lt!360591 (size!4969 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))))))

(declare-fun lt!360571 () (_ BitVec 32))

(assert (=> b!226496 (= lt!360571 #b00000000000000000000000000000000)))

(declare-fun lt!360579 () (_ BitVec 32))

(assert (=> b!226496 (= lt!360579 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!106 (array!11327 array!11327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16749)

(assert (=> b!226496 (= lt!360580 (arrayRangesEqSlicedLemma!106 lt!360589 lt!360596 lt!360602 lt!360591 lt!360571 lt!360579))))

(declare-fun call!3729 () Bool)

(assert (=> b!226496 call!3729))

(declare-fun lt!360604 () tuple3!1320)

(declare-fun bm!3724 () Bool)

(declare-fun c!11170 () Bool)

(assert (=> bm!3724 (= call!3727 (bitIndex!0 (ite c!11170 (size!4969 (buf!5510 (_2!10509 lt!360604))) (size!4969 (buf!5510 (_2!10508 lt!360296)))) (ite c!11170 (currentByte!10324 (_2!10509 lt!360604)) (currentByte!10324 (_2!10508 lt!360296))) (ite c!11170 (currentBit!10319 (_2!10509 lt!360604)) (currentBit!10319 (_2!10508 lt!360296)))))))

(declare-fun b!226497 () Bool)

(declare-fun res!190054 () Bool)

(declare-fun e!154841 () Bool)

(assert (=> b!226497 (=> (not res!190054) (not e!154841))))

(declare-fun lt!360603 () tuple3!1320)

(assert (=> b!226497 (= res!190054 (and (= (buf!5510 (_2!10508 lt!360296)) (buf!5510 (_2!10509 lt!360603))) (= (size!4969 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))) (size!4969 (_3!802 lt!360603)))))))

(declare-fun d!76869 () Bool)

(declare-fun e!154840 () Bool)

(assert (=> d!76869 e!154840))

(declare-fun res!190055 () Bool)

(assert (=> d!76869 (=> res!190055 e!154840)))

(assert (=> d!76869 (= res!190055 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!360586 () Bool)

(assert (=> d!76869 (= lt!360586 e!154841)))

(declare-fun res!190053 () Bool)

(assert (=> d!76869 (=> (not res!190053) (not e!154841))))

(declare-fun lt!360597 () (_ BitVec 64))

(declare-fun lt!360605 () (_ BitVec 64))

(assert (=> d!76869 (= res!190053 (= (bvadd lt!360605 lt!360597) (bitIndex!0 (size!4969 (buf!5510 (_2!10509 lt!360603))) (currentByte!10324 (_2!10509 lt!360603)) (currentBit!10319 (_2!10509 lt!360603)))))))

(assert (=> d!76869 (or (not (= (bvand lt!360605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360597 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!360605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!360605 lt!360597) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!360594 () (_ BitVec 64))

(assert (=> d!76869 (= lt!360597 (bvmul lt!360594 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76869 (or (= lt!360594 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360594 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360594)))))

(assert (=> d!76869 (= lt!360594 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76869 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76869 (= lt!360605 (bitIndex!0 (size!4969 (buf!5510 (_2!10508 lt!360296))) (currentByte!10324 (_2!10508 lt!360296)) (currentBit!10319 (_2!10508 lt!360296))))))

(assert (=> d!76869 (= lt!360603 e!154842)))

(assert (=> d!76869 (= c!11170 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76869 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4969 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)))))))

(assert (=> d!76869 (= (readByteArrayLoop!0 (_2!10508 lt!360296) (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!360603)))

(declare-fun bm!3725 () Bool)

(declare-fun arrayRangesEq!817 (array!11327 array!11327 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3725 (= call!3728 (arrayRangesEq!817 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)) (ite c!11170 (_3!802 lt!360604) (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))) #b00000000000000000000000000000000 (ite c!11170 (bvadd #b00000000000000000000000000000001 i!761) (size!4969 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))))))))

(declare-fun b!226498 () Bool)

(declare-fun lt!360582 () Unit!16749)

(assert (=> b!226498 (= e!154842 (tuple3!1321 lt!360582 (_2!10509 lt!360604) (_3!802 lt!360604)))))

(declare-fun lt!360572 () tuple2!19412)

(assert (=> b!226498 (= lt!360572 (readByte!0 (_2!10508 lt!360296)))))

(declare-fun lt!360575 () array!11327)

(assert (=> b!226498 (= lt!360575 (array!11328 (store (arr!5932 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10508 lt!360572)) (size!4969 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)))))))

(declare-fun lt!360585 () (_ BitVec 64))

(assert (=> b!226498 (= lt!360585 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!360573 () (_ BitVec 32))

(assert (=> b!226498 (= lt!360573 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360577 () Unit!16749)

(assert (=> b!226498 (= lt!360577 (validateOffsetBytesFromBitIndexLemma!0 (_2!10508 lt!360296) (_2!10508 lt!360572) lt!360585 lt!360573))))

(assert (=> b!226498 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4969 (buf!5510 (_2!10508 lt!360572)))) ((_ sign_extend 32) (currentByte!10324 (_2!10508 lt!360572))) ((_ sign_extend 32) (currentBit!10319 (_2!10508 lt!360572))) (bvsub lt!360573 ((_ extract 31 0) (bvsdiv (bvadd lt!360585 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!360592 () Unit!16749)

(assert (=> b!226498 (= lt!360592 lt!360577)))

(assert (=> b!226498 (= lt!360604 (readByteArrayLoop!0 (_2!10508 lt!360572) lt!360575 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226498 (= (bitIndex!0 (size!4969 (buf!5510 (_2!10508 lt!360572))) (currentByte!10324 (_2!10508 lt!360572)) (currentBit!10319 (_2!10508 lt!360572))) (bvadd (bitIndex!0 (size!4969 (buf!5510 (_2!10508 lt!360296))) (currentByte!10324 (_2!10508 lt!360296)) (currentBit!10319 (_2!10508 lt!360296))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!360600 () Unit!16749)

(declare-fun Unit!16766 () Unit!16749)

(assert (=> b!226498 (= lt!360600 Unit!16766)))

(assert (=> b!226498 (= (bvadd (bitIndex!0 (size!4969 (buf!5510 (_2!10508 lt!360572))) (currentByte!10324 (_2!10508 lt!360572)) (currentBit!10319 (_2!10508 lt!360572))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3727)))

(declare-fun lt!360598 () Unit!16749)

(declare-fun Unit!16767 () Unit!16749)

(assert (=> b!226498 (= lt!360598 Unit!16767)))

(assert (=> b!226498 (= (bvadd (bitIndex!0 (size!4969 (buf!5510 (_2!10508 lt!360296))) (currentByte!10324 (_2!10508 lt!360296)) (currentBit!10319 (_2!10508 lt!360296))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3727)))

(declare-fun lt!360581 () Unit!16749)

(declare-fun Unit!16768 () Unit!16749)

(assert (=> b!226498 (= lt!360581 Unit!16768)))

(assert (=> b!226498 (and (= (buf!5510 (_2!10508 lt!360296)) (buf!5510 (_2!10509 lt!360604))) (= (size!4969 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))) (size!4969 (_3!802 lt!360604))))))

(declare-fun lt!360587 () Unit!16749)

(declare-fun Unit!16770 () Unit!16749)

(assert (=> b!226498 (= lt!360587 Unit!16770)))

(declare-fun lt!360570 () Unit!16749)

(declare-fun arrayUpdatedAtPrefixLemma!376 (array!11327 (_ BitVec 32) (_ BitVec 8)) Unit!16749)

(assert (=> b!226498 (= lt!360570 (arrayUpdatedAtPrefixLemma!376 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10508 lt!360572)))))

(assert (=> b!226498 (arrayRangesEq!817 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)) (array!11328 (store (arr!5932 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10508 lt!360572)) (size!4969 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!360578 () Unit!16749)

(assert (=> b!226498 (= lt!360578 lt!360570)))

(declare-fun lt!360593 () (_ BitVec 32))

(assert (=> b!226498 (= lt!360593 #b00000000000000000000000000000000)))

(declare-fun lt!360588 () Unit!16749)

(declare-fun arrayRangesEqTransitive!255 (array!11327 array!11327 array!11327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16749)

(assert (=> b!226498 (= lt!360588 (arrayRangesEqTransitive!255 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)) lt!360575 (_3!802 lt!360604) lt!360593 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226498 call!3729))

(declare-fun lt!360595 () Unit!16749)

(assert (=> b!226498 (= lt!360595 lt!360588)))

(assert (=> b!226498 call!3728))

(declare-fun lt!360583 () Unit!16749)

(declare-fun Unit!16772 () Unit!16749)

(assert (=> b!226498 (= lt!360583 Unit!16772)))

(declare-fun lt!360576 () Unit!16749)

(declare-fun arrayRangesEqImpliesEq!106 (array!11327 array!11327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16749)

(assert (=> b!226498 (= lt!360576 (arrayRangesEqImpliesEq!106 lt!360575 (_3!802 lt!360604) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226498 (= (select (store (arr!5932 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10508 lt!360572)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5932 (_3!802 lt!360604)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360599 () Unit!16749)

(assert (=> b!226498 (= lt!360599 lt!360576)))

(declare-fun lt!360584 () Bool)

(assert (=> b!226498 (= lt!360584 (= (select (arr!5932 (_3!802 lt!360604)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10508 lt!360572)))))

(declare-fun Unit!16773 () Unit!16749)

(assert (=> b!226498 (= lt!360582 Unit!16773)))

(assert (=> b!226498 lt!360584))

(declare-fun b!226499 () Bool)

(declare-datatypes ((tuple2!19424 0))(
  ( (tuple2!19425 (_1!10517 BitStream!9034) (_2!10517 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9034) tuple2!19424)

(assert (=> b!226499 (= e!154840 (= (select (arr!5932 (_3!802 lt!360603)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10517 (readBytePure!0 (_2!10508 lt!360296)))))))

(assert (=> b!226499 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4969 (_3!802 lt!360603))))))

(declare-fun b!226500 () Bool)

(assert (=> b!226500 (= e!154841 (arrayRangesEq!817 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)) (_3!802 lt!360603) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3726 () Bool)

(assert (=> bm!3726 (= call!3729 (arrayRangesEq!817 (ite c!11170 (array!11328 (store (arr!5932 arr!308) i!761 (_1!10508 lt!360296)) (size!4969 arr!308)) lt!360589) (ite c!11170 (_3!802 lt!360604) lt!360596) (ite c!11170 lt!360593 lt!360571) (ite c!11170 (bvadd #b00000000000000000000000000000001 i!761) lt!360579)))))

(assert (= (and d!76869 c!11170) b!226498))

(assert (= (and d!76869 (not c!11170)) b!226496))

(assert (= (or b!226498 b!226496) bm!3726))

(assert (= (or b!226498 b!226496) bm!3725))

(assert (= (or b!226498 b!226496) bm!3724))

(assert (= (and d!76869 res!190053) b!226497))

(assert (= (and b!226497 res!190054) b!226500))

(assert (= (and d!76869 (not res!190055)) b!226499))

(declare-fun m!347905 () Bool)

(assert (=> bm!3726 m!347905))

(declare-fun m!347907 () Bool)

(assert (=> bm!3725 m!347907))

(declare-fun m!347909 () Bool)

(assert (=> d!76869 m!347909))

(assert (=> d!76869 m!347787))

(declare-fun m!347911 () Bool)

(assert (=> b!226499 m!347911))

(declare-fun m!347913 () Bool)

(assert (=> b!226499 m!347913))

(declare-fun m!347915 () Bool)

(assert (=> b!226496 m!347915))

(declare-fun m!347917 () Bool)

(assert (=> b!226496 m!347917))

(declare-fun m!347919 () Bool)

(assert (=> b!226498 m!347919))

(declare-fun m!347921 () Bool)

(assert (=> b!226498 m!347921))

(declare-fun m!347923 () Bool)

(assert (=> b!226498 m!347923))

(declare-fun m!347925 () Bool)

(assert (=> b!226498 m!347925))

(declare-fun m!347927 () Bool)

(assert (=> b!226498 m!347927))

(declare-fun m!347929 () Bool)

(assert (=> b!226498 m!347929))

(declare-fun m!347931 () Bool)

(assert (=> b!226498 m!347931))

(declare-fun m!347933 () Bool)

(assert (=> b!226498 m!347933))

(declare-fun m!347935 () Bool)

(assert (=> b!226498 m!347935))

(declare-fun m!347937 () Bool)

(assert (=> b!226498 m!347937))

(assert (=> b!226498 m!347787))

(declare-fun m!347939 () Bool)

(assert (=> b!226498 m!347939))

(declare-fun m!347941 () Bool)

(assert (=> b!226498 m!347941))

(declare-fun m!347943 () Bool)

(assert (=> b!226500 m!347943))

(declare-fun m!347945 () Bool)

(assert (=> bm!3724 m!347945))

(assert (=> b!226412 d!76869))

(declare-fun d!76884 () Bool)

(assert (=> d!76884 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4969 (buf!5510 (_2!10508 lt!360296)))) ((_ sign_extend 32) (currentByte!10324 (_2!10508 lt!360296))) ((_ sign_extend 32) (currentBit!10319 (_2!10508 lt!360296))) lt!360297) (bvsle ((_ sign_extend 32) lt!360297) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4969 (buf!5510 (_2!10508 lt!360296)))) ((_ sign_extend 32) (currentByte!10324 (_2!10508 lt!360296))) ((_ sign_extend 32) (currentBit!10319 (_2!10508 lt!360296)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18793 () Bool)

(assert (= bs!18793 d!76884))

(assert (=> bs!18793 m!347873))

(assert (=> b!226412 d!76884))

(push 1)

(assert (not b!226496))

(assert (not d!76866))

(assert (not bm!3726))

(assert (not d!76840))

(assert (not b!226498))

(assert (not bm!3724))

(assert (not d!76834))

(assert (not d!76884))

(assert (not b!226500))

(assert (not b!226454))

(assert (not b!226499))

(assert (not d!76869))

(assert (not b!226443))

(assert (not bm!3725))

(assert (not d!76864))

(assert (not d!76838))

(assert (not d!76830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

