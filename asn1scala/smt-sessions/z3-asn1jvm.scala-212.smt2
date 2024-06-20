; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4236 () Bool)

(assert start!4236)

(declare-fun res!15470 () Bool)

(declare-fun e!11268 () Bool)

(assert (=> start!4236 (=> (not res!15470) (not e!11268))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4236 (= res!15470 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4236 e!11268))

(assert (=> start!4236 true))

(declare-datatypes ((array!1162 0))(
  ( (array!1163 (arr!923 (Array (_ BitVec 32) (_ BitVec 8))) (size!494 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!858 0))(
  ( (BitStream!859 (buf!812 array!1162) (currentByte!2015 (_ BitVec 32)) (currentBit!2010 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!858)

(declare-fun e!11267 () Bool)

(declare-fun inv!12 (BitStream!858) Bool)

(assert (=> start!4236 (and (inv!12 thiss!1917) e!11267)))

(declare-fun b!17532 () Bool)

(declare-fun res!15469 () Bool)

(assert (=> b!17532 (=> (not res!15469) (not e!11268))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17532 (= res!15469 (validate_offset_bits!1 ((_ sign_extend 32) (size!494 (buf!812 thiss!1917))) ((_ sign_extend 32) (currentByte!2015 thiss!1917)) ((_ sign_extend 32) (currentBit!2010 thiss!1917)) nBits!604))))

(declare-fun b!17533 () Bool)

(declare-datatypes ((tuple2!2050 0))(
  ( (tuple2!2051 (_1!1086 array!1162) (_2!1086 BitStream!858)) )
))
(declare-fun lt!25282 () tuple2!2050)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17533 (= e!11268 (not (invariant!0 (currentBit!2010 (_2!1086 lt!25282)) (currentByte!2015 (_2!1086 lt!25282)) (size!494 (buf!812 (_2!1086 lt!25282))))))))

(declare-fun readBits!0 (BitStream!858 (_ BitVec 64)) tuple2!2050)

(assert (=> b!17533 (= lt!25282 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17534 () Bool)

(declare-fun array_inv!464 (array!1162) Bool)

(assert (=> b!17534 (= e!11267 (array_inv!464 (buf!812 thiss!1917)))))

(assert (= (and start!4236 res!15470) b!17532))

(assert (= (and b!17532 res!15469) b!17533))

(assert (= start!4236 b!17534))

(declare-fun m!23849 () Bool)

(assert (=> start!4236 m!23849))

(declare-fun m!23851 () Bool)

(assert (=> b!17532 m!23851))

(declare-fun m!23853 () Bool)

(assert (=> b!17533 m!23853))

(declare-fun m!23855 () Bool)

(assert (=> b!17533 m!23855))

(declare-fun m!23857 () Bool)

(assert (=> b!17534 m!23857))

(check-sat (not b!17532) (not b!17534) (not start!4236) (not b!17533))
(check-sat)
(get-model)

(declare-fun d!5768 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5768 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!494 (buf!812 thiss!1917))) ((_ sign_extend 32) (currentByte!2015 thiss!1917)) ((_ sign_extend 32) (currentBit!2010 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!494 (buf!812 thiss!1917))) ((_ sign_extend 32) (currentByte!2015 thiss!1917)) ((_ sign_extend 32) (currentBit!2010 thiss!1917))) nBits!604))))

(declare-fun bs!1649 () Bool)

(assert (= bs!1649 d!5768))

(declare-fun m!23873 () Bool)

(assert (=> bs!1649 m!23873))

(assert (=> b!17532 d!5768))

(declare-fun d!5770 () Bool)

(assert (=> d!5770 (= (array_inv!464 (buf!812 thiss!1917)) (bvsge (size!494 (buf!812 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17534 d!5770))

(declare-fun d!5774 () Bool)

(assert (=> d!5774 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2010 thiss!1917) (currentByte!2015 thiss!1917) (size!494 (buf!812 thiss!1917))))))

(declare-fun bs!1650 () Bool)

(assert (= bs!1650 d!5774))

(declare-fun m!23875 () Bool)

(assert (=> bs!1650 m!23875))

(assert (=> start!4236 d!5774))

(declare-fun d!5776 () Bool)

(assert (=> d!5776 (= (invariant!0 (currentBit!2010 (_2!1086 lt!25282)) (currentByte!2015 (_2!1086 lt!25282)) (size!494 (buf!812 (_2!1086 lt!25282)))) (and (bvsge (currentBit!2010 (_2!1086 lt!25282)) #b00000000000000000000000000000000) (bvslt (currentBit!2010 (_2!1086 lt!25282)) #b00000000000000000000000000001000) (bvsge (currentByte!2015 (_2!1086 lt!25282)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2015 (_2!1086 lt!25282)) (size!494 (buf!812 (_2!1086 lt!25282)))) (and (= (currentBit!2010 (_2!1086 lt!25282)) #b00000000000000000000000000000000) (= (currentByte!2015 (_2!1086 lt!25282)) (size!494 (buf!812 (_2!1086 lt!25282))))))))))

(assert (=> b!17533 d!5776))

(declare-fun b!17584 () Bool)

(declare-fun res!15517 () Bool)

(declare-fun e!11286 () Bool)

(assert (=> b!17584 (=> (not res!15517) (not e!11286))))

(declare-fun lt!25362 () tuple2!2050)

(assert (=> b!17584 (= res!15517 (bvsle (currentByte!2015 thiss!1917) (currentByte!2015 (_2!1086 lt!25362))))))

(declare-fun d!5778 () Bool)

(assert (=> d!5778 e!11286))

(declare-fun res!15519 () Bool)

(assert (=> d!5778 (=> (not res!15519) (not e!11286))))

(assert (=> d!5778 (= res!15519 (= (buf!812 (_2!1086 lt!25362)) (buf!812 thiss!1917)))))

(declare-datatypes ((Unit!1574 0))(
  ( (Unit!1575) )
))
(declare-datatypes ((tuple3!112 0))(
  ( (tuple3!113 (_1!1089 Unit!1574) (_2!1089 BitStream!858) (_3!62 array!1162)) )
))
(declare-fun lt!25358 () tuple3!112)

(assert (=> d!5778 (= lt!25362 (tuple2!2051 (_3!62 lt!25358) (_2!1089 lt!25358)))))

(declare-fun readBitsLoop!0 (BitStream!858 (_ BitVec 64) array!1162 (_ BitVec 64) (_ BitVec 64)) tuple3!112)

(assert (=> d!5778 (= lt!25358 (readBitsLoop!0 thiss!1917 nBits!604 (array!1163 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5778 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5778 (= (readBits!0 thiss!1917 nBits!604) lt!25362)))

(declare-fun b!17585 () Bool)

(declare-fun res!15518 () Bool)

(assert (=> b!17585 (=> (not res!15518) (not e!11286))))

(assert (=> b!17585 (= res!15518 (invariant!0 (currentBit!2010 (_2!1086 lt!25362)) (currentByte!2015 (_2!1086 lt!25362)) (size!494 (buf!812 (_2!1086 lt!25362)))))))

(declare-fun b!17586 () Bool)

(declare-fun res!15521 () Bool)

(assert (=> b!17586 (=> (not res!15521) (not e!11286))))

(declare-fun lt!25365 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!17586 (= res!15521 (= (bvadd lt!25365 nBits!604) (bitIndex!0 (size!494 (buf!812 (_2!1086 lt!25362))) (currentByte!2015 (_2!1086 lt!25362)) (currentBit!2010 (_2!1086 lt!25362)))))))

(assert (=> b!17586 (or (not (= (bvand lt!25365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!25365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!25365 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17586 (= lt!25365 (bitIndex!0 (size!494 (buf!812 thiss!1917)) (currentByte!2015 thiss!1917) (currentBit!2010 thiss!1917)))))

(declare-fun b!17587 () Bool)

(declare-fun res!15520 () Bool)

(assert (=> b!17587 (=> (not res!15520) (not e!11286))))

(declare-fun lt!25361 () (_ BitVec 64))

(assert (=> b!17587 (= res!15520 (= (size!494 (_1!1086 lt!25362)) ((_ extract 31 0) lt!25361)))))

(assert (=> b!17587 (and (bvslt lt!25361 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!25361 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!25359 () (_ BitVec 64))

(declare-fun lt!25363 () (_ BitVec 64))

(assert (=> b!17587 (= lt!25361 (bvsdiv lt!25359 lt!25363))))

(assert (=> b!17587 (and (not (= lt!25363 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!25359 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!25363 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!17587 (= lt!25363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!25366 () (_ BitVec 64))

(declare-fun lt!25360 () (_ BitVec 64))

(assert (=> b!17587 (= lt!25359 (bvsub lt!25366 lt!25360))))

(assert (=> b!17587 (or (= (bvand lt!25366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25360 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!25366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!25366 lt!25360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17587 (= lt!25360 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!25364 () (_ BitVec 64))

(assert (=> b!17587 (= lt!25366 (bvadd nBits!604 lt!25364))))

(assert (=> b!17587 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25364 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!25364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17587 (= lt!25364 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!17588 () Bool)

(declare-datatypes ((List!191 0))(
  ( (Nil!188) (Cons!187 (h!306 Bool) (t!941 List!191)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!858 array!1162 (_ BitVec 64) (_ BitVec 64)) List!191)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!858 BitStream!858 (_ BitVec 64)) List!191)

(assert (=> b!17588 (= e!11286 (= (byteArrayBitContentToList!0 (_2!1086 lt!25362) (_1!1086 lt!25362) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1086 lt!25362) thiss!1917 nBits!604)))))

(assert (= (and d!5778 res!15519) b!17586))

(assert (= (and b!17586 res!15521) b!17585))

(assert (= (and b!17585 res!15518) b!17587))

(assert (= (and b!17587 res!15520) b!17584))

(assert (= (and b!17584 res!15517) b!17588))

(declare-fun m!23903 () Bool)

(assert (=> d!5778 m!23903))

(declare-fun m!23905 () Bool)

(assert (=> b!17585 m!23905))

(declare-fun m!23907 () Bool)

(assert (=> b!17586 m!23907))

(declare-fun m!23909 () Bool)

(assert (=> b!17586 m!23909))

(declare-fun m!23911 () Bool)

(assert (=> b!17588 m!23911))

(declare-fun m!23913 () Bool)

(assert (=> b!17588 m!23913))

(assert (=> b!17533 d!5778))

(check-sat (not b!17586) (not d!5778) (not d!5768) (not b!17585) (not d!5774) (not b!17588))
