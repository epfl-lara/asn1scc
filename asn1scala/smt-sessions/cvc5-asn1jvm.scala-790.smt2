; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22958 () Bool)

(assert start!22958)

(declare-fun res!95854 () Bool)

(declare-fun e!75982 () Bool)

(assert (=> start!22958 (=> (not res!95854) (not e!75982))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22958 (= res!95854 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22958 e!75982))

(assert (=> start!22958 true))

(declare-datatypes ((array!5222 0))(
  ( (array!5223 (arr!2961 (Array (_ BitVec 32) (_ BitVec 8))) (size!2368 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4210 0))(
  ( (BitStream!4211 (buf!2778 array!5222) (currentByte!5415 (_ BitVec 32)) (currentBit!5410 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4210)

(declare-fun e!75987 () Bool)

(declare-fun inv!12 (BitStream!4210) Bool)

(assert (=> start!22958 (and (inv!12 thiss!1305) e!75987)))

(declare-fun b!115982 () Bool)

(declare-fun e!75983 () Bool)

(declare-datatypes ((tuple2!9556 0))(
  ( (tuple2!9557 (_1!5043 BitStream!4210) (_2!5043 Bool)) )
))
(declare-fun lt!177343 () tuple2!9556)

(declare-fun lt!177349 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115982 (= e!75983 (= (bitIndex!0 (size!2368 (buf!2778 (_1!5043 lt!177343))) (currentByte!5415 (_1!5043 lt!177343)) (currentBit!5410 (_1!5043 lt!177343))) lt!177349))))

(declare-fun b!115983 () Bool)

(declare-fun e!75986 () Bool)

(declare-datatypes ((Unit!7141 0))(
  ( (Unit!7142) )
))
(declare-datatypes ((tuple2!9558 0))(
  ( (tuple2!9559 (_1!5044 Unit!7141) (_2!5044 BitStream!4210)) )
))
(declare-fun lt!177344 () tuple2!9558)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115983 (= e!75986 (invariant!0 (currentBit!5410 thiss!1305) (currentByte!5415 thiss!1305) (size!2368 (buf!2778 (_2!5044 lt!177344)))))))

(declare-fun b!115984 () Bool)

(declare-fun e!75988 () Bool)

(assert (=> b!115984 (= e!75982 e!75988)))

(declare-fun res!95856 () Bool)

(assert (=> b!115984 (=> (not res!95856) (not e!75988))))

(declare-fun lt!177338 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115984 (= res!95856 (validate_offset_bits!1 ((_ sign_extend 32) (size!2368 (buf!2778 thiss!1305))) ((_ sign_extend 32) (currentByte!5415 thiss!1305)) ((_ sign_extend 32) (currentBit!5410 thiss!1305)) lt!177338))))

(assert (=> b!115984 (= lt!177338 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!115985 () Bool)

(declare-fun res!95861 () Bool)

(assert (=> b!115985 (=> (not res!95861) (not e!75988))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115985 (= res!95861 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115986 () Bool)

(assert (=> b!115986 (= e!75988 (not (or (not (= (size!2368 (buf!2778 thiss!1305)) (size!2368 (buf!2778 (_2!5044 lt!177344))))) (bvsge lt!177338 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9560 0))(
  ( (tuple2!9561 (_1!5045 BitStream!4210) (_2!5045 BitStream!4210)) )
))
(declare-fun lt!177345 () tuple2!9560)

(declare-fun lt!177341 () Bool)

(declare-fun readBitPure!0 (BitStream!4210) tuple2!9556)

(assert (=> b!115986 (= (_2!5043 (readBitPure!0 (_1!5045 lt!177345))) lt!177341)))

(declare-fun lt!177339 () tuple2!9560)

(declare-fun lt!177348 () tuple2!9558)

(declare-fun reader!0 (BitStream!4210 BitStream!4210) tuple2!9560)

(assert (=> b!115986 (= lt!177339 (reader!0 (_2!5044 lt!177348) (_2!5044 lt!177344)))))

(assert (=> b!115986 (= lt!177345 (reader!0 thiss!1305 (_2!5044 lt!177344)))))

(declare-fun e!75984 () Bool)

(assert (=> b!115986 e!75984))

(declare-fun res!95855 () Bool)

(assert (=> b!115986 (=> (not res!95855) (not e!75984))))

(declare-fun lt!177340 () tuple2!9556)

(declare-fun lt!177351 () tuple2!9556)

(assert (=> b!115986 (= res!95855 (= (bitIndex!0 (size!2368 (buf!2778 (_1!5043 lt!177340))) (currentByte!5415 (_1!5043 lt!177340)) (currentBit!5410 (_1!5043 lt!177340))) (bitIndex!0 (size!2368 (buf!2778 (_1!5043 lt!177351))) (currentByte!5415 (_1!5043 lt!177351)) (currentBit!5410 (_1!5043 lt!177351)))))))

(declare-fun lt!177350 () Unit!7141)

(declare-fun lt!177347 () BitStream!4210)

(declare-fun readBitPrefixLemma!0 (BitStream!4210 BitStream!4210) Unit!7141)

(assert (=> b!115986 (= lt!177350 (readBitPrefixLemma!0 lt!177347 (_2!5044 lt!177344)))))

(assert (=> b!115986 (= lt!177351 (readBitPure!0 (BitStream!4211 (buf!2778 (_2!5044 lt!177344)) (currentByte!5415 thiss!1305) (currentBit!5410 thiss!1305))))))

(assert (=> b!115986 (= lt!177340 (readBitPure!0 lt!177347))))

(assert (=> b!115986 (= lt!177347 (BitStream!4211 (buf!2778 (_2!5044 lt!177348)) (currentByte!5415 thiss!1305) (currentBit!5410 thiss!1305)))))

(assert (=> b!115986 e!75986))

(declare-fun res!95857 () Bool)

(assert (=> b!115986 (=> (not res!95857) (not e!75986))))

(declare-fun isPrefixOf!0 (BitStream!4210 BitStream!4210) Bool)

(assert (=> b!115986 (= res!95857 (isPrefixOf!0 thiss!1305 (_2!5044 lt!177344)))))

(declare-fun lt!177342 () Unit!7141)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4210 BitStream!4210 BitStream!4210) Unit!7141)

(assert (=> b!115986 (= lt!177342 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5044 lt!177348) (_2!5044 lt!177344)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4210 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9558)

(assert (=> b!115986 (= lt!177344 (appendNLeastSignificantBitsLoop!0 (_2!5044 lt!177348) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!75985 () Bool)

(assert (=> b!115986 e!75985))

(declare-fun res!95860 () Bool)

(assert (=> b!115986 (=> (not res!95860) (not e!75985))))

(assert (=> b!115986 (= res!95860 (= (size!2368 (buf!2778 thiss!1305)) (size!2368 (buf!2778 (_2!5044 lt!177348)))))))

(declare-fun appendBit!0 (BitStream!4210 Bool) tuple2!9558)

(assert (=> b!115986 (= lt!177348 (appendBit!0 thiss!1305 lt!177341))))

(assert (=> b!115986 (= lt!177341 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115987 () Bool)

(declare-fun e!75989 () Bool)

(assert (=> b!115987 (= e!75985 e!75989)))

(declare-fun res!95852 () Bool)

(assert (=> b!115987 (=> (not res!95852) (not e!75989))))

(declare-fun lt!177346 () (_ BitVec 64))

(assert (=> b!115987 (= res!95852 (= lt!177349 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177346)))))

(assert (=> b!115987 (= lt!177349 (bitIndex!0 (size!2368 (buf!2778 (_2!5044 lt!177348))) (currentByte!5415 (_2!5044 lt!177348)) (currentBit!5410 (_2!5044 lt!177348))))))

(assert (=> b!115987 (= lt!177346 (bitIndex!0 (size!2368 (buf!2778 thiss!1305)) (currentByte!5415 thiss!1305) (currentBit!5410 thiss!1305)))))

(declare-fun b!115988 () Bool)

(declare-fun res!95862 () Bool)

(assert (=> b!115988 (=> (not res!95862) (not e!75986))))

(assert (=> b!115988 (= res!95862 (invariant!0 (currentBit!5410 thiss!1305) (currentByte!5415 thiss!1305) (size!2368 (buf!2778 (_2!5044 lt!177348)))))))

(declare-fun b!115989 () Bool)

(declare-fun res!95853 () Bool)

(assert (=> b!115989 (=> (not res!95853) (not e!75989))))

(assert (=> b!115989 (= res!95853 (isPrefixOf!0 thiss!1305 (_2!5044 lt!177348)))))

(declare-fun b!115990 () Bool)

(declare-fun array_inv!2170 (array!5222) Bool)

(assert (=> b!115990 (= e!75987 (array_inv!2170 (buf!2778 thiss!1305)))))

(declare-fun b!115991 () Bool)

(declare-fun res!95858 () Bool)

(assert (=> b!115991 (=> (not res!95858) (not e!75988))))

(assert (=> b!115991 (= res!95858 (bvslt i!615 nBits!396))))

(declare-fun b!115992 () Bool)

(assert (=> b!115992 (= e!75984 (= (_2!5043 lt!177340) (_2!5043 lt!177351)))))

(declare-fun b!115993 () Bool)

(assert (=> b!115993 (= e!75989 e!75983)))

(declare-fun res!95859 () Bool)

(assert (=> b!115993 (=> (not res!95859) (not e!75983))))

(assert (=> b!115993 (= res!95859 (and (= (_2!5043 lt!177343) lt!177341) (= (_1!5043 lt!177343) (_2!5044 lt!177348))))))

(declare-fun readerFrom!0 (BitStream!4210 (_ BitVec 32) (_ BitVec 32)) BitStream!4210)

(assert (=> b!115993 (= lt!177343 (readBitPure!0 (readerFrom!0 (_2!5044 lt!177348) (currentBit!5410 thiss!1305) (currentByte!5415 thiss!1305))))))

(assert (= (and start!22958 res!95854) b!115984))

(assert (= (and b!115984 res!95856) b!115985))

(assert (= (and b!115985 res!95861) b!115991))

(assert (= (and b!115991 res!95858) b!115986))

(assert (= (and b!115986 res!95860) b!115987))

(assert (= (and b!115987 res!95852) b!115989))

(assert (= (and b!115989 res!95853) b!115993))

(assert (= (and b!115993 res!95859) b!115982))

(assert (= (and b!115986 res!95857) b!115988))

(assert (= (and b!115988 res!95862) b!115983))

(assert (= (and b!115986 res!95855) b!115992))

(assert (= start!22958 b!115990))

(declare-fun m!173699 () Bool)

(assert (=> b!115987 m!173699))

(declare-fun m!173701 () Bool)

(assert (=> b!115987 m!173701))

(declare-fun m!173703 () Bool)

(assert (=> b!115982 m!173703))

(declare-fun m!173705 () Bool)

(assert (=> b!115986 m!173705))

(declare-fun m!173707 () Bool)

(assert (=> b!115986 m!173707))

(declare-fun m!173709 () Bool)

(assert (=> b!115986 m!173709))

(declare-fun m!173711 () Bool)

(assert (=> b!115986 m!173711))

(declare-fun m!173713 () Bool)

(assert (=> b!115986 m!173713))

(declare-fun m!173715 () Bool)

(assert (=> b!115986 m!173715))

(declare-fun m!173717 () Bool)

(assert (=> b!115986 m!173717))

(declare-fun m!173719 () Bool)

(assert (=> b!115986 m!173719))

(declare-fun m!173721 () Bool)

(assert (=> b!115986 m!173721))

(declare-fun m!173723 () Bool)

(assert (=> b!115986 m!173723))

(declare-fun m!173725 () Bool)

(assert (=> b!115986 m!173725))

(declare-fun m!173727 () Bool)

(assert (=> b!115986 m!173727))

(declare-fun m!173729 () Bool)

(assert (=> b!115988 m!173729))

(declare-fun m!173731 () Bool)

(assert (=> b!115984 m!173731))

(declare-fun m!173733 () Bool)

(assert (=> b!115983 m!173733))

(declare-fun m!173735 () Bool)

(assert (=> b!115985 m!173735))

(declare-fun m!173737 () Bool)

(assert (=> b!115989 m!173737))

(declare-fun m!173739 () Bool)

(assert (=> b!115993 m!173739))

(assert (=> b!115993 m!173739))

(declare-fun m!173741 () Bool)

(assert (=> b!115993 m!173741))

(declare-fun m!173743 () Bool)

(assert (=> b!115990 m!173743))

(declare-fun m!173745 () Bool)

(assert (=> start!22958 m!173745))

(push 1)

(assert (not b!115990))

(assert (not b!115993))

(assert (not start!22958))

(assert (not b!115987))

(assert (not b!115983))

(assert (not b!115982))

(assert (not b!115989))

(assert (not b!115988))

(assert (not b!115986))

(assert (not b!115985))

(assert (not b!115984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

