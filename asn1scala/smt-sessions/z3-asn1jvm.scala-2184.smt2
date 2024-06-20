; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55422 () Bool)

(assert start!55422)

(declare-fun b!258365 () Bool)

(declare-fun e!179194 () Bool)

(declare-fun e!179196 () Bool)

(assert (=> b!258365 (= e!179194 e!179196)))

(declare-fun res!216455 () Bool)

(assert (=> b!258365 (=> (not res!216455) (not e!179196))))

(declare-datatypes ((array!14054 0))(
  ( (array!14055 (arr!7148 (Array (_ BitVec 32) (_ BitVec 8))) (size!6161 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11244 0))(
  ( (BitStream!11245 (buf!6683 array!14054) (currentByte!12267 (_ BitVec 32)) (currentBit!12262 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22120 0))(
  ( (tuple2!22121 (_1!11996 Bool) (_2!11996 BitStream!11244)) )
))
(declare-fun lt!399961 () tuple2!22120)

(declare-fun expected!109 () Bool)

(assert (=> b!258365 (= res!216455 (= (_1!11996 lt!399961) expected!109))))

(declare-fun thiss!1754 () BitStream!11244)

(declare-fun readBit!0 (BitStream!11244) tuple2!22120)

(assert (=> b!258365 (= lt!399961 (readBit!0 thiss!1754))))

(declare-fun b!258366 () Bool)

(declare-fun e!179193 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258366 (= e!179193 (validate_offset_bit!0 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))) ((_ sign_extend 32) (currentByte!12267 thiss!1754)) ((_ sign_extend 32) (currentBit!12262 thiss!1754))))))

(declare-fun b!258367 () Bool)

(declare-fun e!179197 () Bool)

(declare-fun array_inv!5902 (array!14054) Bool)

(assert (=> b!258367 (= e!179197 (array_inv!5902 (buf!6683 thiss!1754)))))

(declare-fun res!216457 () Bool)

