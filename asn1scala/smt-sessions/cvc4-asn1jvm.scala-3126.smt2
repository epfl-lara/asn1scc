; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71838 () Bool)

(assert start!71838)

(declare-fun b!322370 () Bool)

(declare-fun e!232310 () Bool)

(declare-datatypes ((array!20573 0))(
  ( (array!20574 (arr!10047 (Array (_ BitVec 32) (_ BitVec 8))) (size!8955 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14072 0))(
  ( (BitStream!14073 (buf!8097 array!20573) (currentByte!14932 (_ BitVec 32)) (currentBit!14927 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23558 0))(
  ( (tuple2!23559 (_1!13408 (_ BitVec 64)) (_2!13408 BitStream!14072)) )
))
(declare-fun lt!445022 () tuple2!23558)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!322370 (= e!232310 (not (invariant!0 (currentBit!14927 (_2!13408 lt!445022)) (currentByte!14932 (_2!13408 lt!445022)) (size!8955 (buf!8097 (_2!13408 lt!445022))))))))

(declare-fun b!322371 () Bool)

(declare-fun res!264628 () Bool)

(declare-fun e!232311 () Bool)

(assert (=> b!322371 (=> (not res!264628) (not e!232311))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322371 (= res!264628 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322372 () Bool)

(declare-fun e!232308 () Bool)

(declare-fun thiss!1793 () BitStream!14072)

(declare-fun array_inv!8507 (array!20573) Bool)

(assert (=> b!322372 (= e!232308 (array_inv!8507 (buf!8097 thiss!1793)))))

(declare-fun b!322373 () Bool)

(declare-fun res!264630 () Bool)

(assert (=> b!322373 (=> (not res!264630) (not e!232311))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322373 (= res!264630 (validate_offset_bits!1 ((_ sign_extend 32) (size!8955 (buf!8097 thiss!1793))) ((_ sign_extend 32) (currentByte!14932 thiss!1793)) ((_ sign_extend 32) (currentBit!14927 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322374 () Bool)

(assert (=> b!322374 (= e!232311 e!232310)))

(declare-fun res!264631 () Bool)

(assert (=> b!322374 (=> (not res!264631) (not e!232310))))

(assert (=> b!322374 (= res!264631 (= (buf!8097 (_2!13408 lt!445022)) (buf!8097 thiss!1793)))))

(declare-datatypes ((tuple2!23560 0))(
  ( (tuple2!23561 (_1!13409 Bool) (_2!13409 BitStream!14072)) )
))
(declare-fun lt!445021 () tuple2!23560)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23558)

(assert (=> b!322374 (= lt!445022 (readNBitsLSBFirstsLoop!0 (_2!13409 lt!445021) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13409 lt!445021) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14072) tuple2!23560)

(assert (=> b!322374 (= lt!445021 (readBit!0 thiss!1793))))

(declare-fun res!264627 () Bool)

(assert (=> start!71838 (=> (not res!264627) (not e!232311))))

(assert (=> start!71838 (= res!264627 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71838 e!232311))

(assert (=> start!71838 true))

(declare-fun inv!12 (BitStream!14072) Bool)

(assert (=> start!71838 (and (inv!12 thiss!1793) e!232308)))

(declare-fun b!322375 () Bool)

(declare-fun res!264629 () Bool)

(assert (=> b!322375 (=> (not res!264629) (not e!232311))))

(assert (=> b!322375 (= res!264629 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71838 res!264627) b!322373))

(assert (= (and b!322373 res!264630) b!322371))

(assert (= (and b!322371 res!264628) b!322375))

(assert (= (and b!322375 res!264629) b!322374))

(assert (= (and b!322374 res!264631) b!322370))

(assert (= start!71838 b!322372))

(declare-fun m!460603 () Bool)

(assert (=> b!322374 m!460603))

(declare-fun m!460605 () Bool)

(assert (=> b!322374 m!460605))

(declare-fun m!460607 () Bool)

(assert (=> b!322373 m!460607))

(declare-fun m!460609 () Bool)

(assert (=> b!322371 m!460609))

(declare-fun m!460611 () Bool)

(assert (=> b!322370 m!460611))

(declare-fun m!460613 () Bool)

(assert (=> b!322372 m!460613))

(declare-fun m!460615 () Bool)

(assert (=> start!71838 m!460615))

(push 1)

(assert (not b!322372))

(assert (not start!71838))

(assert (not b!322371))

(assert (not b!322374))

(assert (not b!322373))

(assert (not b!322370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105778 () Bool)

(assert (=> d!105778 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322371 d!105778))

(declare-fun d!105780 () Bool)

(assert (=> d!105780 (= (array_inv!8507 (buf!8097 thiss!1793)) (bvsge (size!8955 (buf!8097 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322372 d!105780))

(declare-fun d!105782 () Bool)

(assert (=> d!105782 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14927 thiss!1793) (currentByte!14932 thiss!1793) (size!8955 (buf!8097 thiss!1793))))))

(declare-fun bs!27867 () Bool)

(assert (= bs!27867 d!105782))

(declare-fun m!460623 () Bool)

(assert (=> bs!27867 m!460623))

(assert (=> start!71838 d!105782))

(declare-fun d!105784 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105784 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8955 (buf!8097 thiss!1793))) ((_ sign_extend 32) (currentByte!14932 thiss!1793)) ((_ sign_extend 32) (currentBit!14927 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8955 (buf!8097 thiss!1793))) ((_ sign_extend 32) (currentByte!14932 thiss!1793)) ((_ sign_extend 32) (currentBit!14927 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27868 () Bool)

(assert (= bs!27868 d!105784))

(declare-fun m!460625 () Bool)

(assert (=> bs!27868 m!460625))

(assert (=> b!322373 d!105784))

(declare-fun b!322435 () Bool)

(declare-fun res!264675 () Bool)

(declare-fun e!232349 () Bool)

(assert (=> b!322435 (=> (not res!264675) (not e!232349))))

(declare-fun lt!445097 () tuple2!23558)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322435 (= res!264675 (= (bvand (_1!13408 lt!445097) (onesLSBLong!0 nBits!548)) (_1!13408 lt!445097)))))

(declare-fun b!322436 () Bool)

(declare-fun res!264678 () Bool)

(assert (=> b!322436 (=> (not res!264678) (not e!232349))))

(assert (=> b!322436 (= res!264678 (= (bvand (_1!13408 lt!445097) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13409 lt!445021) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun lt!445096 () (_ BitVec 64))

(declare-fun b!322437 () Bool)

(declare-fun e!232347 () Bool)

(declare-datatypes ((tuple2!23570 0))(
  ( (tuple2!23571 (_1!13414 BitStream!14072) (_2!13414 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14072) tuple2!23570)

(assert (=> b!322437 (= e!232347 (= (= (bvand (bvlshr (_1!13408 lt!445097) lt!445096) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13414 (readBitPure!0 (_2!13409 lt!445021)))))))

(assert (=> b!322437 (and (bvsge lt!445096 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!445096 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!322437 (= lt!445096 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!322438 () Bool)

(declare-fun e!232348 () tuple2!23558)

(declare-fun lt!445093 () tuple2!23558)

(assert (=> b!322438 (= e!232348 (tuple2!23559 (_1!13408 lt!445093) (_2!13408 lt!445093)))))

(declare-fun lt!445092 () tuple2!23560)

(assert (=> b!322438 (= lt!445092 (readBit!0 (_2!13409 lt!445021)))))

(assert (=> b!322438 (= lt!445093 (readNBitsLSBFirstsLoop!0 (_2!13409 lt!445092) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13409 lt!445021) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13409 lt!445092) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322439 () Bool)

(assert (=> b!322439 (= e!232348 (tuple2!23559 (bvor acc!161 (ite (_1!13409 lt!445021) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13409 lt!445021)))))

(declare-fun d!105786 () Bool)

(assert (=> d!105786 e!232349))

(declare-fun res!264679 () Bool)

(assert (=> d!105786 (=> (not res!264679) (not e!232349))))

(assert (=> d!105786 (= res!264679 (= (buf!8097 (_2!13408 lt!445097)) (buf!8097 (_2!13409 lt!445021))))))

(assert (=> d!105786 (= lt!445097 e!232348)))

(declare-fun c!15421 () Bool)

(assert (=> d!105786 (= c!15421 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!105786 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!105786 (= (readNBitsLSBFirstsLoop!0 (_2!13409 lt!445021) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13409 lt!445021) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!445097)))

(declare-fun b!322440 () Bool)

(assert (=> b!322440 (= e!232349 e!232347)))

(declare-fun res!264676 () Bool)

(assert (=> b!322440 (=> res!264676 e!232347)))

(assert (=> b!322440 (= res!264676 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun b!322441 () Bool)

(declare-fun res!264677 () Bool)

(assert (=> b!322441 (=> (not res!264677) (not e!232349))))

(declare-fun lt!445095 () (_ BitVec 64))

(declare-fun lt!445094 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322441 (= res!264677 (= (bitIndex!0 (size!8955 (buf!8097 (_2!13408 lt!445097))) (currentByte!14932 (_2!13408 lt!445097)) (currentBit!14927 (_2!13408 lt!445097))) (bvadd lt!445094 lt!445095)))))

(assert (=> b!322441 (or (not (= (bvand lt!445094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445095 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445094 lt!445095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322441 (= lt!445095 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!322441 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!322441 (= lt!445094 (bitIndex!0 (size!8955 (buf!8097 (_2!13409 lt!445021))) (currentByte!14932 (_2!13409 lt!445021)) (currentBit!14927 (_2!13409 lt!445021))))))

(assert (= (and d!105786 c!15421) b!322439))

(assert (= (and d!105786 (not c!15421)) b!322438))

(assert (= (and d!105786 res!264679) b!322441))

(assert (= (and b!322441 res!264677) b!322436))

(assert (= (and b!322436 res!264678) b!322435))

(assert (= (and b!322435 res!264675) b!322440))

(assert (= (and b!322440 (not res!264676)) b!322437))

(declare-fun m!460669 () Bool)

(assert (=> b!322435 m!460669))

(declare-fun m!460671 () Bool)

(assert (=> b!322441 m!460671))

(declare-fun m!460673 () Bool)

(assert (=> b!322441 m!460673))

(declare-fun m!460675 () Bool)

(assert (=> b!322437 m!460675))

(declare-fun m!460677 () Bool)

(assert (=> b!322436 m!460677))

(declare-fun m!460679 () Bool)

(assert (=> b!322438 m!460679))

(declare-fun m!460681 () Bool)

(assert (=> b!322438 m!460681))

(assert (=> b!322374 d!105786))

(declare-fun d!105800 () Bool)

(declare-fun e!232359 () Bool)

(assert (=> d!105800 e!232359))

(declare-fun res!264685 () Bool)

(assert (=> d!105800 (=> (not res!264685) (not e!232359))))

(declare-datatypes ((Unit!22020 0))(
  ( (Unit!22021) )
))
(declare-datatypes ((tuple2!23572 0))(
  ( (tuple2!23573 (_1!13415 Unit!22020) (_2!13415 BitStream!14072)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14072) tuple2!23572)

(assert (=> d!105800 (= res!264685 (= (buf!8097 (_2!13415 (increaseBitIndex!0 thiss!1793))) (buf!8097 thiss!1793)))))

(declare-fun lt!445133 () Bool)

(assert (=> d!105800 (= lt!445133 (not (= (bvand ((_ sign_extend 24) (select (arr!10047 (buf!8097 thiss!1793)) (currentByte!14932 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14927 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445138 () tuple2!23560)

(assert (=> d!105800 (= lt!445138 (tuple2!23561 (not (= (bvand ((_ sign_extend 24) (select (arr!10047 (buf!8097 thiss!1793)) (currentByte!14932 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14927 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13415 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105800 (validate_offset_bit!0 ((_ sign_extend 32) (size!8955 (buf!8097 thiss!1793))) ((_ sign_extend 32) (currentByte!14932 thiss!1793)) ((_ sign_extend 32) (currentBit!14927 thiss!1793)))))

(assert (=> d!105800 (= (readBit!0 thiss!1793) lt!445138)))

(declare-fun lt!445139 () (_ BitVec 64))

(declare-fun b!322447 () Bool)

(declare-fun lt!445136 () (_ BitVec 64))

(assert (=> b!322447 (= e!232359 (= (bitIndex!0 (size!8955 (buf!8097 (_2!13415 (increaseBitIndex!0 thiss!1793)))) (currentByte!14932 (_2!13415 (increaseBitIndex!0 thiss!1793))) (currentBit!14927 (_2!13415 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!445136 lt!445139)))))

(assert (=> b!322447 (or (not (= (bvand lt!445136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445139 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445136 lt!445139) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322447 (= lt!445139 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322447 (= lt!445136 (bitIndex!0 (size!8955 (buf!8097 thiss!1793)) (currentByte!14932 thiss!1793) (currentBit!14927 thiss!1793)))))

(declare-fun lt!445137 () Bool)

(assert (=> b!322447 (= lt!445137 (not (= (bvand ((_ sign_extend 24) (select (arr!10047 (buf!8097 thiss!1793)) (currentByte!14932 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14927 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445134 () Bool)

(assert (=> b!322447 (= lt!445134 (not (= (bvand ((_ sign_extend 24) (select (arr!10047 (buf!8097 thiss!1793)) (currentByte!14932 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14927 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445135 () Bool)

(assert (=> b!322447 (= lt!445135 (not (= (bvand ((_ sign_extend 24) (select (arr!10047 (buf!8097 thiss!1793)) (currentByte!14932 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14927 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105800 res!264685) b!322447))

(declare-fun m!460695 () Bool)

(assert (=> d!105800 m!460695))

(declare-fun m!460697 () Bool)

(assert (=> d!105800 m!460697))

(declare-fun m!460699 () Bool)

(assert (=> d!105800 m!460699))

(declare-fun m!460701 () Bool)

(assert (=> d!105800 m!460701))

(assert (=> b!322447 m!460695))

(declare-fun m!460703 () Bool)

(assert (=> b!322447 m!460703))

(assert (=> b!322447 m!460697))

(assert (=> b!322447 m!460699))

(declare-fun m!460705 () Bool)

(assert (=> b!322447 m!460705))

(assert (=> b!322374 d!105800))

(declare-fun d!105804 () Bool)

(assert (=> d!105804 (= (invariant!0 (currentBit!14927 (_2!13408 lt!445022)) (currentByte!14932 (_2!13408 lt!445022)) (size!8955 (buf!8097 (_2!13408 lt!445022)))) (and (bvsge (currentBit!14927 (_2!13408 lt!445022)) #b00000000000000000000000000000000) (bvslt (currentBit!14927 (_2!13408 lt!445022)) #b00000000000000000000000000001000) (bvsge (currentByte!14932 (_2!13408 lt!445022)) #b00000000000000000000000000000000) (or (bvslt (currentByte!14932 (_2!13408 lt!445022)) (size!8955 (buf!8097 (_2!13408 lt!445022)))) (and (= (currentBit!14927 (_2!13408 lt!445022)) #b00000000000000000000000000000000) (= (currentByte!14932 (_2!13408 lt!445022)) (size!8955 (buf!8097 (_2!13408 lt!445022))))))))))

(assert (=> b!322370 d!105804))

(push 1)

(assert (not b!322435))

(assert (not d!105782))

(assert (not d!105800))

(assert (not d!105784))

(assert (not b!322437))

(assert (not b!322436))

(assert (not b!322447))

(assert (not b!322438))

(assert (not b!322441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105858 () Bool)

(declare-fun e!232388 () Bool)

(assert (=> d!105858 e!232388))

(declare-fun res!264739 () Bool)

(assert (=> d!105858 (=> (not res!264739) (not e!232388))))

(declare-fun lt!445287 () (_ BitVec 64))

(declare-fun lt!445291 () (_ BitVec 64))

(declare-fun lt!445286 () (_ BitVec 64))

(assert (=> d!105858 (= res!264739 (= lt!445291 (bvsub lt!445287 lt!445286)))))

(assert (=> d!105858 (or (= (bvand lt!445287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445287 lt!445286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105858 (= lt!445286 (remainingBits!0 ((_ sign_extend 32) (size!8955 (buf!8097 (_2!13415 (increaseBitIndex!0 thiss!1793))))) ((_ sign_extend 32) (currentByte!14932 (_2!13415 (increaseBitIndex!0 thiss!1793)))) ((_ sign_extend 32) (currentBit!14927 (_2!13415 (increaseBitIndex!0 thiss!1793))))))))

(declare-fun lt!445289 () (_ BitVec 64))

(declare-fun lt!445290 () (_ BitVec 64))

(assert (=> d!105858 (= lt!445287 (bvmul lt!445289 lt!445290))))

(assert (=> d!105858 (or (= lt!445289 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445290 (bvsdiv (bvmul lt!445289 lt!445290) lt!445289)))))

(assert (=> d!105858 (= lt!445290 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105858 (= lt!445289 ((_ sign_extend 32) (size!8955 (buf!8097 (_2!13415 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105858 (= lt!445291 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14932 (_2!13415 (increaseBitIndex!0 thiss!1793)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14927 (_2!13415 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105858 (invariant!0 (currentBit!14927 (_2!13415 (increaseBitIndex!0 thiss!1793))) (currentByte!14932 (_2!13415 (increaseBitIndex!0 thiss!1793))) (size!8955 (buf!8097 (_2!13415 (increaseBitIndex!0 thiss!1793)))))))

(assert (=> d!105858 (= (bitIndex!0 (size!8955 (buf!8097 (_2!13415 (increaseBitIndex!0 thiss!1793)))) (currentByte!14932 (_2!13415 (increaseBitIndex!0 thiss!1793))) (currentBit!14927 (_2!13415 (increaseBitIndex!0 thiss!1793)))) lt!445291)))

(declare-fun b!322504 () Bool)

(declare-fun res!264738 () Bool)

(assert (=> b!322504 (=> (not res!264738) (not e!232388))))

(assert (=> b!322504 (= res!264738 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445291))))

(declare-fun b!322505 () Bool)

(declare-fun lt!445288 () (_ BitVec 64))

(assert (=> b!322505 (= e!232388 (bvsle lt!445291 (bvmul lt!445288 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322505 (or (= lt!445288 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445288 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445288)))))

(assert (=> b!322505 (= lt!445288 ((_ sign_extend 32) (size!8955 (buf!8097 (_2!13415 (increaseBitIndex!0 thiss!1793))))))))

(assert (= (and d!105858 res!264739) b!322504))

(assert (= (and b!322504 res!264738) b!322505))

(declare-fun m!460783 () Bool)

(assert (=> d!105858 m!460783))

(declare-fun m!460785 () Bool)

(assert (=> d!105858 m!460785))

(assert (=> b!322447 d!105858))

(declare-fun d!105860 () Bool)

(declare-fun e!232391 () Bool)

(assert (=> d!105860 e!232391))

(declare-fun res!264745 () Bool)

(assert (=> d!105860 (=> (not res!264745) (not e!232391))))

(declare-fun lt!445305 () tuple2!23572)

(declare-fun lt!445306 () (_ BitVec 64))

(declare-fun lt!445303 () (_ BitVec 64))

(assert (=> d!105860 (= res!264745 (= (bvadd lt!445306 lt!445303) (bitIndex!0 (size!8955 (buf!8097 (_2!13415 lt!445305))) (currentByte!14932 (_2!13415 lt!445305)) (currentBit!14927 (_2!13415 lt!445305)))))))

(assert (=> d!105860 (or (not (= (bvand lt!445306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445303 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445306 lt!445303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105860 (= lt!445303 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!105860 (= lt!445306 (bitIndex!0 (size!8955 (buf!8097 thiss!1793)) (currentByte!14932 thiss!1793) (currentBit!14927 thiss!1793)))))

(declare-fun Unit!22026 () Unit!22020)

(declare-fun Unit!22027 () Unit!22020)

(assert (=> d!105860 (= lt!445305 (ite (bvslt (currentBit!14927 thiss!1793) #b00000000000000000000000000000111) (tuple2!23573 Unit!22026 (BitStream!14073 (buf!8097 thiss!1793) (currentByte!14932 thiss!1793) (bvadd (currentBit!14927 thiss!1793) #b00000000000000000000000000000001))) (tuple2!23573 Unit!22027 (BitStream!14073 (buf!8097 thiss!1793) (bvadd (currentByte!14932 thiss!1793) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!105860 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8955 (buf!8097 thiss!1793))) ((_ sign_extend 32) (currentByte!14932 thiss!1793)) ((_ sign_extend 32) (currentBit!14927 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!105860 (= (increaseBitIndex!0 thiss!1793) lt!445305)))

(declare-fun b!322510 () Bool)

(declare-fun res!264744 () Bool)

(assert (=> b!322510 (=> (not res!264744) (not e!232391))))

(declare-fun lt!445304 () (_ BitVec 64))

(declare-fun lt!445302 () (_ BitVec 64))

(assert (=> b!322510 (= res!264744 (= (bvsub lt!445304 lt!445302) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!322510 (or (= (bvand lt!445304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445302 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445304 lt!445302) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322510 (= lt!445302 (remainingBits!0 ((_ sign_extend 32) (size!8955 (buf!8097 (_2!13415 lt!445305)))) ((_ sign_extend 32) (currentByte!14932 (_2!13415 lt!445305))) ((_ sign_extend 32) (currentBit!14927 (_2!13415 lt!445305)))))))

(assert (=> b!322510 (= lt!445304 (remainingBits!0 ((_ sign_extend 32) (size!8955 (buf!8097 thiss!1793))) ((_ sign_extend 32) (currentByte!14932 thiss!1793)) ((_ sign_extend 32) (currentBit!14927 thiss!1793))))))

(declare-fun b!322511 () Bool)

(assert (=> b!322511 (= e!232391 (= (size!8955 (buf!8097 thiss!1793)) (size!8955 (buf!8097 (_2!13415 lt!445305)))))))

(assert (= (and d!105860 res!264745) b!322510))

(assert (= (and b!322510 res!264744) b!322511))

