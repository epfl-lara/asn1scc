; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50936 () Bool)

(assert start!50936)

(declare-datatypes ((array!12742 0))(
  ( (array!12743 (arr!6586 (Array (_ BitVec 32) (_ BitVec 8))) (size!5599 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10162 0))(
  ( (BitStream!10163 (buf!6074 array!12742) (currentByte!11260 (_ BitVec 32)) (currentBit!11255 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10162)

(declare-datatypes ((tuple2!20190 0))(
  ( (tuple2!20191 (_1!10999 (_ BitVec 64)) (_2!10999 BitStream!10162)) )
))
(declare-fun lt!373417 () tuple2!20190)

(declare-fun b!238746 () Bool)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun e!164937 () Bool)

(declare-datatypes ((tuple2!20192 0))(
  ( (tuple2!20193 (_1!11000 BitStream!10162) (_2!11000 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10162) tuple2!20192)

(assert (=> b!238746 (= e!164937 (not (= (= (bvand (bvlshr (_1!10999 lt!373417) ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!11000 (readBitPure!0 thiss!1830)))))))

(declare-fun b!238747 () Bool)

(declare-fun e!164935 () Bool)

(declare-fun e!164939 () Bool)

(assert (=> b!238747 (= e!164935 e!164939)))

(declare-fun res!199571 () Bool)

(assert (=> b!238747 (=> res!199571 e!164939)))

(assert (=> b!238747 (= res!199571 (not (= (buf!6074 (_2!10999 lt!373417)) (buf!6074 thiss!1830))))))

(declare-datatypes ((tuple2!20194 0))(
  ( (tuple2!20195 (_1!11001 Bool) (_2!11001 BitStream!10162)) )
))
(declare-fun lt!373419 () tuple2!20194)

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20190)

(assert (=> b!238747 (= lt!373417 (readNLeastSignificantBitsLoop!0 (_2!11001 lt!373419) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!11001 lt!373419) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10162) tuple2!20194)

(assert (=> b!238747 (= lt!373419 (readBit!0 thiss!1830))))

(declare-fun b!238748 () Bool)

(declare-fun e!164936 () Bool)

(assert (=> b!238748 (= e!164936 e!164935)))

(declare-fun res!199570 () Bool)

(assert (=> b!238748 (=> (not res!199570) (not e!164935))))

(declare-fun lt!373418 () (_ BitVec 64))

(assert (=> b!238748 (= res!199570 (and (= (bvand acc!170 lt!373418) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238748 (= lt!373418 (onesLSBLong!0 nBits!581))))

(declare-fun b!238749 () Bool)

(declare-fun res!199573 () Bool)

(assert (=> b!238749 (=> (not res!199573) (not e!164936))))

(assert (=> b!238749 (= res!199573 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!199574 () Bool)

(declare-fun e!164934 () Bool)

(assert (=> start!50936 (=> (not res!199574) (not e!164934))))

(assert (=> start!50936 (= res!199574 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50936 e!164934))

(assert (=> start!50936 true))

(declare-fun e!164938 () Bool)

(declare-fun inv!12 (BitStream!10162) Bool)

(assert (=> start!50936 (and (inv!12 thiss!1830) e!164938)))

(declare-fun b!238750 () Bool)

(declare-fun array_inv!5340 (array!12742) Bool)

(assert (=> b!238750 (= e!164938 (array_inv!5340 (buf!6074 thiss!1830)))))

(declare-fun b!238751 () Bool)

(assert (=> b!238751 (= e!164934 e!164936)))

(declare-fun res!199569 () Bool)

(assert (=> b!238751 (=> (not res!199569) (not e!164936))))

(declare-fun lt!373416 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238751 (= res!199569 (validate_offset_bits!1 ((_ sign_extend 32) (size!5599 (buf!6074 thiss!1830))) ((_ sign_extend 32) (currentByte!11260 thiss!1830)) ((_ sign_extend 32) (currentBit!11255 thiss!1830)) lt!373416))))

(assert (=> b!238751 (= lt!373416 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238752 () Bool)

(declare-fun res!199568 () Bool)

(assert (=> b!238752 (=> res!199568 e!164939)))

(assert (=> b!238752 (= res!199568 (or (not (= (bvlshr (_1!10999 lt!373417) lt!373416) (bvlshr acc!170 lt!373416))) (not (= (bvand (_1!10999 lt!373417) lt!373418) (_1!10999 lt!373417)))))))

(declare-fun b!238753 () Bool)

(declare-fun res!199575 () Bool)

(assert (=> b!238753 (=> res!199575 e!164939)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238753 (= res!199575 (not (= (bitIndex!0 (size!5599 (buf!6074 (_2!10999 lt!373417))) (currentByte!11260 (_2!10999 lt!373417)) (currentBit!11255 (_2!10999 lt!373417))) (bvadd (bitIndex!0 (size!5599 (buf!6074 thiss!1830)) (currentByte!11260 thiss!1830) (currentBit!11255 thiss!1830)) lt!373416))))))

(declare-fun b!238754 () Bool)

(assert (=> b!238754 (= e!164939 e!164937)))

(declare-fun res!199572 () Bool)

(assert (=> b!238754 (=> (not res!199572) (not e!164937))))

(assert (=> b!238754 (= res!199572 (bvslt i!752 nBits!581))))

(assert (= (and start!50936 res!199574) b!238751))

(assert (= (and b!238751 res!199569) b!238749))

(assert (= (and b!238749 res!199573) b!238748))

(assert (= (and b!238748 res!199570) b!238747))

(assert (= (and b!238747 (not res!199571)) b!238753))

(assert (= (and b!238753 (not res!199575)) b!238752))

(assert (= (and b!238752 (not res!199568)) b!238754))

(assert (= (and b!238754 res!199572) b!238746))

(assert (= start!50936 b!238750))

(declare-fun m!360825 () Bool)

(assert (=> b!238749 m!360825))

(declare-fun m!360827 () Bool)

(assert (=> start!50936 m!360827))

(declare-fun m!360829 () Bool)

(assert (=> b!238748 m!360829))

(declare-fun m!360831 () Bool)

(assert (=> b!238746 m!360831))

(declare-fun m!360833 () Bool)

(assert (=> b!238750 m!360833))

(declare-fun m!360835 () Bool)

(assert (=> b!238753 m!360835))

(declare-fun m!360837 () Bool)

(assert (=> b!238753 m!360837))

(declare-fun m!360839 () Bool)

(assert (=> b!238751 m!360839))

(declare-fun m!360841 () Bool)

(assert (=> b!238747 m!360841))

(declare-fun m!360843 () Bool)

(assert (=> b!238747 m!360843))

(push 1)

(assert (not b!238748))

(assert (not b!238747))

(assert (not start!50936))

(assert (not b!238746))

(assert (not b!238749))

(assert (not b!238751))

(assert (not b!238750))

(assert (not b!238753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80260 () Bool)

(assert (=> d!80260 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!238749 d!80260))

(declare-fun d!80262 () Bool)

(declare-fun e!164988 () Bool)

(assert (=> d!80262 e!164988))

(declare-fun res!199637 () Bool)

(assert (=> d!80262 (=> (not res!199637) (not e!164988))))

(declare-fun lt!373480 () (_ BitVec 64))

(declare-fun lt!373482 () (_ BitVec 64))

(declare-fun lt!373483 () (_ BitVec 64))

(assert (=> d!80262 (= res!199637 (= lt!373482 (bvsub lt!373480 lt!373483)))))

(assert (=> d!80262 (or (= (bvand lt!373480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373480 lt!373483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80262 (= lt!373483 (remainingBits!0 ((_ sign_extend 32) (size!5599 (buf!6074 (_2!10999 lt!373417)))) ((_ sign_extend 32) (currentByte!11260 (_2!10999 lt!373417))) ((_ sign_extend 32) (currentBit!11255 (_2!10999 lt!373417)))))))

(declare-fun lt!373481 () (_ BitVec 64))

(declare-fun lt!373484 () (_ BitVec 64))

(assert (=> d!80262 (= lt!373480 (bvmul lt!373481 lt!373484))))

(assert (=> d!80262 (or (= lt!373481 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373484 (bvsdiv (bvmul lt!373481 lt!373484) lt!373481)))))

(assert (=> d!80262 (= lt!373484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80262 (= lt!373481 ((_ sign_extend 32) (size!5599 (buf!6074 (_2!10999 lt!373417)))))))

(assert (=> d!80262 (= lt!373482 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11260 (_2!10999 lt!373417))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11255 (_2!10999 lt!373417)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80262 (invariant!0 (currentBit!11255 (_2!10999 lt!373417)) (currentByte!11260 (_2!10999 lt!373417)) (size!5599 (buf!6074 (_2!10999 lt!373417))))))

(assert (=> d!80262 (= (bitIndex!0 (size!5599 (buf!6074 (_2!10999 lt!373417))) (currentByte!11260 (_2!10999 lt!373417)) (currentBit!11255 (_2!10999 lt!373417))) lt!373482)))

(declare-fun b!238821 () Bool)

(declare-fun res!199636 () Bool)

(assert (=> b!238821 (=> (not res!199636) (not e!164988))))

(assert (=> b!238821 (= res!199636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373482))))

(declare-fun b!238822 () Bool)

(declare-fun lt!373485 () (_ BitVec 64))

(assert (=> b!238822 (= e!164988 (bvsle lt!373482 (bvmul lt!373485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238822 (or (= lt!373485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373485)))))

(assert (=> b!238822 (= lt!373485 ((_ sign_extend 32) (size!5599 (buf!6074 (_2!10999 lt!373417)))))))

(assert (= (and d!80262 res!199637) b!238821))

(assert (= (and b!238821 res!199636) b!238822))

(declare-fun m!360893 () Bool)

(assert (=> d!80262 m!360893))

(declare-fun m!360895 () Bool)

(assert (=> d!80262 m!360895))

(assert (=> b!238753 d!80262))

(declare-fun d!80264 () Bool)

(declare-fun e!164989 () Bool)

(assert (=> d!80264 e!164989))

(declare-fun res!199639 () Bool)

(assert (=> d!80264 (=> (not res!199639) (not e!164989))))

(declare-fun lt!373489 () (_ BitVec 64))

(declare-fun lt!373486 () (_ BitVec 64))

(declare-fun lt!373488 () (_ BitVec 64))

(assert (=> d!80264 (= res!199639 (= lt!373488 (bvsub lt!373486 lt!373489)))))

(assert (=> d!80264 (or (= (bvand lt!373486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373486 lt!373489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80264 (= lt!373489 (remainingBits!0 ((_ sign_extend 32) (size!5599 (buf!6074 thiss!1830))) ((_ sign_extend 32) (currentByte!11260 thiss!1830)) ((_ sign_extend 32) (currentBit!11255 thiss!1830))))))

(declare-fun lt!373487 () (_ BitVec 64))

(declare-fun lt!373490 () (_ BitVec 64))

(assert (=> d!80264 (= lt!373486 (bvmul lt!373487 lt!373490))))

(assert (=> d!80264 (or (= lt!373487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373490 (bvsdiv (bvmul lt!373487 lt!373490) lt!373487)))))

(assert (=> d!80264 (= lt!373490 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80264 (= lt!373487 ((_ sign_extend 32) (size!5599 (buf!6074 thiss!1830))))))

(assert (=> d!80264 (= lt!373488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11260 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11255 thiss!1830))))))

(assert (=> d!80264 (invariant!0 (currentBit!11255 thiss!1830) (currentByte!11260 thiss!1830) (size!5599 (buf!6074 thiss!1830)))))

(assert (=> d!80264 (= (bitIndex!0 (size!5599 (buf!6074 thiss!1830)) (currentByte!11260 thiss!1830) (currentBit!11255 thiss!1830)) lt!373488)))

(declare-fun b!238823 () Bool)

(declare-fun res!199638 () Bool)

(assert (=> b!238823 (=> (not res!199638) (not e!164989))))

(assert (=> b!238823 (= res!199638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373488))))

(declare-fun b!238824 () Bool)

(declare-fun lt!373491 () (_ BitVec 64))

(assert (=> b!238824 (= e!164989 (bvsle lt!373488 (bvmul lt!373491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238824 (or (= lt!373491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373491)))))

(assert (=> b!238824 (= lt!373491 ((_ sign_extend 32) (size!5599 (buf!6074 thiss!1830))))))

(assert (= (and d!80264 res!199639) b!238823))

(assert (= (and b!238823 res!199638) b!238824))

(declare-fun m!360897 () Bool)

(assert (=> d!80264 m!360897))

(declare-fun m!360899 () Bool)

(assert (=> d!80264 m!360899))

(assert (=> b!238753 d!80264))

(declare-fun d!80266 () Bool)

(assert (=> d!80266 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!238748 d!80266))

(declare-fun d!80268 () Bool)

(declare-fun lt!373494 () tuple2!20194)

(assert (=> d!80268 (= lt!373494 (readBit!0 thiss!1830))))

(assert (=> d!80268 (= (readBitPure!0 thiss!1830) (tuple2!20193 (_2!11001 lt!373494) (_1!11001 lt!373494)))))

(declare-fun bs!20080 () Bool)

(assert (= bs!20080 d!80268))

(assert (=> bs!20080 m!360843))

(assert (=> b!238746 d!80268))

(declare-fun b!238863 () Bool)

(declare-fun e!165012 () tuple2!20190)

(declare-fun lt!373575 () tuple2!20190)

(assert (=> b!238863 (= e!165012 (tuple2!20191 (_1!10999 lt!373575) (_2!10999 lt!373575)))))

(declare-fun lt!373567 () tuple2!20194)

(assert (=> b!238863 (= lt!373567 (readBit!0 (_2!11001 lt!373419)))))

(assert (=> b!238863 (= lt!373575 (readNLeastSignificantBitsLoop!0 (_2!11001 lt!373567) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!11001 lt!373419) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!11001 lt!373567) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!80270 () Bool)

(declare-fun e!165013 () Bool)

(assert (=> d!80270 e!165013))

(declare-fun res!199670 () Bool)

(assert (=> d!80270 (=> (not res!199670) (not e!165013))))

(declare-fun lt!373572 () tuple2!20190)

(assert (=> d!80270 (= res!199670 (= (buf!6074 (_2!10999 lt!373572)) (buf!6074 (_2!11001 lt!373419))))))

(assert (=> d!80270 (= lt!373572 e!165012)))

(declare-fun c!11365 () Bool)

(assert (=> d!80270 (= c!11365 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80270 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80270 (= (readNLeastSignificantBitsLoop!0 (_2!11001 lt!373419) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!11001 lt!373419) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!373572)))

(declare-fun b!238864 () Bool)

(declare-fun res!199672 () Bool)

(assert (=> b!238864 (=> (not res!199672) (not e!165013))))

(assert (=> b!238864 (= res!199672 (= (bvand (_1!10999 lt!373572) (onesLSBLong!0 nBits!581)) (_1!10999 lt!373572)))))

(declare-fun b!238865 () Bool)

(declare-fun e!165014 () Bool)

(assert (=> b!238865 (= e!165013 e!165014)))

(declare-fun res!199671 () Bool)

(assert (=> b!238865 (=> res!199671 e!165014)))

(assert (=> b!238865 (= res!199671 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!238866 () Bool)

(declare-fun res!199668 () Bool)

(assert (=> b!238866 (=> (not res!199668) (not e!165013))))

(declare-fun lt!373571 () (_ BitVec 64))

(declare-fun lt!373574 () (_ BitVec 64))

(assert (=> b!238866 (= res!199668 (= (bitIndex!0 (size!5599 (buf!6074 (_2!10999 lt!373572))) (currentByte!11260 (_2!10999 lt!373572)) (currentBit!11255 (_2!10999 lt!373572))) (bvadd lt!373571 lt!373574)))))

(assert (=> b!238866 (or (not (= (bvand lt!373571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373574 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373571 lt!373574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238866 (= lt!373574 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238866 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238866 (= lt!373571 (bitIndex!0 (size!5599 (buf!6074 (_2!11001 lt!373419))) (currentByte!11260 (_2!11001 lt!373419)) (currentBit!11255 (_2!11001 lt!373419))))))

(declare-fun b!238867 () Bool)

(declare-fun lt!373568 () (_ BitVec 64))

(assert (=> b!238867 (= e!165014 (= (= (bvand (bvlshr (_1!10999 lt!373572) lt!373568) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!11000 (readBitPure!0 (_2!11001 lt!373419)))))))

(assert (=> b!238867 (and (bvsge lt!373568 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373568 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!373569 () (_ BitVec 32))

(assert (=> b!238867 (= lt!373568 ((_ sign_extend 32) (bvsub lt!373569 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238867 (or (= (bvand lt!373569 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!373569 #b10000000000000000000000000000000) (bvand (bvsub lt!373569 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238867 (= lt!373569 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!238867 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!238868 () Bool)

(declare-fun res!199669 () Bool)

(assert (=> b!238868 (=> (not res!199669) (not e!165013))))

(declare-fun lt!373570 () (_ BitVec 64))

(declare-fun lt!373573 () (_ BitVec 64))

(assert (=> b!238868 (= res!199669 (= (bvlshr (_1!10999 lt!373572) lt!373573) (bvlshr (bvor acc!170 (ite (_1!11001 lt!373419) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!373570)))))

(assert (=> b!238868 (and (bvsge lt!373570 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373570 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238868 (= lt!373570 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238868 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238868 (and (bvsge lt!373573 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373573 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238868 (= lt!373573 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238868 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun b!238869 () Bool)

(assert (=> b!238869 (= e!165012 (tuple2!20191 (bvor acc!170 (ite (_1!11001 lt!373419) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!11001 lt!373419)))))

(assert (= (and d!80270 c!11365) b!238869))

(assert (= (and d!80270 (not c!11365)) b!238863))

(assert (= (and d!80270 res!199670) b!238866))

(assert (= (and b!238866 res!199668) b!238868))

(assert (= (and b!238868 res!199669) b!238864))

(assert (= (and b!238864 res!199672) b!238865))

(assert (= (and b!238865 (not res!199671)) b!238867))

(declare-fun m!360923 () Bool)

(assert (=> b!238863 m!360923))

(declare-fun m!360925 () Bool)

(assert (=> b!238863 m!360925))

(assert (=> b!238864 m!360829))

(declare-fun m!360927 () Bool)

(assert (=> b!238866 m!360927))

(declare-fun m!360929 () Bool)

(assert (=> b!238866 m!360929))

(declare-fun m!360931 () Bool)

(assert (=> b!238867 m!360931))

(assert (=> b!238747 d!80270))

(declare-fun d!80282 () Bool)

(declare-fun e!165034 () Bool)

(assert (=> d!80282 e!165034))

(declare-fun res!199690 () Bool)

(assert (=> d!80282 (=> (not res!199690) (not e!165034))))

(declare-datatypes ((Unit!17403 0))(
  ( (Unit!17404) )
))
(declare-datatypes ((tuple2!20210 0))(
  ( (tuple2!20211 (_1!11009 Unit!17403) (_2!11009 BitStream!10162)) )
))
(declare-fun increaseBitIndex!0 (BitStream!10162) tuple2!20210)

(assert (=> d!80282 (= res!199690 (= (buf!6074 (_2!11009 (increaseBitIndex!0 thiss!1830))) (buf!6074 thiss!1830)))))

(declare-fun lt!373617 () Bool)

(assert (=> d!80282 (= lt!373617 (not (= (bvand ((_ sign_extend 24) (select (arr!6586 (buf!6074 thiss!1830)) (currentByte!11260 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11255 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373621 () tuple2!20194)

(assert (=> d!80282 (= lt!373621 (tuple2!20195 (not (= (bvand ((_ sign_extend 24) (select (arr!6586 (buf!6074 thiss!1830)) (currentByte!11260 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11255 thiss!1830)))) #b00000000000000000000000000000000)) (_2!11009 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!80282 (validate_offset_bit!0 ((_ sign_extend 32) (size!5599 (buf!6074 thiss!1830))) ((_ sign_extend 32) (currentByte!11260 thiss!1830)) ((_ sign_extend 32) (currentBit!11255 thiss!1830)))))

(assert (=> d!80282 (= (readBit!0 thiss!1830) lt!373621)))

(declare-fun lt!373619 () (_ BitVec 64))

(declare-fun b!238893 () Bool)

(declare-fun lt!373622 () (_ BitVec 64))

(assert (=> b!238893 (= e!165034 (= (bitIndex!0 (size!5599 (buf!6074 (_2!11009 (increaseBitIndex!0 thiss!1830)))) (currentByte!11260 (_2!11009 (increaseBitIndex!0 thiss!1830))) (currentBit!11255 (_2!11009 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!373619 lt!373622)))))

(assert (=> b!238893 (or (not (= (bvand lt!373619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373622 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373619 lt!373622) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238893 (= lt!373622 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!238893 (= lt!373619 (bitIndex!0 (size!5599 (buf!6074 thiss!1830)) (currentByte!11260 thiss!1830) (currentBit!11255 thiss!1830)))))

(declare-fun lt!373618 () Bool)

(assert (=> b!238893 (= lt!373618 (not (= (bvand ((_ sign_extend 24) (select (arr!6586 (buf!6074 thiss!1830)) (currentByte!11260 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11255 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373620 () Bool)

(assert (=> b!238893 (= lt!373620 (not (= (bvand ((_ sign_extend 24) (select (arr!6586 (buf!6074 thiss!1830)) (currentByte!11260 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11255 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373623 () Bool)

(assert (=> b!238893 (= lt!373623 (not (= (bvand ((_ sign_extend 24) (select (arr!6586 (buf!6074 thiss!1830)) (currentByte!11260 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11255 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80282 res!199690) b!238893))

(declare-fun m!360943 () Bool)

(assert (=> d!80282 m!360943))

(declare-fun m!360945 () Bool)

(assert (=> d!80282 m!360945))

(declare-fun m!360947 () Bool)

(assert (=> d!80282 m!360947))

(declare-fun m!360949 () Bool)

(assert (=> d!80282 m!360949))

(assert (=> b!238893 m!360947))

(assert (=> b!238893 m!360945))

(assert (=> b!238893 m!360837))

(declare-fun m!360951 () Bool)

(assert (=> b!238893 m!360951))

(assert (=> b!238893 m!360943))

(assert (=> b!238747 d!80282))

(declare-fun d!80286 () Bool)

(assert (=> d!80286 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11255 thiss!1830) (currentByte!11260 thiss!1830) (size!5599 (buf!6074 thiss!1830))))))

(declare-fun bs!20084 () Bool)

(assert (= bs!20084 d!80286))

(assert (=> bs!20084 m!360899))

(assert (=> start!50936 d!80286))

(declare-fun d!80288 () Bool)

(assert (=> d!80288 (= (array_inv!5340 (buf!6074 thiss!1830)) (bvsge (size!5599 (buf!6074 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!238750 d!80288))

(declare-fun d!80290 () Bool)

(assert (=> d!80290 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5599 (buf!6074 thiss!1830))) ((_ sign_extend 32) (currentByte!11260 thiss!1830)) ((_ sign_extend 32) (currentBit!11255 thiss!1830)) lt!373416) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5599 (buf!6074 thiss!1830))) ((_ sign_extend 32) (currentByte!11260 thiss!1830)) ((_ sign_extend 32) (currentBit!11255 thiss!1830))) lt!373416))))

(declare-fun bs!20085 () Bool)

(assert (= bs!20085 d!80290))

(assert (=> bs!20085 m!360897))

(assert (=> b!238751 d!80290))

(push 1)

(assert (not d!80264))

(assert (not b!238867))

(assert (not d!80268))

(assert (not d!80282))

(assert (not b!238893))

(assert (not b!238863))

(assert (not d!80290))

(assert (not d!80286))

(assert (not b!238864))

(assert (not d!80262))

(assert (not b!238866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

