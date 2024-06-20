; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72150 () Bool)

(assert start!72150)

(declare-fun b!323543 () Bool)

(declare-fun e!233091 () Bool)

(declare-datatypes ((array!20681 0))(
  ( (array!20682 (arr!10095 (Array (_ BitVec 32) (_ BitVec 8))) (size!9003 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14168 0))(
  ( (BitStream!14169 (buf!8145 array!20681) (currentByte!15016 (_ BitVec 32)) (currentBit!15011 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14168)

(declare-fun array_inv!8555 (array!20681) Bool)

(assert (=> b!323543 (= e!233091 (array_inv!8555 (buf!8145 thiss!1793)))))

(declare-fun b!323544 () Bool)

(declare-fun e!233088 () Bool)

(declare-fun e!233087 () Bool)

(assert (=> b!323544 (= e!233088 e!233087)))

(declare-fun res!265598 () Bool)

(assert (=> b!323544 (=> (not res!265598) (not e!233087))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((tuple2!23692 0))(
  ( (tuple2!23693 (_1!13475 Bool) (_2!13475 BitStream!14168)) )
))
(declare-fun lt!445967 () tuple2!23692)

(declare-datatypes ((tuple2!23694 0))(
  ( (tuple2!23695 (_1!13476 (_ BitVec 64)) (_2!13476 BitStream!14168)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23694)

(assert (=> b!323544 (= res!265598 (= (buf!8145 (_2!13476 (readNBitsLSBFirstsLoop!0 (_2!13475 lt!445967) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13475 lt!445967) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8145 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14168) tuple2!23692)

(assert (=> b!323544 (= lt!445967 (readBit!0 thiss!1793))))

(declare-fun b!323545 () Bool)

(declare-fun e!233089 () Bool)

(assert (=> b!323545 (= e!233089 e!233088)))

(declare-fun res!265596 () Bool)

(assert (=> b!323545 (=> (not res!265596) (not e!233088))))

(declare-fun lt!445970 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323545 (= res!265596 (validate_offset_bits!1 ((_ sign_extend 32) (size!9003 (buf!8145 thiss!1793))) ((_ sign_extend 32) (currentByte!15016 thiss!1793)) ((_ sign_extend 32) (currentBit!15011 thiss!1793)) lt!445970))))

(assert (=> b!323545 (= lt!445970 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun lt!445969 () (_ BitVec 64))

(declare-fun lt!445968 () (_ BitVec 64))

(declare-fun b!323546 () Bool)

(assert (=> b!323546 (= e!233087 (and (= lt!445968 (bvand lt!445970 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!445968 (bvand (bvadd lt!445969 lt!445970) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!323546 (= lt!445968 (bvand lt!445969 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323546 (= lt!445969 (bitIndex!0 (size!9003 (buf!8145 thiss!1793)) (currentByte!15016 thiss!1793) (currentBit!15011 thiss!1793)))))

(declare-fun res!265597 () Bool)

(assert (=> start!72150 (=> (not res!265597) (not e!233089))))

(assert (=> start!72150 (= res!265597 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72150 e!233089))

(assert (=> start!72150 true))

(declare-fun inv!12 (BitStream!14168) Bool)

(assert (=> start!72150 (and (inv!12 thiss!1793) e!233091)))

(declare-fun b!323547 () Bool)

(declare-fun res!265600 () Bool)

(assert (=> b!323547 (=> (not res!265600) (not e!233088))))

(assert (=> b!323547 (= res!265600 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323548 () Bool)

(declare-fun res!265599 () Bool)

(assert (=> b!323548 (=> (not res!265599) (not e!233088))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323548 (= res!265599 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72150 res!265597) b!323545))

(assert (= (and b!323545 res!265596) b!323548))

(assert (= (and b!323548 res!265599) b!323547))

(assert (= (and b!323547 res!265600) b!323544))

(assert (= (and b!323544 res!265598) b!323546))

(assert (= start!72150 b!323543))

(declare-fun m!461587 () Bool)

(assert (=> start!72150 m!461587))

(declare-fun m!461589 () Bool)

(assert (=> b!323546 m!461589))

(declare-fun m!461591 () Bool)

(assert (=> b!323545 m!461591))

(declare-fun m!461593 () Bool)

(assert (=> b!323543 m!461593))

(declare-fun m!461595 () Bool)

(assert (=> b!323548 m!461595))

(declare-fun m!461597 () Bool)

(assert (=> b!323544 m!461597))

(declare-fun m!461599 () Bool)

(assert (=> b!323544 m!461599))

(push 1)

(assert (not b!323546))

(assert (not b!323543))

(assert (not b!323548))

(assert (not b!323545))

(assert (not start!72150))

(assert (not b!323544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106072 () Bool)

(assert (=> d!106072 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323548 d!106072))

(declare-fun d!106074 () Bool)

(assert (=> d!106074 (= (array_inv!8555 (buf!8145 thiss!1793)) (bvsge (size!9003 (buf!8145 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323543 d!106074))

(declare-fun b!323611 () Bool)

(declare-fun e!233124 () Bool)

(declare-fun e!233123 () Bool)

(assert (=> b!323611 (= e!233124 e!233123)))

(declare-fun res!265647 () Bool)

(assert (=> b!323611 (=> res!265647 e!233123)))

(assert (=> b!323611 (= res!265647 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun b!323613 () Bool)

(declare-fun res!265651 () Bool)

(assert (=> b!323613 (=> (not res!265651) (not e!233124))))

(declare-fun lt!446039 () tuple2!23694)

(declare-fun lt!446038 () (_ BitVec 64))

(declare-fun lt!446037 () (_ BitVec 64))

(assert (=> b!323613 (= res!265651 (= (bitIndex!0 (size!9003 (buf!8145 (_2!13476 lt!446039))) (currentByte!15016 (_2!13476 lt!446039)) (currentBit!15011 (_2!13476 lt!446039))) (bvadd lt!446038 lt!446037)))))

(assert (=> b!323613 (or (not (= (bvand lt!446038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446037 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446038 lt!446037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323613 (= lt!446037 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!323613 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!323613 (= lt!446038 (bitIndex!0 (size!9003 (buf!8145 (_2!13475 lt!445967))) (currentByte!15016 (_2!13475 lt!445967)) (currentBit!15011 (_2!13475 lt!445967))))))

(declare-fun b!323614 () Bool)

(declare-fun res!265649 () Bool)

(assert (=> b!323614 (=> (not res!265649) (not e!233124))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323614 (= res!265649 (= (bvand (_1!13476 lt!446039) (onesLSBLong!0 nBits!548)) (_1!13476 lt!446039)))))

(declare-fun b!323615 () Bool)

(declare-fun e!233125 () tuple2!23694)

(assert (=> b!323615 (= e!233125 (tuple2!23695 (bvor acc!161 (ite (_1!13475 lt!445967) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13475 lt!445967)))))

(declare-fun b!323616 () Bool)

(declare-fun lt!446042 () tuple2!23694)

(assert (=> b!323616 (= e!233125 (tuple2!23695 (_1!13476 lt!446042) (_2!13476 lt!446042)))))

(declare-fun lt!446041 () tuple2!23692)

(assert (=> b!323616 (= lt!446041 (readBit!0 (_2!13475 lt!445967)))))

(assert (=> b!323616 (= lt!446042 (readNBitsLSBFirstsLoop!0 (_2!13475 lt!446041) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13475 lt!445967) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13475 lt!446041) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!446040 () (_ BitVec 64))

(declare-fun b!323617 () Bool)

(declare-datatypes ((tuple2!23704 0))(
  ( (tuple2!23705 (_1!13481 BitStream!14168) (_2!13481 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14168) tuple2!23704)

(assert (=> b!323617 (= e!233123 (= (= (bvand (bvlshr (_1!13476 lt!446039) lt!446040) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13481 (readBitPure!0 (_2!13475 lt!445967)))))))

(assert (=> b!323617 (and (bvsge lt!446040 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446040 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323617 (= lt!446040 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!323612 () Bool)

(declare-fun res!265648 () Bool)

(assert (=> b!323612 (=> (not res!265648) (not e!233124))))

(assert (=> b!323612 (= res!265648 (= (bvand (_1!13476 lt!446039) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13475 lt!445967) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun d!106076 () Bool)

(assert (=> d!106076 e!233124))

(declare-fun res!265650 () Bool)

(assert (=> d!106076 (=> (not res!265650) (not e!233124))))

(assert (=> d!106076 (= res!265650 (= (buf!8145 (_2!13476 lt!446039)) (buf!8145 (_2!13475 lt!445967))))))

(assert (=> d!106076 (= lt!446039 e!233125)))

(declare-fun c!15451 () Bool)

(assert (=> d!106076 (= c!15451 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!106076 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106076 (= (readNBitsLSBFirstsLoop!0 (_2!13475 lt!445967) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13475 lt!445967) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446039)))

(assert (= (and d!106076 c!15451) b!323615))

(assert (= (and d!106076 (not c!15451)) b!323616))

(assert (= (and d!106076 res!265650) b!323613))

(assert (= (and b!323613 res!265651) b!323612))

(assert (= (and b!323612 res!265648) b!323614))

(assert (= (and b!323614 res!265649) b!323611))

(assert (= (and b!323611 (not res!265647)) b!323617))

(declare-fun m!461633 () Bool)

(assert (=> b!323613 m!461633))

(declare-fun m!461635 () Bool)

(assert (=> b!323613 m!461635))

(declare-fun m!461637 () Bool)

(assert (=> b!323616 m!461637))

(declare-fun m!461639 () Bool)

(assert (=> b!323616 m!461639))

(declare-fun m!461641 () Bool)

(assert (=> b!323612 m!461641))

(declare-fun m!461643 () Bool)

(assert (=> b!323614 m!461643))

(declare-fun m!461645 () Bool)

(assert (=> b!323617 m!461645))

(assert (=> b!323544 d!106076))

(declare-fun d!106082 () Bool)

(declare-fun e!233144 () Bool)

(assert (=> d!106082 e!233144))

(declare-fun res!265664 () Bool)

(assert (=> d!106082 (=> (not res!265664) (not e!233144))))

(declare-datatypes ((Unit!22042 0))(
  ( (Unit!22043) )
))
(declare-datatypes ((tuple2!23706 0))(
  ( (tuple2!23707 (_1!13482 Unit!22042) (_2!13482 BitStream!14168)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14168) tuple2!23706)

(assert (=> d!106082 (= res!265664 (= (buf!8145 (_2!13482 (increaseBitIndex!0 thiss!1793))) (buf!8145 thiss!1793)))))

(declare-fun lt!446112 () Bool)

(assert (=> d!106082 (= lt!446112 (not (= (bvand ((_ sign_extend 24) (select (arr!10095 (buf!8145 thiss!1793)) (currentByte!15016 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15011 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446117 () tuple2!23692)

(assert (=> d!106082 (= lt!446117 (tuple2!23693 (not (= (bvand ((_ sign_extend 24) (select (arr!10095 (buf!8145 thiss!1793)) (currentByte!15016 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15011 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13482 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!106082 (validate_offset_bit!0 ((_ sign_extend 32) (size!9003 (buf!8145 thiss!1793))) ((_ sign_extend 32) (currentByte!15016 thiss!1793)) ((_ sign_extend 32) (currentBit!15011 thiss!1793)))))

(assert (=> d!106082 (= (readBit!0 thiss!1793) lt!446117)))

(declare-fun lt!446116 () (_ BitVec 64))

(declare-fun b!323630 () Bool)

(declare-fun lt!446111 () (_ BitVec 64))

(assert (=> b!323630 (= e!233144 (= (bitIndex!0 (size!9003 (buf!8145 (_2!13482 (increaseBitIndex!0 thiss!1793)))) (currentByte!15016 (_2!13482 (increaseBitIndex!0 thiss!1793))) (currentBit!15011 (_2!13482 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!446111 lt!446116)))))

(assert (=> b!323630 (or (not (= (bvand lt!446111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446116 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446111 lt!446116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323630 (= lt!446116 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323630 (= lt!446111 (bitIndex!0 (size!9003 (buf!8145 thiss!1793)) (currentByte!15016 thiss!1793) (currentBit!15011 thiss!1793)))))

(declare-fun lt!446113 () Bool)

(assert (=> b!323630 (= lt!446113 (not (= (bvand ((_ sign_extend 24) (select (arr!10095 (buf!8145 thiss!1793)) (currentByte!15016 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15011 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446115 () Bool)

(assert (=> b!323630 (= lt!446115 (not (= (bvand ((_ sign_extend 24) (select (arr!10095 (buf!8145 thiss!1793)) (currentByte!15016 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15011 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446114 () Bool)

(assert (=> b!323630 (= lt!446114 (not (= (bvand ((_ sign_extend 24) (select (arr!10095 (buf!8145 thiss!1793)) (currentByte!15016 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15011 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!106082 res!265664) b!323630))

(declare-fun m!461667 () Bool)

(assert (=> d!106082 m!461667))

(declare-fun m!461669 () Bool)

(assert (=> d!106082 m!461669))

(declare-fun m!461671 () Bool)

(assert (=> d!106082 m!461671))

(declare-fun m!461673 () Bool)

(assert (=> d!106082 m!461673))

(declare-fun m!461675 () Bool)

(assert (=> b!323630 m!461675))

(assert (=> b!323630 m!461669))

(assert (=> b!323630 m!461589))

(assert (=> b!323630 m!461671))

(assert (=> b!323630 m!461667))

(assert (=> b!323544 d!106082))

(declare-fun d!106092 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106092 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!9003 (buf!8145 thiss!1793))) ((_ sign_extend 32) (currentByte!15016 thiss!1793)) ((_ sign_extend 32) (currentBit!15011 thiss!1793)) lt!445970) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9003 (buf!8145 thiss!1793))) ((_ sign_extend 32) (currentByte!15016 thiss!1793)) ((_ sign_extend 32) (currentBit!15011 thiss!1793))) lt!445970))))

(declare-fun bs!27950 () Bool)

(assert (= bs!27950 d!106092))

(declare-fun m!461681 () Bool)

(assert (=> bs!27950 m!461681))

(assert (=> b!323545 d!106092))

(declare-fun d!106096 () Bool)

(declare-fun e!233148 () Bool)

(assert (=> d!106096 e!233148))

(declare-fun res!265671 () Bool)

(assert (=> d!106096 (=> (not res!265671) (not e!233148))))

(declare-fun lt!446140 () (_ BitVec 64))

(declare-fun lt!446141 () (_ BitVec 64))

(declare-fun lt!446138 () (_ BitVec 64))

(assert (=> d!106096 (= res!265671 (= lt!446138 (bvsub lt!446141 lt!446140)))))

(assert (=> d!106096 (or (= (bvand lt!446141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446141 lt!446140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106096 (= lt!446140 (remainingBits!0 ((_ sign_extend 32) (size!9003 (buf!8145 thiss!1793))) ((_ sign_extend 32) (currentByte!15016 thiss!1793)) ((_ sign_extend 32) (currentBit!15011 thiss!1793))))))

(declare-fun lt!446137 () (_ BitVec 64))

(declare-fun lt!446139 () (_ BitVec 64))

(assert (=> d!106096 (= lt!446141 (bvmul lt!446137 lt!446139))))

(assert (=> d!106096 (or (= lt!446137 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446139 (bvsdiv (bvmul lt!446137 lt!446139) lt!446137)))))

(assert (=> d!106096 (= lt!446139 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106096 (= lt!446137 ((_ sign_extend 32) (size!9003 (buf!8145 thiss!1793))))))

(assert (=> d!106096 (= lt!446138 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15016 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15011 thiss!1793))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106096 (invariant!0 (currentBit!15011 thiss!1793) (currentByte!15016 thiss!1793) (size!9003 (buf!8145 thiss!1793)))))

(assert (=> d!106096 (= (bitIndex!0 (size!9003 (buf!8145 thiss!1793)) (currentByte!15016 thiss!1793) (currentBit!15011 thiss!1793)) lt!446138)))

(declare-fun b!323637 () Bool)

(declare-fun res!265672 () Bool)

(assert (=> b!323637 (=> (not res!265672) (not e!233148))))

(assert (=> b!323637 (= res!265672 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446138))))

(declare-fun b!323638 () Bool)

(declare-fun lt!446136 () (_ BitVec 64))

(assert (=> b!323638 (= e!233148 (bvsle lt!446138 (bvmul lt!446136 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323638 (or (= lt!446136 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446136 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446136)))))

(assert (=> b!323638 (= lt!446136 ((_ sign_extend 32) (size!9003 (buf!8145 thiss!1793))))))

(assert (= (and d!106096 res!265671) b!323637))

(assert (= (and b!323637 res!265672) b!323638))

(assert (=> d!106096 m!461681))

(declare-fun m!461683 () Bool)

(assert (=> d!106096 m!461683))

(assert (=> b!323546 d!106096))

(declare-fun d!106102 () Bool)

(assert (=> d!106102 (= (inv!12 thiss!1793) (invariant!0 (currentBit!15011 thiss!1793) (currentByte!15016 thiss!1793) (size!9003 (buf!8145 thiss!1793))))))

(declare-fun bs!27953 () Bool)

(assert (= bs!27953 d!106102))

(assert (=> bs!27953 m!461683))

(assert (=> start!72150 d!106102))

(push 1)

(assert (not d!106102))

(assert (not b!323617))

(assert (not b!323616))

(assert (not b!323630))

(assert (not d!106092))

(assert (not b!323612))

(assert (not b!323613))

(assert (not d!106096))

(assert (not b!323614))

(assert (not d!106082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