(assert (=> start!55422 (=> (not res!216457) (not e!179194))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55422 (= res!216457 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55422 e!179194))

(assert (=> start!55422 true))

(declare-fun inv!12 (BitStream!11244) Bool)

(assert (=> start!55422 (and (inv!12 thiss!1754) e!179197)))

(declare-fun b!258368 () Bool)

(declare-fun res!216456 () Bool)

(assert (=> b!258368 (=> (not res!216456) (not e!179194))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258368 (= res!216456 (validate_offset_bits!1 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))) ((_ sign_extend 32) (currentByte!12267 thiss!1754)) ((_ sign_extend 32) (currentBit!12262 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258369 () Bool)

(assert (=> b!258369 (= e!179196 (not e!179193))))

(declare-fun res!216453 () Bool)

(assert (=> b!258369 (=> res!216453 e!179193)))

(declare-fun lt!399962 () (_ BitVec 64))

(declare-fun lt!399964 () tuple2!22120)

(declare-fun lt!399965 () (_ BitVec 64))

(assert (=> b!258369 (= res!216453 (or (bvslt lt!399962 lt!399965) (not (= (buf!6683 thiss!1754) (buf!6683 (_2!11996 lt!399964)))) (and (_1!11996 lt!399964) (not (= lt!399962 lt!399965))) (not (_1!11996 lt!399964)) (bvsge from!526 nBits!535)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258369 (= lt!399965 (bitIndex!0 (size!6161 (buf!6683 (_2!11996 lt!399964))) (currentByte!12267 (_2!11996 lt!399964)) (currentBit!12262 (_2!11996 lt!399964))))))

(assert (=> b!258369 (= lt!399962 (bvsub (bvadd (bitIndex!0 (size!6161 (buf!6683 thiss!1754)) (currentByte!12267 thiss!1754) (currentBit!12262 thiss!1754)) nBits!535) from!526))))

(declare-fun checkBitsLoop!0 (BitStream!11244 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22120)

(assert (=> b!258369 (= lt!399964 (checkBitsLoop!0 (_2!11996 lt!399961) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258369 (validate_offset_bits!1 ((_ sign_extend 32) (size!6161 (buf!6683 (_2!11996 lt!399961)))) ((_ sign_extend 32) (currentByte!12267 (_2!11996 lt!399961))) ((_ sign_extend 32) (currentBit!12262 (_2!11996 lt!399961))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18431 0))(
  ( (Unit!18432) )
))
(declare-fun lt!399963 () Unit!18431)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11244 BitStream!11244 (_ BitVec 64) (_ BitVec 64)) Unit!18431)

(assert (=> b!258369 (= lt!399963 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11996 lt!399961) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!258370 () Bool)

(declare-fun res!216454 () Bool)

(assert (=> b!258370 (=> (not res!216454) (not e!179194))))

(assert (=> b!258370 (= res!216454 (not (= from!526 nBits!535)))))

(assert (= (and start!55422 res!216457) b!258368))

(assert (= (and b!258368 res!216456) b!258370))

(assert (= (and b!258370 res!216454) b!258365))

(assert (= (and b!258365 res!216455) b!258369))

(assert (= (and b!258369 (not res!216453)) b!258366))

(assert (= start!55422 b!258367))

(declare-fun m!387835 () Bool)

(assert (=> b!258368 m!387835))

(declare-fun m!387837 () Bool)

(assert (=> start!55422 m!387837))

(declare-fun m!387839 () Bool)

(assert (=> b!258365 m!387839))

(declare-fun m!387841 () Bool)

(assert (=> b!258369 m!387841))

(declare-fun m!387843 () Bool)

(assert (=> b!258369 m!387843))

(declare-fun m!387845 () Bool)

(assert (=> b!258369 m!387845))

(declare-fun m!387847 () Bool)

(assert (=> b!258369 m!387847))

(declare-fun m!387849 () Bool)

(assert (=> b!258369 m!387849))

(declare-fun m!387851 () Bool)

(assert (=> b!258366 m!387851))

(declare-fun m!387853 () Bool)

(assert (=> b!258367 m!387853))

(check-sat (not b!258366) (not b!258368) (not b!258365) (not b!258367) (not start!55422) (not b!258369))
(check-sat)
(get-model)

(declare-fun d!86686 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86686 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))) ((_ sign_extend 32) (currentByte!12267 thiss!1754)) ((_ sign_extend 32) (currentBit!12262 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))) ((_ sign_extend 32) (currentByte!12267 thiss!1754)) ((_ sign_extend 32) (currentBit!12262 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21927 () Bool)

(assert (= bs!21927 d!86686))

(declare-fun m!387875 () Bool)

(assert (=> bs!21927 m!387875))

(assert (=> b!258366 d!86686))

(declare-fun d!86688 () Bool)

(assert (=> d!86688 (= (array_inv!5902 (buf!6683 thiss!1754)) (bvsge (size!6161 (buf!6683 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258367 d!86688))

(declare-fun d!86690 () Bool)

(declare-fun e!179219 () Bool)

(assert (=> d!86690 e!179219))

(declare-fun res!216475 () Bool)

(assert (=> d!86690 (=> (not res!216475) (not e!179219))))

(declare-datatypes ((tuple2!22124 0))(
  ( (tuple2!22125 (_1!11998 Unit!18431) (_2!11998 BitStream!11244)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11244) tuple2!22124)

(assert (=> d!86690 (= res!216475 (= (buf!6683 (_2!11998 (increaseBitIndex!0 thiss!1754))) (buf!6683 thiss!1754)))))

(declare-fun lt!399999 () Bool)

(assert (=> d!86690 (= lt!399999 (not (= (bvand ((_ sign_extend 24) (select (arr!7148 (buf!6683 thiss!1754)) (currentByte!12267 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12262 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399996 () tuple2!22120)

(assert (=> d!86690 (= lt!399996 (tuple2!22121 (not (= (bvand ((_ sign_extend 24) (select (arr!7148 (buf!6683 thiss!1754)) (currentByte!12267 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12262 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11998 (increaseBitIndex!0 thiss!1754))))))

(assert (=> d!86690 (validate_offset_bit!0 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))) ((_ sign_extend 32) (currentByte!12267 thiss!1754)) ((_ sign_extend 32) (currentBit!12262 thiss!1754)))))

(assert (=> d!86690 (= (readBit!0 thiss!1754) lt!399996)))

(declare-fun b!258391 () Bool)

(declare-fun lt!400001 () (_ BitVec 64))

(declare-fun lt!400000 () (_ BitVec 64))

(assert (=> b!258391 (= e!179219 (= (bitIndex!0 (size!6161 (buf!6683 (_2!11998 (increaseBitIndex!0 thiss!1754)))) (currentByte!12267 (_2!11998 (increaseBitIndex!0 thiss!1754))) (currentBit!12262 (_2!11998 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400000 lt!400001)))))

(assert (=> b!258391 (or (not (= (bvand lt!400000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400000 lt!400001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258391 (= lt!400001 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258391 (= lt!400000 (bitIndex!0 (size!6161 (buf!6683 thiss!1754)) (currentByte!12267 thiss!1754) (currentBit!12262 thiss!1754)))))

(declare-fun lt!399997 () Bool)

(assert (=> b!258391 (= lt!399997 (not (= (bvand ((_ sign_extend 24) (select (arr!7148 (buf!6683 thiss!1754)) (currentByte!12267 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12262 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399998 () Bool)

(assert (=> b!258391 (= lt!399998 (not (= (bvand ((_ sign_extend 24) (select (arr!7148 (buf!6683 thiss!1754)) (currentByte!12267 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12262 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399995 () Bool)

(assert (=> b!258391 (= lt!399995 (not (= (bvand ((_ sign_extend 24) (select (arr!7148 (buf!6683 thiss!1754)) (currentByte!12267 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12262 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86690 res!216475) b!258391))

(declare-fun m!387877 () Bool)

(assert (=> d!86690 m!387877))

(declare-fun m!387879 () Bool)

(assert (=> d!86690 m!387879))

(declare-fun m!387881 () Bool)

(assert (=> d!86690 m!387881))

(assert (=> d!86690 m!387851))

(assert (=> b!258391 m!387881))

(assert (=> b!258391 m!387879))

(assert (=> b!258391 m!387877))

(assert (=> b!258391 m!387841))

(declare-fun m!387883 () Bool)

(assert (=> b!258391 m!387883))

(assert (=> b!258365 d!86690))

(declare-fun d!86692 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86692 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12262 thiss!1754) (currentByte!12267 thiss!1754) (size!6161 (buf!6683 thiss!1754))))))

(declare-fun bs!21928 () Bool)

(assert (= bs!21928 d!86692))

(declare-fun m!387885 () Bool)

(assert (=> bs!21928 m!387885))

(assert (=> start!55422 d!86692))

(declare-fun d!86694 () Bool)

(declare-fun e!179222 () Bool)

(assert (=> d!86694 e!179222))

(declare-fun res!216478 () Bool)

(assert (=> d!86694 (=> (not res!216478) (not e!179222))))

(assert (=> d!86694 (= res!216478 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!400004 () Unit!18431)

(declare-fun choose!27 (BitStream!11244 BitStream!11244 (_ BitVec 64) (_ BitVec 64)) Unit!18431)

(assert (=> d!86694 (= lt!400004 (choose!27 thiss!1754 (_2!11996 lt!399961) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86694 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86694 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11996 lt!399961) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!400004)))

(declare-fun b!258394 () Bool)

(assert (=> b!258394 (= e!179222 (validate_offset_bits!1 ((_ sign_extend 32) (size!6161 (buf!6683 (_2!11996 lt!399961)))) ((_ sign_extend 32) (currentByte!12267 (_2!11996 lt!399961))) ((_ sign_extend 32) (currentBit!12262 (_2!11996 lt!399961))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86694 res!216478) b!258394))

(declare-fun m!387887 () Bool)

(assert (=> d!86694 m!387887))

(assert (=> b!258394 m!387847))

(assert (=> b!258369 d!86694))

(declare-fun d!86696 () Bool)

(declare-fun e!179225 () Bool)

(assert (=> d!86696 e!179225))

(declare-fun res!216483 () Bool)

(assert (=> d!86696 (=> (not res!216483) (not e!179225))))

(declare-fun lt!400020 () (_ BitVec 64))

(declare-fun lt!400019 () (_ BitVec 64))

(declare-fun lt!400018 () (_ BitVec 64))

(assert (=> d!86696 (= res!216483 (= lt!400018 (bvsub lt!400020 lt!400019)))))

(assert (=> d!86696 (or (= (bvand lt!400020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400019 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400020 lt!400019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86696 (= lt!400019 (remainingBits!0 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))) ((_ sign_extend 32) (currentByte!12267 thiss!1754)) ((_ sign_extend 32) (currentBit!12262 thiss!1754))))))

(declare-fun lt!400022 () (_ BitVec 64))

(declare-fun lt!400021 () (_ BitVec 64))

(assert (=> d!86696 (= lt!400020 (bvmul lt!400022 lt!400021))))

(assert (=> d!86696 (or (= lt!400022 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400021 (bvsdiv (bvmul lt!400022 lt!400021) lt!400022)))))

(assert (=> d!86696 (= lt!400021 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86696 (= lt!400022 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))))))

(assert (=> d!86696 (= lt!400018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12267 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12262 thiss!1754))))))

(assert (=> d!86696 (invariant!0 (currentBit!12262 thiss!1754) (currentByte!12267 thiss!1754) (size!6161 (buf!6683 thiss!1754)))))

(assert (=> d!86696 (= (bitIndex!0 (size!6161 (buf!6683 thiss!1754)) (currentByte!12267 thiss!1754) (currentBit!12262 thiss!1754)) lt!400018)))

(declare-fun b!258399 () Bool)

(declare-fun res!216484 () Bool)

(assert (=> b!258399 (=> (not res!216484) (not e!179225))))

(assert (=> b!258399 (= res!216484 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400018))))

(declare-fun b!258400 () Bool)

(declare-fun lt!400017 () (_ BitVec 64))

(assert (=> b!258400 (= e!179225 (bvsle lt!400018 (bvmul lt!400017 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258400 (or (= lt!400017 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400017 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400017)))))

(assert (=> b!258400 (= lt!400017 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))))))

(assert (= (and d!86696 res!216483) b!258399))

(assert (= (and b!258399 res!216484) b!258400))

(assert (=> d!86696 m!387875))

(assert (=> d!86696 m!387885))

(assert (=> b!258369 d!86696))

(declare-fun d!86698 () Bool)

(declare-fun e!179226 () Bool)

(assert (=> d!86698 e!179226))

(declare-fun res!216485 () Bool)

(assert (=> d!86698 (=> (not res!216485) (not e!179226))))

(declare-fun lt!400026 () (_ BitVec 64))

(declare-fun lt!400024 () (_ BitVec 64))

(declare-fun lt!400025 () (_ BitVec 64))

(assert (=> d!86698 (= res!216485 (= lt!400024 (bvsub lt!400026 lt!400025)))))

(assert (=> d!86698 (or (= (bvand lt!400026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400026 lt!400025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86698 (= lt!400025 (remainingBits!0 ((_ sign_extend 32) (size!6161 (buf!6683 (_2!11996 lt!399964)))) ((_ sign_extend 32) (currentByte!12267 (_2!11996 lt!399964))) ((_ sign_extend 32) (currentBit!12262 (_2!11996 lt!399964)))))))

(declare-fun lt!400028 () (_ BitVec 64))

(declare-fun lt!400027 () (_ BitVec 64))

(assert (=> d!86698 (= lt!400026 (bvmul lt!400028 lt!400027))))

(assert (=> d!86698 (or (= lt!400028 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400027 (bvsdiv (bvmul lt!400028 lt!400027) lt!400028)))))

(assert (=> d!86698 (= lt!400027 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86698 (= lt!400028 ((_ sign_extend 32) (size!6161 (buf!6683 (_2!11996 lt!399964)))))))

(assert (=> d!86698 (= lt!400024 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12267 (_2!11996 lt!399964))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12262 (_2!11996 lt!399964)))))))

(assert (=> d!86698 (invariant!0 (currentBit!12262 (_2!11996 lt!399964)) (currentByte!12267 (_2!11996 lt!399964)) (size!6161 (buf!6683 (_2!11996 lt!399964))))))

(assert (=> d!86698 (= (bitIndex!0 (size!6161 (buf!6683 (_2!11996 lt!399964))) (currentByte!12267 (_2!11996 lt!399964)) (currentBit!12262 (_2!11996 lt!399964))) lt!400024)))

(declare-fun b!258401 () Bool)

(declare-fun res!216486 () Bool)

(assert (=> b!258401 (=> (not res!216486) (not e!179226))))

(assert (=> b!258401 (= res!216486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400024))))

(declare-fun b!258402 () Bool)

(declare-fun lt!400023 () (_ BitVec 64))

(assert (=> b!258402 (= e!179226 (bvsle lt!400024 (bvmul lt!400023 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258402 (or (= lt!400023 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400023 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400023)))))

(assert (=> b!258402 (= lt!400023 ((_ sign_extend 32) (size!6161 (buf!6683 (_2!11996 lt!399964)))))))

(assert (= (and d!86698 res!216485) b!258401))

(assert (= (and b!258401 res!216486) b!258402))

(declare-fun m!387889 () Bool)

(assert (=> d!86698 m!387889))

(declare-fun m!387891 () Bool)

(assert (=> d!86698 m!387891))

(assert (=> b!258369 d!86698))

(declare-fun b!258440 () Bool)

(declare-fun e!179263 () tuple2!22120)

(assert (=> b!258440 (= e!179263 (tuple2!22121 true (_2!11996 lt!399961)))))

(declare-fun b!258441 () Bool)

(declare-fun res!216517 () Bool)

(declare-fun e!179262 () Bool)

(assert (=> b!258441 (=> (not res!216517) (not e!179262))))

(declare-fun lt!400129 () tuple2!22120)

(assert (=> b!258441 (= res!216517 (and (= (buf!6683 (_2!11996 lt!399961)) (buf!6683 (_2!11996 lt!400129))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11996 lt!400129))))))

(declare-fun b!258442 () Bool)

(declare-fun res!216518 () Bool)

(assert (=> b!258442 (=> (not res!216518) (not e!179262))))

(declare-fun e!179260 () Bool)

(assert (=> b!258442 (= res!216518 e!179260)))

(declare-fun res!216516 () Bool)

(assert (=> b!258442 (=> res!216516 e!179260)))

(assert (=> b!258442 (= res!216516 (not (_1!11996 lt!400129)))))

(declare-fun b!258443 () Bool)

(declare-fun e!179259 () Bool)

(declare-datatypes ((tuple2!22126 0))(
  ( (tuple2!22127 (_1!11999 BitStream!11244) (_2!11999 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11244) tuple2!22126)

(assert (=> b!258443 (= e!179259 (= expected!109 (_2!11999 (readBitPure!0 (_2!11996 lt!399961)))))))

(declare-fun lt!400130 () (_ BitVec 64))

(declare-fun b!258444 () Bool)

(assert (=> b!258444 (= e!179260 (= (bvsub lt!400130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6161 (buf!6683 (_2!11996 lt!400129))) (currentByte!12267 (_2!11996 lt!400129)) (currentBit!12262 (_2!11996 lt!400129)))))))

(assert (=> b!258444 (or (= (bvand lt!400130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!400136 () (_ BitVec 64))

(assert (=> b!258444 (= lt!400130 (bvadd lt!400136 nBits!535))))

(assert (=> b!258444 (or (not (= (bvand lt!400136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400136 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258444 (= lt!400136 (bitIndex!0 (size!6161 (buf!6683 (_2!11996 lt!399961))) (currentByte!12267 (_2!11996 lt!399961)) (currentBit!12262 (_2!11996 lt!399961))))))

(declare-fun b!258445 () Bool)

(assert (=> b!258445 (= e!179262 e!179259)))

(declare-fun res!216520 () Bool)

(assert (=> b!258445 (=> res!216520 e!179259)))

(assert (=> b!258445 (= res!216520 (or (not (_1!11996 lt!400129)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun d!86700 () Bool)

(assert (=> d!86700 e!179262))

(declare-fun res!216519 () Bool)

(assert (=> d!86700 (=> (not res!216519) (not e!179262))))

(declare-fun lt!400128 () (_ BitVec 64))

(assert (=> d!86700 (= res!216519 (bvsge (bvsub lt!400128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6161 (buf!6683 (_2!11996 lt!400129))) (currentByte!12267 (_2!11996 lt!400129)) (currentBit!12262 (_2!11996 lt!400129)))))))

(assert (=> d!86700 (or (= (bvand lt!400128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!400135 () (_ BitVec 64))

(assert (=> d!86700 (= lt!400128 (bvadd lt!400135 nBits!535))))

(assert (=> d!86700 (or (not (= (bvand lt!400135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400135 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86700 (= lt!400135 (bitIndex!0 (size!6161 (buf!6683 (_2!11996 lt!399961))) (currentByte!12267 (_2!11996 lt!399961)) (currentBit!12262 (_2!11996 lt!399961))))))

(assert (=> d!86700 (= lt!400129 e!179263)))

(declare-fun c!11882 () Bool)

(assert (=> d!86700 (= c!11882 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86700 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86700 (= (checkBitsLoop!0 (_2!11996 lt!399961) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!400129)))

(declare-fun b!258446 () Bool)

(declare-fun lt!400126 () tuple2!22120)

(declare-fun lt!400131 () tuple2!22120)

(assert (=> b!258446 (= lt!400131 (checkBitsLoop!0 (_2!11996 lt!400126) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!400134 () Unit!18431)

(declare-fun lt!400132 () Unit!18431)

(assert (=> b!258446 (= lt!400134 lt!400132)))

(declare-fun lt!400127 () (_ BitVec 64))

(declare-fun lt!400133 () (_ BitVec 64))

(assert (=> b!258446 (validate_offset_bits!1 ((_ sign_extend 32) (size!6161 (buf!6683 (_2!11996 lt!400126)))) ((_ sign_extend 32) (currentByte!12267 (_2!11996 lt!400126))) ((_ sign_extend 32) (currentBit!12262 (_2!11996 lt!400126))) (bvsub lt!400127 lt!400133))))

(assert (=> b!258446 (= lt!400132 (validateOffsetBitsIneqLemma!0 (_2!11996 lt!399961) (_2!11996 lt!400126) lt!400127 lt!400133))))

(assert (=> b!258446 (= lt!400133 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258446 (= lt!400127 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun e!179261 () tuple2!22120)

(assert (=> b!258446 (= e!179261 (tuple2!22121 (_1!11996 lt!400131) (_2!11996 lt!400131)))))

(declare-fun b!258447 () Bool)

(assert (=> b!258447 (= e!179263 e!179261)))

(assert (=> b!258447 (= lt!400126 (readBit!0 (_2!11996 lt!399961)))))

(declare-fun c!11883 () Bool)

(assert (=> b!258447 (= c!11883 (not (= (_1!11996 lt!400126) expected!109)))))

(declare-fun b!258448 () Bool)

(assert (=> b!258448 (= e!179261 (tuple2!22121 false (_2!11996 lt!400126)))))

(assert (= (and d!86700 c!11882) b!258440))

(assert (= (and d!86700 (not c!11882)) b!258447))

(assert (= (and b!258447 c!11883) b!258448))

(assert (= (and b!258447 (not c!11883)) b!258446))

(assert (= (and d!86700 res!216519) b!258441))

(assert (= (and b!258441 res!216517) b!258442))

(assert (= (and b!258442 (not res!216516)) b!258444))

(assert (= (and b!258442 res!216518) b!258445))

(assert (= (and b!258445 (not res!216520)) b!258443))

(declare-fun m!387925 () Bool)

(assert (=> b!258446 m!387925))

(declare-fun m!387927 () Bool)

(assert (=> b!258446 m!387927))

(declare-fun m!387929 () Bool)

(assert (=> b!258446 m!387929))

(declare-fun m!387931 () Bool)

(assert (=> b!258443 m!387931))

(declare-fun m!387933 () Bool)

(assert (=> b!258447 m!387933))

(declare-fun m!387935 () Bool)

(assert (=> b!258444 m!387935))

(declare-fun m!387937 () Bool)

(assert (=> b!258444 m!387937))

(assert (=> d!86700 m!387935))

(assert (=> d!86700 m!387937))

(assert (=> b!258369 d!86700))

(declare-fun d!86734 () Bool)

(assert (=> d!86734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6161 (buf!6683 (_2!11996 lt!399961)))) ((_ sign_extend 32) (currentByte!12267 (_2!11996 lt!399961))) ((_ sign_extend 32) (currentBit!12262 (_2!11996 lt!399961))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6161 (buf!6683 (_2!11996 lt!399961)))) ((_ sign_extend 32) (currentByte!12267 (_2!11996 lt!399961))) ((_ sign_extend 32) (currentBit!12262 (_2!11996 lt!399961)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21936 () Bool)

(assert (= bs!21936 d!86734))

(declare-fun m!387939 () Bool)

(assert (=> bs!21936 m!387939))

(assert (=> b!258369 d!86734))

(declare-fun d!86736 () Bool)

(assert (=> d!86736 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))) ((_ sign_extend 32) (currentByte!12267 thiss!1754)) ((_ sign_extend 32) (currentBit!12262 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6161 (buf!6683 thiss!1754))) ((_ sign_extend 32) (currentByte!12267 thiss!1754)) ((_ sign_extend 32) (currentBit!12262 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21937 () Bool)

(assert (= bs!21937 d!86736))

(assert (=> bs!21937 m!387875))

(assert (=> b!258368 d!86736))

(check-sat (not b!258443) (not b!258444) (not d!86736) (not b!258447) (not d!86690) (not d!86692) (not b!258394) (not d!86686) (not b!258446) (not b!258391) (not d!86734) (not d!86696) (not d!86700) (not d!86698) (not d!86694))
