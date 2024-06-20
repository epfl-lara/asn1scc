; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71730 () Bool)

(assert start!71730)

(declare-fun b!322121 () Bool)

(declare-fun res!264406 () Bool)

(declare-fun e!232130 () Bool)

(assert (=> b!322121 (=> (not res!264406) (not e!232130))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322121 (= res!264406 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322122 () Bool)

(declare-fun e!232131 () Bool)

(declare-datatypes ((array!20549 0))(
  ( (array!20550 (arr!10038 (Array (_ BitVec 32) (_ BitVec 8))) (size!8946 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14054 0))(
  ( (BitStream!14055 (buf!8088 array!20549) (currentByte!14905 (_ BitVec 32)) (currentBit!14900 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14054)

(declare-fun array_inv!8498 (array!20549) Bool)

(assert (=> b!322122 (= e!232131 (array_inv!8498 (buf!8088 thiss!1793)))))

(declare-fun b!322124 () Bool)

(declare-fun res!264409 () Bool)

(assert (=> b!322124 (=> (not res!264409) (not e!232130))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322124 (= res!264409 (validate_offset_bits!1 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322125 () Bool)

(declare-fun e!232129 () Bool)

(assert (=> b!322125 (= e!232130 e!232129)))

(declare-fun res!264405 () Bool)

(assert (=> b!322125 (=> (not res!264405) (not e!232129))))

(assert (=> b!322125 (= res!264405 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-datatypes ((tuple2!23524 0))(
  ( (tuple2!23525 (_1!13391 Bool) (_2!13391 BitStream!14054)) )
))
(declare-fun lt!444725 () tuple2!23524)

(declare-fun readBit!0 (BitStream!14054) tuple2!23524)

(assert (=> b!322125 (= lt!444725 (readBit!0 thiss!1793))))

(declare-fun b!322126 () Bool)

(declare-fun res!264407 () Bool)

(assert (=> b!322126 (=> (not res!264407) (not e!232130))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322126 (= res!264407 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264408 () Bool)

(assert (=> start!71730 (=> (not res!264408) (not e!232130))))

(assert (=> start!71730 (= res!264408 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71730 e!232130))

(assert (=> start!71730 true))

(declare-fun inv!12 (BitStream!14054) Bool)

(assert (=> start!71730 (and (inv!12 thiss!1793) e!232131)))

(declare-fun b!322123 () Bool)

(assert (=> b!322123 (= e!232129 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13391 lt!444725)))) ((_ sign_extend 32) (currentByte!14905 (_2!13391 lt!444725))) ((_ sign_extend 32) (currentBit!14900 (_2!13391 lt!444725))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))))

(assert (= (and start!71730 res!264408) b!322124))

(assert (= (and b!322124 res!264409) b!322126))

(assert (= (and b!322126 res!264407) b!322121))

(assert (= (and b!322121 res!264406) b!322125))

(assert (= (and b!322125 res!264405) b!322123))

(assert (= start!71730 b!322122))

(declare-fun m!460347 () Bool)

(assert (=> b!322123 m!460347))

(declare-fun m!460349 () Bool)

(assert (=> b!322126 m!460349))

(declare-fun m!460351 () Bool)

(assert (=> b!322124 m!460351))

(declare-fun m!460353 () Bool)

(assert (=> b!322122 m!460353))

(declare-fun m!460355 () Bool)

(assert (=> b!322125 m!460355))

(declare-fun m!460357 () Bool)

(assert (=> start!71730 m!460357))

(push 1)

(assert (not b!322122))

(assert (not b!322125))

(assert (not b!322124))

(assert (not b!322126))

(assert (not start!71730))

(assert (not b!322123))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105644 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105644 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13391 lt!444725)))) ((_ sign_extend 32) (currentByte!14905 (_2!13391 lt!444725))) ((_ sign_extend 32) (currentBit!14900 (_2!13391 lt!444725))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13391 lt!444725)))) ((_ sign_extend 32) (currentByte!14905 (_2!13391 lt!444725))) ((_ sign_extend 32) (currentBit!14900 (_2!13391 lt!444725)))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun bs!27835 () Bool)

(assert (= bs!27835 d!105644))

(declare-fun m!460361 () Bool)

(assert (=> bs!27835 m!460361))

(assert (=> b!322123 d!105644))

(declare-fun d!105646 () Bool)

(declare-fun e!232152 () Bool)

(assert (=> d!105646 e!232152))

(declare-fun res!264418 () Bool)

(assert (=> d!105646 (=> (not res!264418) (not e!232152))))

(declare-datatypes ((Unit!22002 0))(
  ( (Unit!22003) )
))
(declare-datatypes ((tuple2!23530 0))(
  ( (tuple2!23531 (_1!13394 Unit!22002) (_2!13394 BitStream!14054)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14054) tuple2!23530)

(assert (=> d!105646 (= res!264418 (= (buf!8088 (_2!13394 (increaseBitIndex!0 thiss!1793))) (buf!8088 thiss!1793)))))

(declare-fun lt!444785 () Bool)

(assert (=> d!105646 (= lt!444785 (not (= (bvand ((_ sign_extend 24) (select (arr!10038 (buf!8088 thiss!1793)) (currentByte!14905 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14900 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444786 () tuple2!23524)

(assert (=> d!105646 (= lt!444786 (tuple2!23525 (not (= (bvand ((_ sign_extend 24) (select (arr!10038 (buf!8088 thiss!1793)) (currentByte!14905 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14900 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13394 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105646 (validate_offset_bit!0 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793)))))

(assert (=> d!105646 (= (readBit!0 thiss!1793) lt!444786)))

(declare-fun b!322135 () Bool)

(declare-fun lt!444782 () (_ BitVec 64))

(declare-fun lt!444783 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322135 (= e!232152 (= (bitIndex!0 (size!8946 (buf!8088 (_2!13394 (increaseBitIndex!0 thiss!1793)))) (currentByte!14905 (_2!13394 (increaseBitIndex!0 thiss!1793))) (currentBit!14900 (_2!13394 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!444782 lt!444783)))))

(assert (=> b!322135 (or (not (= (bvand lt!444782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444783 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444782 lt!444783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322135 (= lt!444783 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322135 (= lt!444782 (bitIndex!0 (size!8946 (buf!8088 thiss!1793)) (currentByte!14905 thiss!1793) (currentBit!14900 thiss!1793)))))

(declare-fun lt!444784 () Bool)

(assert (=> b!322135 (= lt!444784 (not (= (bvand ((_ sign_extend 24) (select (arr!10038 (buf!8088 thiss!1793)) (currentByte!14905 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14900 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444787 () Bool)

(assert (=> b!322135 (= lt!444787 (not (= (bvand ((_ sign_extend 24) (select (arr!10038 (buf!8088 thiss!1793)) (currentByte!14905 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14900 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444788 () Bool)

(assert (=> b!322135 (= lt!444788 (not (= (bvand ((_ sign_extend 24) (select (arr!10038 (buf!8088 thiss!1793)) (currentByte!14905 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14900 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105646 res!264418) b!322135))

(declare-fun m!460393 () Bool)

(assert (=> d!105646 m!460393))

(declare-fun m!460395 () Bool)

(assert (=> d!105646 m!460395))

(declare-fun m!460399 () Bool)

(assert (=> d!105646 m!460399))

(declare-fun m!460401 () Bool)

(assert (=> d!105646 m!460401))

(declare-fun m!460403 () Bool)

(assert (=> b!322135 m!460403))

(assert (=> b!322135 m!460393))

(assert (=> b!322135 m!460395))

(declare-fun m!460405 () Bool)

(assert (=> b!322135 m!460405))

(assert (=> b!322135 m!460399))

(assert (=> b!322125 d!105646))

(declare-fun d!105662 () Bool)

(assert (=> d!105662 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27840 () Bool)

(assert (= bs!27840 d!105662))

(declare-fun m!460407 () Bool)

(assert (=> bs!27840 m!460407))

(assert (=> b!322124 d!105662))

(declare-fun d!105666 () Bool)

(assert (=> d!105666 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322126 d!105666))

(declare-fun d!105670 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105670 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14900 thiss!1793) (currentByte!14905 thiss!1793) (size!8946 (buf!8088 thiss!1793))))))

(declare-fun bs!27842 () Bool)

(assert (= bs!27842 d!105670))

(declare-fun m!460411 () Bool)

(assert (=> bs!27842 m!460411))

(assert (=> start!71730 d!105670))

(declare-fun d!105672 () Bool)

(assert (=> d!105672 (= (array_inv!8498 (buf!8088 thiss!1793)) (bvsge (size!8946 (buf!8088 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322122 d!105672))

(push 1)

(assert (not b!322135))

(assert (not d!105644))

(assert (not d!105662))

(assert (not d!105670))

(assert (not d!105646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105692 () Bool)

(assert (=> d!105692 (= (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793))) (bvsub (bvmul ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14905 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14900 thiss!1793)))))))

(assert (=> d!105662 d!105692))

(declare-fun d!105694 () Bool)

(assert (=> d!105694 (= (invariant!0 (currentBit!14900 thiss!1793) (currentByte!14905 thiss!1793) (size!8946 (buf!8088 thiss!1793))) (and (bvsge (currentBit!14900 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14900 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14905 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14905 thiss!1793) (size!8946 (buf!8088 thiss!1793))) (and (= (currentBit!14900 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14905 thiss!1793) (size!8946 (buf!8088 thiss!1793)))))))))

(assert (=> d!105670 d!105694))

(declare-fun d!105696 () Bool)

(declare-fun e!232165 () Bool)

(assert (=> d!105696 e!232165))

(declare-fun res!264444 () Bool)

(assert (=> d!105696 (=> (not res!264444) (not e!232165))))

(declare-fun lt!444856 () (_ BitVec 64))

(declare-fun lt!444859 () (_ BitVec 64))

(declare-fun lt!444860 () (_ BitVec 64))

(assert (=> d!105696 (= res!264444 (= lt!444856 (bvsub lt!444860 lt!444859)))))

(assert (=> d!105696 (or (= (bvand lt!444860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444860 lt!444859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105696 (= lt!444859 (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13394 (increaseBitIndex!0 thiss!1793))))) ((_ sign_extend 32) (currentByte!14905 (_2!13394 (increaseBitIndex!0 thiss!1793)))) ((_ sign_extend 32) (currentBit!14900 (_2!13394 (increaseBitIndex!0 thiss!1793))))))))

(declare-fun lt!444858 () (_ BitVec 64))

(declare-fun lt!444857 () (_ BitVec 64))

(assert (=> d!105696 (= lt!444860 (bvmul lt!444858 lt!444857))))

(assert (=> d!105696 (or (= lt!444858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444857 (bvsdiv (bvmul lt!444858 lt!444857) lt!444858)))))

(assert (=> d!105696 (= lt!444857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105696 (= lt!444858 ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13394 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105696 (= lt!444856 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14905 (_2!13394 (increaseBitIndex!0 thiss!1793)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14900 (_2!13394 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105696 (invariant!0 (currentBit!14900 (_2!13394 (increaseBitIndex!0 thiss!1793))) (currentByte!14905 (_2!13394 (increaseBitIndex!0 thiss!1793))) (size!8946 (buf!8088 (_2!13394 (increaseBitIndex!0 thiss!1793)))))))

(assert (=> d!105696 (= (bitIndex!0 (size!8946 (buf!8088 (_2!13394 (increaseBitIndex!0 thiss!1793)))) (currentByte!14905 (_2!13394 (increaseBitIndex!0 thiss!1793))) (currentBit!14900 (_2!13394 (increaseBitIndex!0 thiss!1793)))) lt!444856)))

(declare-fun b!322160 () Bool)

(declare-fun res!264443 () Bool)

(assert (=> b!322160 (=> (not res!264443) (not e!232165))))

(assert (=> b!322160 (= res!264443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444856))))

(declare-fun b!322161 () Bool)

(declare-fun lt!444855 () (_ BitVec 64))

(assert (=> b!322161 (= e!232165 (bvsle lt!444856 (bvmul lt!444855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322161 (or (= lt!444855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444855)))))

(assert (=> b!322161 (= lt!444855 ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13394 (increaseBitIndex!0 thiss!1793))))))))

(assert (= (and d!105696 res!264444) b!322160))

(assert (= (and b!322160 res!264443) b!322161))

(declare-fun m!460425 () Bool)

(assert (=> d!105696 m!460425))

(declare-fun m!460427 () Bool)

(assert (=> d!105696 m!460427))

(assert (=> b!322135 d!105696))

(declare-fun d!105704 () Bool)

(declare-fun e!232172 () Bool)

(assert (=> d!105704 e!232172))

(declare-fun res!264458 () Bool)

(assert (=> d!105704 (=> (not res!264458) (not e!232172))))

(declare-fun lt!444898 () (_ BitVec 64))

(declare-fun lt!444899 () (_ BitVec 64))

(declare-fun lt!444896 () tuple2!23530)

(assert (=> d!105704 (= res!264458 (= (bvadd lt!444899 lt!444898) (bitIndex!0 (size!8946 (buf!8088 (_2!13394 lt!444896))) (currentByte!14905 (_2!13394 lt!444896)) (currentBit!14900 (_2!13394 lt!444896)))))))

(assert (=> d!105704 (or (not (= (bvand lt!444899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444898 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444899 lt!444898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105704 (= lt!444898 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!105704 (= lt!444899 (bitIndex!0 (size!8946 (buf!8088 thiss!1793)) (currentByte!14905 thiss!1793) (currentBit!14900 thiss!1793)))))

(declare-fun Unit!22008 () Unit!22002)

(declare-fun Unit!22009 () Unit!22002)

(assert (=> d!105704 (= lt!444896 (ite (bvslt (currentBit!14900 thiss!1793) #b00000000000000000000000000000111) (tuple2!23531 Unit!22008 (BitStream!14055 (buf!8088 thiss!1793) (currentByte!14905 thiss!1793) (bvadd (currentBit!14900 thiss!1793) #b00000000000000000000000000000001))) (tuple2!23531 Unit!22009 (BitStream!14055 (buf!8088 thiss!1793) (bvadd (currentByte!14905 thiss!1793) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!105704 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!105704 (= (increaseBitIndex!0 thiss!1793) lt!444896)))

(declare-fun b!322174 () Bool)

(declare-fun res!264457 () Bool)

(assert (=> b!322174 (=> (not res!264457) (not e!232172))))

(declare-fun lt!444897 () (_ BitVec 64))

(declare-fun lt!444895 () (_ BitVec 64))

(assert (=> b!322174 (= res!264457 (= (bvsub lt!444897 lt!444895) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!322174 (or (= (bvand lt!444897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444895 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444897 lt!444895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322174 (= lt!444895 (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13394 lt!444896)))) ((_ sign_extend 32) (currentByte!14905 (_2!13394 lt!444896))) ((_ sign_extend 32) (currentBit!14900 (_2!13394 lt!444896)))))))

(assert (=> b!322174 (= lt!444897 (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793))))))

(declare-fun b!322175 () Bool)

(assert (=> b!322175 (= e!232172 (= (size!8946 (buf!8088 thiss!1793)) (size!8946 (buf!8088 (_2!13394 lt!444896)))))))

(assert (= (and d!105704 res!264458) b!322174))

(assert (= (and b!322174 res!264457) b!322175))

(declare-fun m!460433 () Bool)

(assert (=> d!105704 m!460433))

(assert (=> d!105704 m!460403))

(assert (=> d!105704 m!460407))

(declare-fun m!460435 () Bool)

(assert (=> b!322174 m!460435))

(assert (=> b!322174 m!460407))

(assert (=> b!322135 d!105704))

(declare-fun d!105710 () Bool)

(declare-fun e!232173 () Bool)

(assert (=> d!105710 e!232173))

(declare-fun res!264460 () Bool)

(assert (=> d!105710 (=> (not res!264460) (not e!232173))))

(declare-fun lt!444905 () (_ BitVec 64))

(declare-fun lt!444904 () (_ BitVec 64))

(declare-fun lt!444901 () (_ BitVec 64))

(assert (=> d!105710 (= res!264460 (= lt!444901 (bvsub lt!444905 lt!444904)))))

(assert (=> d!105710 (or (= (bvand lt!444905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444905 lt!444904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105710 (= lt!444904 (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793))))))

(declare-fun lt!444903 () (_ BitVec 64))

(declare-fun lt!444902 () (_ BitVec 64))

(assert (=> d!105710 (= lt!444905 (bvmul lt!444903 lt!444902))))

(assert (=> d!105710 (or (= lt!444903 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444902 (bvsdiv (bvmul lt!444903 lt!444902) lt!444903)))))

(assert (=> d!105710 (= lt!444902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105710 (= lt!444903 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))))))

(assert (=> d!105710 (= lt!444901 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14905 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14900 thiss!1793))))))

(assert (=> d!105710 (invariant!0 (currentBit!14900 thiss!1793) (currentByte!14905 thiss!1793) (size!8946 (buf!8088 thiss!1793)))))

(assert (=> d!105710 (= (bitIndex!0 (size!8946 (buf!8088 thiss!1793)) (currentByte!14905 thiss!1793) (currentBit!14900 thiss!1793)) lt!444901)))

(declare-fun b!322176 () Bool)

(declare-fun res!264459 () Bool)

(assert (=> b!322176 (=> (not res!264459) (not e!232173))))

(assert (=> b!322176 (= res!264459 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444901))))

(declare-fun b!322177 () Bool)

(declare-fun lt!444900 () (_ BitVec 64))

(assert (=> b!322177 (= e!232173 (bvsle lt!444901 (bvmul lt!444900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322177 (or (= lt!444900 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444900 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444900)))))

(assert (=> b!322177 (= lt!444900 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))))))

(assert (= (and d!105710 res!264460) b!322176))

(assert (= (and b!322176 res!264459) b!322177))

(assert (=> d!105710 m!460407))

(assert (=> d!105710 m!460411))

(assert (=> b!322135 d!105710))

(declare-fun d!105712 () Bool)

(assert (=> d!105712 (= (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13391 lt!444725)))) ((_ sign_extend 32) (currentByte!14905 (_2!13391 lt!444725))) ((_ sign_extend 32) (currentBit!14900 (_2!13391 lt!444725)))) (bvsub (bvmul ((_ sign_extend 32) (size!8946 (buf!8088 (_2!13391 lt!444725)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14905 (_2!13391 lt!444725))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14900 (_2!13391 lt!444725))))))))

(assert (=> d!105644 d!105712))

(assert (=> d!105646 d!105704))

(declare-fun d!105714 () Bool)

(assert (=> d!105714 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8946 (buf!8088 thiss!1793))) ((_ sign_extend 32) (currentByte!14905 thiss!1793)) ((_ sign_extend 32) (currentBit!14900 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27845 () Bool)

(assert (= bs!27845 d!105714))

(assert (=> bs!27845 m!460407))

(assert (=> d!105646 d!105714))

(push 1)

(assert (not d!105704))

(assert (not d!105696))

(assert (not b!322174))

(assert (not d!105710))

(assert (not d!105714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

