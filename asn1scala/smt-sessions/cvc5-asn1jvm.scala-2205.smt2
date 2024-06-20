; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55876 () Bool)

(assert start!55876)

(declare-fun b!259623 () Bool)

(declare-fun e!180161 () Bool)

(declare-fun e!180162 () Bool)

(assert (=> b!259623 (= e!180161 e!180162)))

(declare-fun res!217462 () Bool)

(assert (=> b!259623 (=> (not res!217462) (not e!180162))))

(declare-datatypes ((array!14205 0))(
  ( (array!14206 (arr!7207 (Array (_ BitVec 32) (_ BitVec 8))) (size!6220 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11362 0))(
  ( (BitStream!11363 (buf!6742 array!14205) (currentByte!12392 (_ BitVec 32)) (currentBit!12387 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22256 0))(
  ( (tuple2!22257 (_1!12064 Bool) (_2!12064 BitStream!11362)) )
))
(declare-fun lt!401533 () tuple2!22256)

(declare-fun expected!109 () Bool)

(assert (=> b!259623 (= res!217462 (= (_1!12064 lt!401533) expected!109))))

(declare-fun thiss!1754 () BitStream!11362)

(declare-fun readBit!0 (BitStream!11362) tuple2!22256)

(assert (=> b!259623 (= lt!401533 (readBit!0 thiss!1754))))

(declare-fun lt!401530 () (_ BitVec 64))

(declare-fun lt!401532 () (_ BitVec 64))

(declare-fun b!259624 () Bool)

(declare-fun from!526 () (_ BitVec 64))

(assert (=> b!259624 (= e!180162 (not (or (= lt!401532 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!401532 (bvand (bvsub lt!401530 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!259624 (= lt!401532 (bvand lt!401530 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259624 (= lt!401530 (bvadd (bitIndex!0 (size!6220 (buf!6742 thiss!1754)) (currentByte!12392 thiss!1754) (currentBit!12387 thiss!1754)) nBits!535))))

(declare-fun lt!401531 () tuple2!22256)

(declare-fun checkBitsLoop!0 (BitStream!11362 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22256)

(assert (=> b!259624 (= lt!401531 (checkBitsLoop!0 (_2!12064 lt!401533) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259624 (validate_offset_bits!1 ((_ sign_extend 32) (size!6220 (buf!6742 (_2!12064 lt!401533)))) ((_ sign_extend 32) (currentByte!12392 (_2!12064 lt!401533))) ((_ sign_extend 32) (currentBit!12387 (_2!12064 lt!401533))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18483 0))(
  ( (Unit!18484) )
))
(declare-fun lt!401534 () Unit!18483)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11362 BitStream!11362 (_ BitVec 64) (_ BitVec 64)) Unit!18483)

(assert (=> b!259624 (= lt!401534 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12064 lt!401533) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259626 () Bool)

(declare-fun e!180160 () Bool)

(declare-fun array_inv!5961 (array!14205) Bool)

(assert (=> b!259626 (= e!180160 (array_inv!5961 (buf!6742 thiss!1754)))))

(declare-fun b!259627 () Bool)

(declare-fun res!217465 () Bool)

(assert (=> b!259627 (=> (not res!217465) (not e!180161))))

(assert (=> b!259627 (= res!217465 (not (= from!526 nBits!535)))))

(declare-fun res!217464 () Bool)

(assert (=> start!55876 (=> (not res!217464) (not e!180161))))

(assert (=> start!55876 (= res!217464 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55876 e!180161))

(assert (=> start!55876 true))

(declare-fun inv!12 (BitStream!11362) Bool)

(assert (=> start!55876 (and (inv!12 thiss!1754) e!180160)))

(declare-fun b!259625 () Bool)

(declare-fun res!217463 () Bool)

(assert (=> b!259625 (=> (not res!217463) (not e!180161))))

(assert (=> b!259625 (= res!217463 (validate_offset_bits!1 ((_ sign_extend 32) (size!6220 (buf!6742 thiss!1754))) ((_ sign_extend 32) (currentByte!12392 thiss!1754)) ((_ sign_extend 32) (currentBit!12387 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55876 res!217464) b!259625))

(assert (= (and b!259625 res!217463) b!259627))

(assert (= (and b!259627 res!217465) b!259623))

(assert (= (and b!259623 res!217462) b!259624))

(assert (= start!55876 b!259626))

(declare-fun m!388919 () Bool)

(assert (=> b!259624 m!388919))

(declare-fun m!388921 () Bool)

(assert (=> b!259624 m!388921))

(declare-fun m!388923 () Bool)

(assert (=> b!259624 m!388923))

(declare-fun m!388925 () Bool)

(assert (=> b!259624 m!388925))

(declare-fun m!388927 () Bool)

(assert (=> b!259626 m!388927))

(declare-fun m!388929 () Bool)

(assert (=> b!259623 m!388929))

(declare-fun m!388931 () Bool)

(assert (=> start!55876 m!388931))

(declare-fun m!388933 () Bool)

(assert (=> b!259625 m!388933))

(push 1)

(assert (not b!259623))

(assert (not b!259626))

(assert (not b!259625))

(assert (not b!259624))

(assert (not start!55876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87096 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87096 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12387 thiss!1754) (currentByte!12392 thiss!1754) (size!6220 (buf!6742 thiss!1754))))))

(declare-fun bs!22067 () Bool)

(assert (= bs!22067 d!87096))

(declare-fun m!388971 () Bool)

(assert (=> bs!22067 m!388971))

(assert (=> start!55876 d!87096))

(declare-fun d!87100 () Bool)

(assert (=> d!87100 (= (array_inv!5961 (buf!6742 thiss!1754)) (bvsge (size!6220 (buf!6742 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259626 d!87100))

(declare-fun d!87104 () Bool)

(declare-fun e!180207 () Bool)

(assert (=> d!87104 e!180207))

(declare-fun res!217507 () Bool)

(assert (=> d!87104 (=> (not res!217507) (not e!180207))))

(declare-datatypes ((tuple2!22266 0))(
  ( (tuple2!22267 (_1!12069 Unit!18483) (_2!12069 BitStream!11362)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11362) tuple2!22266)

(assert (=> d!87104 (= res!217507 (= (buf!6742 (_2!12069 (increaseBitIndex!0 thiss!1754))) (buf!6742 thiss!1754)))))

(declare-fun lt!401637 () Bool)

(assert (=> d!87104 (= lt!401637 (not (= (bvand ((_ sign_extend 24) (select (arr!7207 (buf!6742 thiss!1754)) (currentByte!12392 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12387 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401636 () tuple2!22256)

(assert (=> d!87104 (= lt!401636 (tuple2!22257 (not (= (bvand ((_ sign_extend 24) (select (arr!7207 (buf!6742 thiss!1754)) (currentByte!12392 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12387 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12069 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87104 (validate_offset_bit!0 ((_ sign_extend 32) (size!6220 (buf!6742 thiss!1754))) ((_ sign_extend 32) (currentByte!12392 thiss!1754)) ((_ sign_extend 32) (currentBit!12387 thiss!1754)))))

(assert (=> d!87104 (= (readBit!0 thiss!1754) lt!401636)))

(declare-fun b!259675 () Bool)

(declare-fun lt!401639 () (_ BitVec 64))

(declare-fun lt!401640 () (_ BitVec 64))

(assert (=> b!259675 (= e!180207 (= (bitIndex!0 (size!6220 (buf!6742 (_2!12069 (increaseBitIndex!0 thiss!1754)))) (currentByte!12392 (_2!12069 (increaseBitIndex!0 thiss!1754))) (currentBit!12387 (_2!12069 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401639 lt!401640)))))

(assert (=> b!259675 (or (not (= (bvand lt!401639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401640 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401639 lt!401640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259675 (= lt!401640 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259675 (= lt!401639 (bitIndex!0 (size!6220 (buf!6742 thiss!1754)) (currentByte!12392 thiss!1754) (currentBit!12387 thiss!1754)))))

(declare-fun lt!401638 () Bool)

(assert (=> b!259675 (= lt!401638 (not (= (bvand ((_ sign_extend 24) (select (arr!7207 (buf!6742 thiss!1754)) (currentByte!12392 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12387 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401642 () Bool)

(assert (=> b!259675 (= lt!401642 (not (= (bvand ((_ sign_extend 24) (select (arr!7207 (buf!6742 thiss!1754)) (currentByte!12392 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12387 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401641 () Bool)

(assert (=> b!259675 (= lt!401641 (not (= (bvand ((_ sign_extend 24) (select (arr!7207 (buf!6742 thiss!1754)) (currentByte!12392 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12387 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87104 res!217507) b!259675))

(declare-fun m!388987 () Bool)

(assert (=> d!87104 m!388987))

(declare-fun m!388989 () Bool)

(assert (=> d!87104 m!388989))

(declare-fun m!388991 () Bool)

(assert (=> d!87104 m!388991))

(declare-fun m!388993 () Bool)

(assert (=> d!87104 m!388993))

(declare-fun m!388995 () Bool)

(assert (=> b!259675 m!388995))

(assert (=> b!259675 m!388919))

(assert (=> b!259675 m!388987))

(assert (=> b!259675 m!388991))

(assert (=> b!259675 m!388989))

(assert (=> b!259623 d!87104))

(declare-fun d!87114 () Bool)

(declare-fun e!180210 () Bool)

(assert (=> d!87114 e!180210))

(declare-fun res!217513 () Bool)

(assert (=> d!87114 (=> (not res!217513) (not e!180210))))

(declare-fun lt!401660 () (_ BitVec 64))

(declare-fun lt!401659 () (_ BitVec 64))

(declare-fun lt!401658 () (_ BitVec 64))

(assert (=> d!87114 (= res!217513 (= lt!401658 (bvsub lt!401659 lt!401660)))))

(assert (=> d!87114 (or (= (bvand lt!401659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401660 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401659 lt!401660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87114 (= lt!401660 (remainingBits!0 ((_ sign_extend 32) (size!6220 (buf!6742 thiss!1754))) ((_ sign_extend 32) (currentByte!12392 thiss!1754)) ((_ sign_extend 32) (currentBit!12387 thiss!1754))))))

(declare-fun lt!401655 () (_ BitVec 64))

(declare-fun lt!401657 () (_ BitVec 64))

(assert (=> d!87114 (= lt!401659 (bvmul lt!401655 lt!401657))))

(assert (=> d!87114 (or (= lt!401655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401657 (bvsdiv (bvmul lt!401655 lt!401657) lt!401655)))))

(assert (=> d!87114 (= lt!401657 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87114 (= lt!401655 ((_ sign_extend 32) (size!6220 (buf!6742 thiss!1754))))))

(assert (=> d!87114 (= lt!401658 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12392 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12387 thiss!1754))))))

(assert (=> d!87114 (invariant!0 (currentBit!12387 thiss!1754) (currentByte!12392 thiss!1754) (size!6220 (buf!6742 thiss!1754)))))

(assert (=> d!87114 (= (bitIndex!0 (size!6220 (buf!6742 thiss!1754)) (currentByte!12392 thiss!1754) (currentBit!12387 thiss!1754)) lt!401658)))

(declare-fun b!259680 () Bool)

(declare-fun res!217512 () Bool)

(assert (=> b!259680 (=> (not res!217512) (not e!180210))))

(assert (=> b!259680 (= res!217512 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401658))))

(declare-fun b!259681 () Bool)

(declare-fun lt!401656 () (_ BitVec 64))

(assert (=> b!259681 (= e!180210 (bvsle lt!401658 (bvmul lt!401656 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259681 (or (= lt!401656 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401656 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401656)))))

(assert (=> b!259681 (= lt!401656 ((_ sign_extend 32) (size!6220 (buf!6742 thiss!1754))))))

(assert (= (and d!87114 res!217513) b!259680))

(assert (= (and b!259680 res!217512) b!259681))

(declare-fun m!388997 () Bool)

(assert (=> d!87114 m!388997))

(assert (=> d!87114 m!388971))

(assert (=> b!259624 d!87114))

(declare-fun b!259760 () Bool)

(declare-fun e!180263 () tuple2!22256)

(declare-fun e!180265 () tuple2!22256)

(assert (=> b!259760 (= e!180263 e!180265)))

(declare-fun lt!401757 () tuple2!22256)

(assert (=> b!259760 (= lt!401757 (readBit!0 (_2!12064 lt!401533)))))

(declare-fun c!11930 () Bool)

(assert (=> b!259760 (= c!11930 (not (= (_1!12064 lt!401757) expected!109)))))

(declare-fun b!259761 () Bool)

(declare-fun lt!401760 () (_ BitVec 64))

(declare-fun e!180262 () Bool)

(declare-fun lt!401762 () tuple2!22256)

(assert (=> b!259761 (= e!180262 (= (bvsub lt!401760 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6220 (buf!6742 (_2!12064 lt!401762))) (currentByte!12392 (_2!12064 lt!401762)) (currentBit!12387 (_2!12064 lt!401762)))))))

(assert (=> b!259761 (or (= (bvand lt!401760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401760 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401755 () (_ BitVec 64))

(assert (=> b!259761 (= lt!401760 (bvadd lt!401755 nBits!535))))

(assert (=> b!259761 (or (not (= (bvand lt!401755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401755 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259761 (= lt!401755 (bitIndex!0 (size!6220 (buf!6742 (_2!12064 lt!401533))) (currentByte!12392 (_2!12064 lt!401533)) (currentBit!12387 (_2!12064 lt!401533))))))

(declare-fun b!259762 () Bool)

(declare-fun lt!401761 () tuple2!22256)

(assert (=> b!259762 (= lt!401761 (checkBitsLoop!0 (_2!12064 lt!401757) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!401764 () Unit!18483)

(declare-fun lt!401765 () Unit!18483)

(assert (=> b!259762 (= lt!401764 lt!401765)))

(declare-fun lt!401756 () (_ BitVec 64))

(declare-fun lt!401758 () (_ BitVec 64))

(assert (=> b!259762 (validate_offset_bits!1 ((_ sign_extend 32) (size!6220 (buf!6742 (_2!12064 lt!401757)))) ((_ sign_extend 32) (currentByte!12392 (_2!12064 lt!401757))) ((_ sign_extend 32) (currentBit!12387 (_2!12064 lt!401757))) (bvsub lt!401756 lt!401758))))

(assert (=> b!259762 (= lt!401765 (validateOffsetBitsIneqLemma!0 (_2!12064 lt!401533) (_2!12064 lt!401757) lt!401756 lt!401758))))

(assert (=> b!259762 (= lt!401758 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259762 (= lt!401756 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259762 (= e!180265 (tuple2!22257 (_1!12064 lt!401761) (_2!12064 lt!401761)))))

(declare-fun b!259763 () Bool)

(assert (=> b!259763 (= e!180265 (tuple2!22257 false (_2!12064 lt!401757)))))

(declare-fun b!259764 () Bool)

(declare-fun e!180264 () Bool)

(declare-fun e!180261 () Bool)

(assert (=> b!259764 (= e!180264 e!180261)))

(declare-fun res!217560 () Bool)

(assert (=> b!259764 (=> res!217560 e!180261)))

(assert (=> b!259764 (= res!217560 (or (not (_1!12064 lt!401762)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!259765 () Bool)

(assert (=> b!259765 (= e!180263 (tuple2!22257 true (_2!12064 lt!401533)))))

(declare-fun b!259766 () Bool)

(declare-fun res!217561 () Bool)

(assert (=> b!259766 (=> (not res!217561) (not e!180264))))

(assert (=> b!259766 (= res!217561 (and (= (buf!6742 (_2!12064 lt!401533)) (buf!6742 (_2!12064 lt!401762))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12064 lt!401762))))))

(declare-fun d!87116 () Bool)

(assert (=> d!87116 e!180264))

(declare-fun res!217563 () Bool)

(assert (=> d!87116 (=> (not res!217563) (not e!180264))))

(declare-fun lt!401763 () (_ BitVec 64))

(assert (=> d!87116 (= res!217563 (bvsge (bvsub lt!401763 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6220 (buf!6742 (_2!12064 lt!401762))) (currentByte!12392 (_2!12064 lt!401762)) (currentBit!12387 (_2!12064 lt!401762)))))))

(assert (=> d!87116 (or (= (bvand lt!401763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401763 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401759 () (_ BitVec 64))

(assert (=> d!87116 (= lt!401763 (bvadd lt!401759 nBits!535))))

(assert (=> d!87116 (or (not (= (bvand lt!401759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401759 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87116 (= lt!401759 (bitIndex!0 (size!6220 (buf!6742 (_2!12064 lt!401533))) (currentByte!12392 (_2!12064 lt!401533)) (currentBit!12387 (_2!12064 lt!401533))))))

(assert (=> d!87116 (= lt!401762 e!180263)))

(declare-fun c!11931 () Bool)

(assert (=> d!87116 (= c!11931 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87116 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87116 (= (checkBitsLoop!0 (_2!12064 lt!401533) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!401762)))

(declare-fun b!259767 () Bool)

(declare-datatypes ((tuple2!22270 0))(
  ( (tuple2!22271 (_1!12071 BitStream!11362) (_2!12071 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11362) tuple2!22270)

(assert (=> b!259767 (= e!180261 (= expected!109 (_2!12071 (readBitPure!0 (_2!12064 lt!401533)))))))

(declare-fun b!259768 () Bool)

(declare-fun res!217564 () Bool)

(assert (=> b!259768 (=> (not res!217564) (not e!180264))))

(assert (=> b!259768 (= res!217564 e!180262)))

(declare-fun res!217562 () Bool)

(assert (=> b!259768 (=> res!217562 e!180262)))

(assert (=> b!259768 (= res!217562 (not (_1!12064 lt!401762)))))

(assert (= (and d!87116 c!11931) b!259765))

(assert (= (and d!87116 (not c!11931)) b!259760))

(assert (= (and b!259760 c!11930) b!259763))

(assert (= (and b!259760 (not c!11930)) b!259762))

(assert (= (and d!87116 res!217563) b!259766))

(assert (= (and b!259766 res!217561) b!259768))

(assert (= (and b!259768 (not res!217562)) b!259761))

(assert (= (and b!259768 res!217564) b!259764))

(assert (= (and b!259764 (not res!217560)) b!259767))

(declare-fun m!389035 () Bool)

(assert (=> b!259760 m!389035))

(declare-fun m!389037 () Bool)

(assert (=> b!259761 m!389037))

(declare-fun m!389039 () Bool)

(assert (=> b!259761 m!389039))

(declare-fun m!389041 () Bool)

(assert (=> b!259762 m!389041))

(declare-fun m!389043 () Bool)

(assert (=> b!259762 m!389043))

(declare-fun m!389045 () Bool)

(assert (=> b!259762 m!389045))

(declare-fun m!389047 () Bool)

(assert (=> b!259767 m!389047))

(assert (=> d!87116 m!389037))

(assert (=> d!87116 m!389039))

(assert (=> b!259624 d!87116))

(declare-fun d!87130 () Bool)

(assert (=> d!87130 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6220 (buf!6742 (_2!12064 lt!401533)))) ((_ sign_extend 32) (currentByte!12392 (_2!12064 lt!401533))) ((_ sign_extend 32) (currentBit!12387 (_2!12064 lt!401533))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6220 (buf!6742 (_2!12064 lt!401533)))) ((_ sign_extend 32) (currentByte!12392 (_2!12064 lt!401533))) ((_ sign_extend 32) (currentBit!12387 (_2!12064 lt!401533)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22072 () Bool)

(assert (= bs!22072 d!87130))

(declare-fun m!389049 () Bool)

(assert (=> bs!22072 m!389049))

(assert (=> b!259624 d!87130))

(declare-fun d!87132 () Bool)

(declare-fun e!180271 () Bool)

(assert (=> d!87132 e!180271))

(declare-fun res!217570 () Bool)

(assert (=> d!87132 (=> (not res!217570) (not e!180271))))

(assert (=> d!87132 (= res!217570 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401789 () Unit!18483)

(declare-fun choose!27 (BitStream!11362 BitStream!11362 (_ BitVec 64) (_ BitVec 64)) Unit!18483)

(assert (=> d!87132 (= lt!401789 (choose!27 thiss!1754 (_2!12064 lt!401533) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87132 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87132 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12064 lt!401533) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!401789)))

(declare-fun b!259774 () Bool)

(assert (=> b!259774 (= e!180271 (validate_offset_bits!1 ((_ sign_extend 32) (size!6220 (buf!6742 (_2!12064 lt!401533)))) ((_ sign_extend 32) (currentByte!12392 (_2!12064 lt!401533))) ((_ sign_extend 32) (currentBit!12387 (_2!12064 lt!401533))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87132 res!217570) b!259774))

(declare-fun m!389061 () Bool)

(assert (=> d!87132 m!389061))

(assert (=> b!259774 m!388923))

(assert (=> b!259624 d!87132))

(declare-fun d!87134 () Bool)

(assert (=> d!87134 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6220 (buf!6742 thiss!1754))) ((_ sign_extend 32) (currentByte!12392 thiss!1754)) ((_ sign_extend 32) (currentBit!12387 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6220 (buf!6742 thiss!1754))) ((_ sign_extend 32) (currentByte!12392 thiss!1754)) ((_ sign_extend 32) (currentBit!12387 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22073 () Bool)

(assert (= bs!22073 d!87134))

(assert (=> bs!22073 m!388997))

(assert (=> b!259625 d!87134))

(push 1)

(assert (not b!259761))

(assert (not b!259762))

(assert (not b!259760))

(assert (not b!259767))

(assert (not d!87130))

(assert (not d!87096))

(assert (not d!87114))

(assert (not d!87132))

(assert (not b!259774))

(assert (not d!87116))

(assert (not d!87104))

(assert (not d!87134))

(assert (not b!259675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

