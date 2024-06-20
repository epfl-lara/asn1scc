; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68840 () Bool)

(assert start!68840)

(declare-fun b!310679 () Bool)

(declare-fun res!254692 () Bool)

(declare-fun e!223210 () Bool)

(assert (=> b!310679 (=> (not res!254692) (not e!223210))))

(declare-datatypes ((array!18926 0))(
  ( (array!18927 (arr!9295 (Array (_ BitVec 32) (_ BitVec 8))) (size!8212 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13534 0))(
  ( (BitStream!13535 (buf!7828 array!18926) (currentByte!14401 (_ BitVec 32)) (currentBit!14396 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13534)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310679 (= res!254692 (validate_offset_bits!1 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19)) nBits!480))))

(declare-fun b!310680 () Bool)

(declare-fun e!223208 () Bool)

(declare-fun array_inv!7767 (array!18926) Bool)

(assert (=> b!310680 (= e!223208 (array_inv!7767 (buf!7828 bitStream!19)))))

(declare-fun b!310681 () Bool)

(declare-fun e!223211 () Bool)

(assert (=> b!310681 (= e!223210 e!223211)))

(declare-fun res!254693 () Bool)

(assert (=> b!310681 (=> (not res!254693) (not e!223211))))

(assert (=> b!310681 (= res!254693 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!23402 0))(
  ( (tuple2!23403 (_1!13294 Bool) (_2!13294 BitStream!13534)) )
))
(declare-fun lt!440484 () tuple2!23402)

(declare-fun readBit!0 (BitStream!13534) tuple2!23402)

(assert (=> b!310681 (= lt!440484 (readBit!0 bitStream!19))))

(declare-fun res!254694 () Bool)

(assert (=> start!68840 (=> (not res!254694) (not e!223210))))

(assert (=> start!68840 (= res!254694 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68840 e!223210))

(assert (=> start!68840 true))

(declare-fun inv!12 (BitStream!13534) Bool)

(assert (=> start!68840 (and (inv!12 bitStream!19) e!223208)))

(declare-fun b!310682 () Bool)

(declare-fun res!254695 () Bool)

(assert (=> b!310682 (=> (not res!254695) (not e!223210))))

(assert (=> b!310682 (= res!254695 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310683 () Bool)

(assert (=> b!310683 (= e!223211 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13294 lt!440484)))) ((_ sign_extend 32) (currentByte!14401 (_2!13294 lt!440484))) ((_ sign_extend 32) (currentBit!14396 (_2!13294 lt!440484))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!68840 res!254694) b!310679))

(assert (= (and b!310679 res!254692) b!310682))

(assert (= (and b!310682 res!254695) b!310681))

(assert (= (and b!310681 res!254693) b!310683))

(assert (= start!68840 b!310680))

(declare-fun m!448459 () Bool)

(assert (=> b!310683 m!448459))

(declare-fun m!448461 () Bool)

(assert (=> b!310679 m!448461))

(declare-fun m!448463 () Bool)

(assert (=> b!310681 m!448463))

(declare-fun m!448465 () Bool)

(assert (=> start!68840 m!448465))

(declare-fun m!448467 () Bool)

(assert (=> b!310680 m!448467))

(push 1)

(assert (not b!310680))

(assert (not b!310681))

(assert (not b!310683))

(assert (not b!310679))

(assert (not start!68840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102836 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102836 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13294 lt!440484)))) ((_ sign_extend 32) (currentByte!14401 (_2!13294 lt!440484))) ((_ sign_extend 32) (currentBit!14396 (_2!13294 lt!440484))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13294 lt!440484)))) ((_ sign_extend 32) (currentByte!14401 (_2!13294 lt!440484))) ((_ sign_extend 32) (currentBit!14396 (_2!13294 lt!440484)))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!26620 () Bool)

(assert (= bs!26620 d!102836))

(declare-fun m!448489 () Bool)

(assert (=> bs!26620 m!448489))

(assert (=> b!310683 d!102836))

