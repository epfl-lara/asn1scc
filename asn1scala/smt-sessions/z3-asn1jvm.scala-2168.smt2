; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55026 () Bool)

(assert start!55026)

(declare-fun res!215392 () Bool)

(declare-fun e!178154 () Bool)

(assert (=> start!55026 (=> (not res!215392) (not e!178154))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55026 (= res!215392 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55026 e!178154))

(assert (=> start!55026 true))

(declare-datatypes ((array!13940 0))(
  ( (array!13941 (arr!7100 (Array (_ BitVec 32) (_ BitVec 8))) (size!6113 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11148 0))(
  ( (BitStream!11149 (buf!6635 array!13940) (currentByte!12159 (_ BitVec 32)) (currentBit!12154 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11148)

(declare-fun e!178155 () Bool)

(declare-fun inv!12 (BitStream!11148) Bool)

(assert (=> start!55026 (and (inv!12 thiss!1754) e!178155)))

(declare-fun b!257004 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257004 (= e!178154 (not (invariant!0 (currentBit!12154 thiss!1754) (currentByte!12159 thiss!1754) (size!6113 (buf!6635 thiss!1754)))))))

(declare-fun b!257005 () Bool)

(declare-fun res!215394 () Bool)

(assert (=> b!257005 (=> (not res!215394) (not e!178154))))

(assert (=> b!257005 (= res!215394 (not (= from!526 nBits!535)))))

(declare-fun b!257006 () Bool)

(declare-fun res!215395 () Bool)

(assert (=> b!257006 (=> (not res!215395) (not e!178154))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257006 (= res!215395 (validate_offset_bits!1 ((_ sign_extend 32) (size!6113 (buf!6635 thiss!1754))) ((_ sign_extend 32) (currentByte!12159 thiss!1754)) ((_ sign_extend 32) (currentBit!12154 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257007 () Bool)

(declare-fun array_inv!5854 (array!13940) Bool)

(assert (=> b!257007 (= e!178155 (array_inv!5854 (buf!6635 thiss!1754)))))

(declare-fun b!257008 () Bool)

(declare-fun res!215393 () Bool)

(assert (=> b!257008 (=> (not res!215393) (not e!178154))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!21964 0))(
  ( (tuple2!21965 (_1!11918 Bool) (_2!11918 BitStream!11148)) )
))
(declare-fun readBit!0 (BitStream!11148) tuple2!21964)

(assert (=> b!257008 (= res!215393 (not (= (_1!11918 (readBit!0 thiss!1754)) expected!109)))))

(assert (= (and start!55026 res!215392) b!257006))

(assert (= (and b!257006 res!215395) b!257005))

(assert (= (and b!257005 res!215394) b!257008))

(assert (= (and b!257008 res!215393) b!257004))

(assert (= start!55026 b!257007))

(declare-fun m!386541 () Bool)

(assert (=> b!257006 m!386541))

(declare-fun m!386543 () Bool)

(assert (=> b!257008 m!386543))

(declare-fun m!386545 () Bool)

(assert (=> start!55026 m!386545))

(declare-fun m!386547 () Bool)

(assert (=> b!257004 m!386547))

(declare-fun m!386549 () Bool)

(assert (=> b!257007 m!386549))

(check-sat (not b!257004) (not b!257006) (not b!257008) (not b!257007) (not start!55026))
(check-sat)
(get-model)

(declare-fun d!86254 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86254 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6113 (buf!6635 thiss!1754))) ((_ sign_extend 32) (currentByte!12159 thiss!1754)) ((_ sign_extend 32) (currentBit!12154 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6113 (buf!6635 thiss!1754))) ((_ sign_extend 32) (currentByte!12159 thiss!1754)) ((_ sign_extend 32) (currentBit!12154 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21816 () Bool)

(assert (= bs!21816 d!86254))

(declare-fun m!386561 () Bool)

(assert (=> bs!21816 m!386561))

(assert (=> b!257006 d!86254))

(declare-fun d!86256 () Bool)

(assert (=> d!86256 (= (invariant!0 (currentBit!12154 thiss!1754) (currentByte!12159 thiss!1754) (size!6113 (buf!6635 thiss!1754))) (and (bvsge (currentBit!12154 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12154 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12159 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12159 thiss!1754) (size!6113 (buf!6635 thiss!1754))) (and (= (currentBit!12154 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12159 thiss!1754) (size!6113 (buf!6635 thiss!1754)))))))))

(assert (=> b!257004 d!86256))

(declare-fun d!86262 () Bool)

(assert (=> d!86262 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12154 thiss!1754) (currentByte!12159 thiss!1754) (size!6113 (buf!6635 thiss!1754))))))

(declare-fun bs!21819 () Bool)

(assert (= bs!21819 d!86262))

(assert (=> bs!21819 m!386547))

(assert (=> start!55026 d!86262))

(declare-fun d!86266 () Bool)

(declare-fun e!178182 () Bool)

(assert (=> d!86266 e!178182))

(declare-fun res!215412 () Bool)

(assert (=> d!86266 (=> (not res!215412) (not e!178182))))

(declare-datatypes ((Unit!18363 0))(
  ( (Unit!18364) )
))
(declare-datatypes ((tuple2!21968 0))(
  ( (tuple2!21969 (_1!11920 Unit!18363) (_2!11920 BitStream!11148)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11148) tuple2!21968)

(assert (=> d!86266 (= res!215412 (= (buf!6635 (_2!11920 (increaseBitIndex!0 thiss!1754))) (buf!6635 thiss!1754)))))

(declare-fun lt!398315 () Bool)

(assert (=> d!86266 (= lt!398315 (not (= (bvand ((_ sign_extend 24) (select (arr!7100 (buf!6635 thiss!1754)) (currentByte!12159 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12154 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398317 () tuple2!21964)

(assert (=> d!86266 (= lt!398317 (tuple2!21965 (not (= (bvand ((_ sign_extend 24) (select (arr!7100 (buf!6635 thiss!1754)) (currentByte!12159 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12154 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11920 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86266 (validate_offset_bit!0 ((_ sign_extend 32) (size!6113 (buf!6635 thiss!1754))) ((_ sign_extend 32) (currentByte!12159 thiss!1754)) ((_ sign_extend 32) (currentBit!12154 thiss!1754)))))

(assert (=> d!86266 (= (readBit!0 thiss!1754) lt!398317)))

(declare-fun lt!398320 () (_ BitVec 64))

(declare-fun lt!398318 () (_ BitVec 64))

(declare-fun b!257028 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257028 (= e!178182 (= (bitIndex!0 (size!6113 (buf!6635 (_2!11920 (increaseBitIndex!0 thiss!1754)))) (currentByte!12159 (_2!11920 (increaseBitIndex!0 thiss!1754))) (currentBit!12154 (_2!11920 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!398318 lt!398320)))))

(assert (=> b!257028 (or (not (= (bvand lt!398318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398320 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398318 lt!398320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257028 (= lt!398320 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257028 (= lt!398318 (bitIndex!0 (size!6113 (buf!6635 thiss!1754)) (currentByte!12159 thiss!1754) (currentBit!12154 thiss!1754)))))

(declare-fun lt!398319 () Bool)

(assert (=> b!257028 (= lt!398319 (not (= (bvand ((_ sign_extend 24) (select (arr!7100 (buf!6635 thiss!1754)) (currentByte!12159 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12154 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398314 () Bool)

(assert (=> b!257028 (= lt!398314 (not (= (bvand ((_ sign_extend 24) (select (arr!7100 (buf!6635 thiss!1754)) (currentByte!12159 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12154 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398316 () Bool)

(assert (=> b!257028 (= lt!398316 (not (= (bvand ((_ sign_extend 24) (select (arr!7100 (buf!6635 thiss!1754)) (currentByte!12159 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12154 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86266 res!215412) b!257028))

(declare-fun m!386565 () Bool)

(assert (=> d!86266 m!386565))

(declare-fun m!386567 () Bool)

(assert (=> d!86266 m!386567))

(declare-fun m!386569 () Bool)

(assert (=> d!86266 m!386569))

(declare-fun m!386571 () Bool)

(assert (=> d!86266 m!386571))

(assert (=> b!257028 m!386569))

(assert (=> b!257028 m!386567))

(assert (=> b!257028 m!386565))

(declare-fun m!386577 () Bool)

(assert (=> b!257028 m!386577))

(declare-fun m!386581 () Bool)

(assert (=> b!257028 m!386581))

(assert (=> b!257008 d!86266))

(declare-fun d!86274 () Bool)

(assert (=> d!86274 (= (array_inv!5854 (buf!6635 thiss!1754)) (bvsge (size!6113 (buf!6635 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257007 d!86274))

(check-sat (not b!257028) (not d!86262) (not d!86266) (not d!86254))
(check-sat)