(declare-fun d!102840 () Bool)

(assert (=> d!102840 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19))) nBits!480))))

(declare-fun bs!26621 () Bool)

(assert (= bs!26621 d!102840))

(declare-fun m!448491 () Bool)

(assert (=> bs!26621 m!448491))

(assert (=> b!310679 d!102840))

(declare-fun d!102842 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102842 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14396 bitStream!19) (currentByte!14401 bitStream!19) (size!8212 (buf!7828 bitStream!19))))))

(declare-fun bs!26622 () Bool)

(assert (= bs!26622 d!102842))

(declare-fun m!448493 () Bool)

(assert (=> bs!26622 m!448493))

(assert (=> start!68840 d!102842))

(declare-fun d!102846 () Bool)

(assert (=> d!102846 (= (array_inv!7767 (buf!7828 bitStream!19)) (bvsge (size!8212 (buf!7828 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310680 d!102846))

(declare-fun d!102850 () Bool)

(declare-fun e!223256 () Bool)

(assert (=> d!102850 e!223256))

(declare-fun res!254728 () Bool)

(assert (=> d!102850 (=> (not res!254728) (not e!223256))))

(declare-datatypes ((Unit!21511 0))(
  ( (Unit!21512) )
))
(declare-datatypes ((tuple2!23412 0))(
  ( (tuple2!23413 (_1!13299 Unit!21511) (_2!13299 BitStream!13534)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13534) tuple2!23412)

(assert (=> d!102850 (= res!254728 (= (buf!7828 (_2!13299 (increaseBitIndex!0 bitStream!19))) (buf!7828 bitStream!19)))))

(declare-fun lt!440550 () Bool)

(assert (=> d!102850 (= lt!440550 (not (= (bvand ((_ sign_extend 24) (select (arr!9295 (buf!7828 bitStream!19)) (currentByte!14401 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14396 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440553 () tuple2!23402)

(assert (=> d!102850 (= lt!440553 (tuple2!23403 (not (= (bvand ((_ sign_extend 24) (select (arr!9295 (buf!7828 bitStream!19)) (currentByte!14401 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14396 bitStream!19)))) #b00000000000000000000000000000000)) (_2!13299 (increaseBitIndex!0 bitStream!19))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!102850 (validate_offset_bit!0 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19)))))

(assert (=> d!102850 (= (readBit!0 bitStream!19) lt!440553)))

(declare-fun b!310722 () Bool)

(declare-fun lt!440547 () (_ BitVec 64))

(declare-fun lt!440552 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!310722 (= e!223256 (= (bitIndex!0 (size!8212 (buf!7828 (_2!13299 (increaseBitIndex!0 bitStream!19)))) (currentByte!14401 (_2!13299 (increaseBitIndex!0 bitStream!19))) (currentBit!14396 (_2!13299 (increaseBitIndex!0 bitStream!19)))) (bvadd lt!440552 lt!440547)))))

(assert (=> b!310722 (or (not (= (bvand lt!440552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440547 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440552 lt!440547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310722 (= lt!440547 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!310722 (= lt!440552 (bitIndex!0 (size!8212 (buf!7828 bitStream!19)) (currentByte!14401 bitStream!19) (currentBit!14396 bitStream!19)))))

(declare-fun lt!440548 () Bool)

(assert (=> b!310722 (= lt!440548 (not (= (bvand ((_ sign_extend 24) (select (arr!9295 (buf!7828 bitStream!19)) (currentByte!14401 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14396 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440551 () Bool)

(assert (=> b!310722 (= lt!440551 (not (= (bvand ((_ sign_extend 24) (select (arr!9295 (buf!7828 bitStream!19)) (currentByte!14401 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14396 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440549 () Bool)

(assert (=> b!310722 (= lt!440549 (not (= (bvand ((_ sign_extend 24) (select (arr!9295 (buf!7828 bitStream!19)) (currentByte!14401 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14396 bitStream!19)))) #b00000000000000000000000000000000)))))

(assert (= (and d!102850 res!254728) b!310722))

(declare-fun m!448531 () Bool)

(assert (=> d!102850 m!448531))

(declare-fun m!448533 () Bool)

(assert (=> d!102850 m!448533))

(declare-fun m!448535 () Bool)

(assert (=> d!102850 m!448535))

(declare-fun m!448537 () Bool)

(assert (=> d!102850 m!448537))

(declare-fun m!448539 () Bool)

(assert (=> b!310722 m!448539))

(assert (=> b!310722 m!448535))

(declare-fun m!448541 () Bool)

(assert (=> b!310722 m!448541))

(assert (=> b!310722 m!448531))

(assert (=> b!310722 m!448533))

(assert (=> b!310681 d!102850))

(push 1)

(assert (not d!102836))

(assert (not d!102840))

(assert (not d!102850))

(assert (not b!310722))

(assert (not d!102842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102870 () Bool)

(assert (=> d!102870 (= (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19))) (bvsub (bvmul ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14401 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14396 bitStream!19)))))))

(assert (=> d!102840 d!102870))

(declare-fun d!102872 () Bool)

(declare-fun e!223268 () Bool)

(assert (=> d!102872 e!223268))

(declare-fun res!254752 () Bool)

(assert (=> d!102872 (=> (not res!254752) (not e!223268))))

(declare-fun lt!440617 () (_ BitVec 64))

(declare-fun lt!440619 () (_ BitVec 64))

(declare-fun lt!440620 () (_ BitVec 64))

(assert (=> d!102872 (= res!254752 (= lt!440619 (bvsub lt!440620 lt!440617)))))

(assert (=> d!102872 (or (= (bvand lt!440620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440617 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440620 lt!440617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102872 (= lt!440617 (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13299 (increaseBitIndex!0 bitStream!19))))) ((_ sign_extend 32) (currentByte!14401 (_2!13299 (increaseBitIndex!0 bitStream!19)))) ((_ sign_extend 32) (currentBit!14396 (_2!13299 (increaseBitIndex!0 bitStream!19))))))))

(declare-fun lt!440616 () (_ BitVec 64))

(declare-fun lt!440618 () (_ BitVec 64))

(assert (=> d!102872 (= lt!440620 (bvmul lt!440616 lt!440618))))

(assert (=> d!102872 (or (= lt!440616 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440618 (bvsdiv (bvmul lt!440616 lt!440618) lt!440616)))))

(assert (=> d!102872 (= lt!440618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102872 (= lt!440616 ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13299 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102872 (= lt!440619 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14401 (_2!13299 (increaseBitIndex!0 bitStream!19)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14396 (_2!13299 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102872 (invariant!0 (currentBit!14396 (_2!13299 (increaseBitIndex!0 bitStream!19))) (currentByte!14401 (_2!13299 (increaseBitIndex!0 bitStream!19))) (size!8212 (buf!7828 (_2!13299 (increaseBitIndex!0 bitStream!19)))))))

(assert (=> d!102872 (= (bitIndex!0 (size!8212 (buf!7828 (_2!13299 (increaseBitIndex!0 bitStream!19)))) (currentByte!14401 (_2!13299 (increaseBitIndex!0 bitStream!19))) (currentBit!14396 (_2!13299 (increaseBitIndex!0 bitStream!19)))) lt!440619)))

(declare-fun b!310743 () Bool)

(declare-fun res!254751 () Bool)

(assert (=> b!310743 (=> (not res!254751) (not e!223268))))

(assert (=> b!310743 (= res!254751 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440619))))

(declare-fun b!310744 () Bool)

(declare-fun lt!440615 () (_ BitVec 64))

(assert (=> b!310744 (= e!223268 (bvsle lt!440619 (bvmul lt!440615 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310744 (or (= lt!440615 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440615 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440615)))))

(assert (=> b!310744 (= lt!440615 ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13299 (increaseBitIndex!0 bitStream!19))))))))

(assert (= (and d!102872 res!254752) b!310743))

(assert (= (and b!310743 res!254751) b!310744))

(declare-fun m!448551 () Bool)

(assert (=> d!102872 m!448551))

(declare-fun m!448553 () Bool)

(assert (=> d!102872 m!448553))

(assert (=> b!310722 d!102872))

(declare-fun d!102886 () Bool)

(declare-fun e!223276 () Bool)

(assert (=> d!102886 e!223276))

(declare-fun res!254768 () Bool)

(assert (=> d!102886 (=> (not res!254768) (not e!223276))))

(declare-fun lt!440664 () tuple2!23412)

(declare-fun lt!440660 () (_ BitVec 64))

(declare-fun lt!440661 () (_ BitVec 64))

(assert (=> d!102886 (= res!254768 (= (bvadd lt!440661 lt!440660) (bitIndex!0 (size!8212 (buf!7828 (_2!13299 lt!440664))) (currentByte!14401 (_2!13299 lt!440664)) (currentBit!14396 (_2!13299 lt!440664)))))))

(assert (=> d!102886 (or (not (= (bvand lt!440661 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440660 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440661 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440661 lt!440660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102886 (= lt!440660 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!102886 (= lt!440661 (bitIndex!0 (size!8212 (buf!7828 bitStream!19)) (currentByte!14401 bitStream!19) (currentBit!14396 bitStream!19)))))

(declare-fun Unit!21517 () Unit!21511)

(declare-fun Unit!21518 () Unit!21511)

(assert (=> d!102886 (= lt!440664 (ite (bvslt (currentBit!14396 bitStream!19) #b00000000000000000000000000000111) (tuple2!23413 Unit!21517 (BitStream!13535 (buf!7828 bitStream!19) (currentByte!14401 bitStream!19) (bvadd (currentBit!14396 bitStream!19) #b00000000000000000000000000000001))) (tuple2!23413 Unit!21518 (BitStream!13535 (buf!7828 bitStream!19) (bvadd (currentByte!14401 bitStream!19) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!102886 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102886 (= (increaseBitIndex!0 bitStream!19) lt!440664)))

(declare-fun b!310761 () Bool)

(declare-fun res!254767 () Bool)

(assert (=> b!310761 (=> (not res!254767) (not e!223276))))

(declare-fun lt!440662 () (_ BitVec 64))

(declare-fun lt!440663 () (_ BitVec 64))

(assert (=> b!310761 (= res!254767 (= (bvsub lt!440662 lt!440663) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!310761 (or (= (bvand lt!440662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440663 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440662 lt!440663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310761 (= lt!440663 (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13299 lt!440664)))) ((_ sign_extend 32) (currentByte!14401 (_2!13299 lt!440664))) ((_ sign_extend 32) (currentBit!14396 (_2!13299 lt!440664)))))))

(assert (=> b!310761 (= lt!440662 (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19))))))

(declare-fun b!310762 () Bool)

(assert (=> b!310762 (= e!223276 (= (size!8212 (buf!7828 bitStream!19)) (size!8212 (buf!7828 (_2!13299 lt!440664)))))))

(assert (= (and d!102886 res!254768) b!310761))

(assert (= (and b!310761 res!254767) b!310762))

(declare-fun m!448563 () Bool)

(assert (=> d!102886 m!448563))

(assert (=> d!102886 m!448541))

(assert (=> d!102886 m!448491))

(declare-fun m!448565 () Bool)

(assert (=> b!310761 m!448565))

(assert (=> b!310761 m!448491))

(assert (=> b!310722 d!102886))

(declare-fun d!102898 () Bool)

(declare-fun e!223277 () Bool)

(assert (=> d!102898 e!223277))

(declare-fun res!254770 () Bool)

(assert (=> d!102898 (=> (not res!254770) (not e!223277))))

(declare-fun lt!440669 () (_ BitVec 64))

(declare-fun lt!440670 () (_ BitVec 64))

(declare-fun lt!440667 () (_ BitVec 64))

(assert (=> d!102898 (= res!254770 (= lt!440669 (bvsub lt!440670 lt!440667)))))

(assert (=> d!102898 (or (= (bvand lt!440670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440670 lt!440667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102898 (= lt!440667 (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19))))))

(declare-fun lt!440666 () (_ BitVec 64))

(declare-fun lt!440668 () (_ BitVec 64))

(assert (=> d!102898 (= lt!440670 (bvmul lt!440666 lt!440668))))

(assert (=> d!102898 (or (= lt!440666 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440668 (bvsdiv (bvmul lt!440666 lt!440668) lt!440666)))))

(assert (=> d!102898 (= lt!440668 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102898 (= lt!440666 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))))))

(assert (=> d!102898 (= lt!440669 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14401 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14396 bitStream!19))))))

(assert (=> d!102898 (invariant!0 (currentBit!14396 bitStream!19) (currentByte!14401 bitStream!19) (size!8212 (buf!7828 bitStream!19)))))

(assert (=> d!102898 (= (bitIndex!0 (size!8212 (buf!7828 bitStream!19)) (currentByte!14401 bitStream!19) (currentBit!14396 bitStream!19)) lt!440669)))

(declare-fun b!310763 () Bool)

(declare-fun res!254769 () Bool)

(assert (=> b!310763 (=> (not res!254769) (not e!223277))))

(assert (=> b!310763 (= res!254769 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440669))))

(declare-fun b!310764 () Bool)

(declare-fun lt!440665 () (_ BitVec 64))

(assert (=> b!310764 (= e!223277 (bvsle lt!440669 (bvmul lt!440665 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310764 (or (= lt!440665 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440665 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440665)))))

(assert (=> b!310764 (= lt!440665 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))))))

(assert (= (and d!102898 res!254770) b!310763))

(assert (= (and b!310763 res!254769) b!310764))

(assert (=> d!102898 m!448491))

(assert (=> d!102898 m!448493))

(assert (=> b!310722 d!102898))

(declare-fun d!102902 () Bool)

(assert (=> d!102902 (= (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13294 lt!440484)))) ((_ sign_extend 32) (currentByte!14401 (_2!13294 lt!440484))) ((_ sign_extend 32) (currentBit!14396 (_2!13294 lt!440484)))) (bvsub (bvmul ((_ sign_extend 32) (size!8212 (buf!7828 (_2!13294 lt!440484)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14401 (_2!13294 lt!440484))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14396 (_2!13294 lt!440484))))))))

(assert (=> d!102836 d!102902))

(declare-fun d!102904 () Bool)

(assert (=> d!102904 (= (invariant!0 (currentBit!14396 bitStream!19) (currentByte!14401 bitStream!19) (size!8212 (buf!7828 bitStream!19))) (and (bvsge (currentBit!14396 bitStream!19) #b00000000000000000000000000000000) (bvslt (currentBit!14396 bitStream!19) #b00000000000000000000000000001000) (bvsge (currentByte!14401 bitStream!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!14401 bitStream!19) (size!8212 (buf!7828 bitStream!19))) (and (= (currentBit!14396 bitStream!19) #b00000000000000000000000000000000) (= (currentByte!14401 bitStream!19) (size!8212 (buf!7828 bitStream!19)))))))))

(assert (=> d!102842 d!102904))

(assert (=> d!102850 d!102886))

(declare-fun d!102906 () Bool)

(assert (=> d!102906 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8212 (buf!7828 bitStream!19))) ((_ sign_extend 32) (currentByte!14401 bitStream!19)) ((_ sign_extend 32) (currentBit!14396 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26631 () Bool)

(assert (= bs!26631 d!102906))

(assert (=> bs!26631 m!448491))

(assert (=> d!102850 d!102906))

(push 1)

(assert (not b!310761))

(assert (not d!102898))

(assert (not d!102886))

(assert (not d!102906))

(assert (not d!102872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

