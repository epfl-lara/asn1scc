; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27012 () Bool)

(assert start!27012)

(declare-fun b!139133 () Bool)

(declare-fun e!92649 () Bool)

(declare-fun e!92652 () Bool)

(assert (=> b!139133 (= e!92649 (not e!92652))))

(declare-fun res!115986 () Bool)

(assert (=> b!139133 (=> res!115986 e!92652)))

(declare-fun lt!216872 () (_ BitVec 64))

(declare-fun lt!216873 () (_ BitVec 64))

(assert (=> b!139133 (= res!115986 (not (= lt!216872 (bvadd lt!216872 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216873)))))))

(declare-datatypes ((array!6328 0))(
  ( (array!6329 (arr!3560 (Array (_ BitVec 32) (_ BitVec 8))) (size!2865 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4994 0))(
  ( (BitStream!4995 (buf!3278 array!6328) (currentByte!6102 (_ BitVec 32)) (currentBit!6097 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4994)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139133 (= lt!216872 (bitIndex!0 (size!2865 (buf!3278 thiss!1634)) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!139133 (= lt!216873 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!4994 BitStream!4994) Bool)

(assert (=> b!139133 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8686 0))(
  ( (Unit!8687) )
))
(declare-fun lt!216871 () Unit!8686)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4994) Unit!8686)

(assert (=> b!139133 (= lt!216871 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!115983 () Bool)

(assert (=> start!27012 (=> (not res!115983) (not e!92649))))

(declare-fun arr!237 () array!6328)

(assert (=> start!27012 (= res!115983 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2865 arr!237))))))

(assert (=> start!27012 e!92649))

(assert (=> start!27012 true))

(declare-fun array_inv!2654 (array!6328) Bool)

(assert (=> start!27012 (array_inv!2654 arr!237)))

(declare-fun e!92650 () Bool)

(declare-fun inv!12 (BitStream!4994) Bool)

(assert (=> start!27012 (and (inv!12 thiss!1634) e!92650)))

(declare-fun b!139134 () Bool)

(declare-fun res!115984 () Bool)

(assert (=> b!139134 (=> (not res!115984) (not e!92649))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139134 (= res!115984 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))) ((_ sign_extend 32) (currentByte!6102 thiss!1634)) ((_ sign_extend 32) (currentBit!6097 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139135 () Bool)

(assert (=> b!139135 (= e!92650 (array_inv!2654 (buf!3278 thiss!1634)))))

(declare-fun b!139136 () Bool)

(declare-fun res!115985 () Bool)

(assert (=> b!139136 (=> (not res!115985) (not e!92649))))

(assert (=> b!139136 (= res!115985 (bvsge from!447 to!404))))

(declare-datatypes ((tuple2!12180 0))(
  ( (tuple2!12181 (_1!6416 BitStream!4994) (_2!6416 BitStream!4994)) )
))
(declare-fun lt!216870 () tuple2!12180)

(declare-fun b!139137 () Bool)

(assert (=> b!139137 (= e!92652 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2865 (buf!3278 (_1!6416 lt!216870)))) ((_ sign_extend 32) (currentByte!6102 (_1!6416 lt!216870))) ((_ sign_extend 32) (currentBit!6097 (_1!6416 lt!216870))) (bvsub to!404 from!447)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139137 (validate_offset_bits!1 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))) ((_ sign_extend 32) (currentByte!6102 thiss!1634)) ((_ sign_extend 32) (currentBit!6097 thiss!1634)) lt!216873)))

(declare-fun lt!216869 () Unit!8686)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4994 array!6328 (_ BitVec 64)) Unit!8686)

(assert (=> b!139137 (= lt!216869 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3278 thiss!1634) lt!216873))))

(declare-fun reader!0 (BitStream!4994 BitStream!4994) tuple2!12180)

(assert (=> b!139137 (= lt!216870 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!27012 res!115983) b!139134))

(assert (= (and b!139134 res!115984) b!139136))

(assert (= (and b!139136 res!115985) b!139133))

(assert (= (and b!139133 (not res!115986)) b!139137))

(assert (= start!27012 b!139135))

(declare-fun m!214089 () Bool)

(assert (=> b!139134 m!214089))

(declare-fun m!214091 () Bool)

(assert (=> b!139137 m!214091))

(declare-fun m!214093 () Bool)

(assert (=> b!139137 m!214093))

(declare-fun m!214095 () Bool)

(assert (=> b!139137 m!214095))

(declare-fun m!214097 () Bool)

(assert (=> b!139137 m!214097))

(declare-fun m!214099 () Bool)

(assert (=> start!27012 m!214099))

(declare-fun m!214101 () Bool)

(assert (=> start!27012 m!214101))

(declare-fun m!214103 () Bool)

(assert (=> b!139133 m!214103))

(declare-fun m!214105 () Bool)

(assert (=> b!139133 m!214105))

(declare-fun m!214107 () Bool)

(assert (=> b!139133 m!214107))

(declare-fun m!214109 () Bool)

(assert (=> b!139135 m!214109))

(push 1)

(assert (not b!139135))

(assert (not b!139133))

(assert (not b!139137))

(assert (not b!139134))

(assert (not start!27012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44707 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44707 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2865 (buf!3278 (_1!6416 lt!216870)))) ((_ sign_extend 32) (currentByte!6102 (_1!6416 lt!216870))) ((_ sign_extend 32) (currentBit!6097 (_1!6416 lt!216870))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2865 (buf!3278 (_1!6416 lt!216870)))) ((_ sign_extend 32) (currentByte!6102 (_1!6416 lt!216870))) ((_ sign_extend 32) (currentBit!6097 (_1!6416 lt!216870)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10939 () Bool)

(assert (= bs!10939 d!44707))

(declare-fun m!214113 () Bool)

(assert (=> bs!10939 m!214113))

(assert (=> b!139137 d!44707))

(declare-fun d!44711 () Bool)

(assert (=> d!44711 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))) ((_ sign_extend 32) (currentByte!6102 thiss!1634)) ((_ sign_extend 32) (currentBit!6097 thiss!1634)) lt!216873) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))) ((_ sign_extend 32) (currentByte!6102 thiss!1634)) ((_ sign_extend 32) (currentBit!6097 thiss!1634))) lt!216873))))

(declare-fun bs!10941 () Bool)

(assert (= bs!10941 d!44711))

(declare-fun m!214117 () Bool)

(assert (=> bs!10941 m!214117))

(assert (=> b!139137 d!44711))

(declare-fun d!44717 () Bool)

(assert (=> d!44717 (validate_offset_bits!1 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))) ((_ sign_extend 32) (currentByte!6102 thiss!1634)) ((_ sign_extend 32) (currentBit!6097 thiss!1634)) lt!216873)))

(declare-fun lt!216876 () Unit!8686)

(declare-fun choose!9 (BitStream!4994 array!6328 (_ BitVec 64) BitStream!4994) Unit!8686)

(assert (=> d!44717 (= lt!216876 (choose!9 thiss!1634 (buf!3278 thiss!1634) lt!216873 (BitStream!4995 (buf!3278 thiss!1634) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634))))))

(assert (=> d!44717 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3278 thiss!1634) lt!216873) lt!216876)))

(declare-fun bs!10945 () Bool)

(assert (= bs!10945 d!44717))

(assert (=> bs!10945 m!214093))

(declare-fun m!214123 () Bool)

(assert (=> bs!10945 m!214123))

(assert (=> b!139137 d!44717))

(declare-fun b!139173 () Bool)

(declare-fun e!92670 () Unit!8686)

(declare-fun Unit!8688 () Unit!8686)

(assert (=> b!139173 (= e!92670 Unit!8688)))

(declare-fun d!44727 () Bool)

(declare-fun e!92671 () Bool)

(assert (=> d!44727 e!92671))

(declare-fun res!116015 () Bool)

(assert (=> d!44727 (=> (not res!116015) (not e!92671))))

(declare-fun lt!217003 () tuple2!12180)

(assert (=> d!44727 (= res!116015 (isPrefixOf!0 (_1!6416 lt!217003) (_2!6416 lt!217003)))))

(declare-fun lt!216998 () BitStream!4994)

(assert (=> d!44727 (= lt!217003 (tuple2!12181 lt!216998 thiss!1634))))

(declare-fun lt!216996 () Unit!8686)

(declare-fun lt!217001 () Unit!8686)

(assert (=> d!44727 (= lt!216996 lt!217001)))

(assert (=> d!44727 (isPrefixOf!0 lt!216998 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4994 BitStream!4994 BitStream!4994) Unit!8686)

(assert (=> d!44727 (= lt!217001 (lemmaIsPrefixTransitive!0 lt!216998 thiss!1634 thiss!1634))))

(declare-fun lt!216999 () Unit!8686)

(declare-fun lt!217002 () Unit!8686)

(assert (=> d!44727 (= lt!216999 lt!217002)))

(assert (=> d!44727 (isPrefixOf!0 lt!216998 thiss!1634)))

(assert (=> d!44727 (= lt!217002 (lemmaIsPrefixTransitive!0 lt!216998 thiss!1634 thiss!1634))))

(declare-fun lt!216997 () Unit!8686)

(assert (=> d!44727 (= lt!216997 e!92670)))

(declare-fun c!7755 () Bool)

(assert (=> d!44727 (= c!7755 (not (= (size!2865 (buf!3278 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!216986 () Unit!8686)

(declare-fun lt!216988 () Unit!8686)

(assert (=> d!44727 (= lt!216986 lt!216988)))

(assert (=> d!44727 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44727 (= lt!216988 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!216987 () Unit!8686)

(declare-fun lt!216990 () Unit!8686)

(assert (=> d!44727 (= lt!216987 lt!216990)))

(assert (=> d!44727 (= lt!216990 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!216989 () Unit!8686)

(declare-fun lt!216984 () Unit!8686)

(assert (=> d!44727 (= lt!216989 lt!216984)))

(assert (=> d!44727 (isPrefixOf!0 lt!216998 lt!216998)))

(assert (=> d!44727 (= lt!216984 (lemmaIsPrefixRefl!0 lt!216998))))

(declare-fun lt!216995 () Unit!8686)

(declare-fun lt!217000 () Unit!8686)

(assert (=> d!44727 (= lt!216995 lt!217000)))

(assert (=> d!44727 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44727 (= lt!217000 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44727 (= lt!216998 (BitStream!4995 (buf!3278 thiss!1634) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634)))))

(assert (=> d!44727 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44727 (= (reader!0 thiss!1634 thiss!1634) lt!217003)))

(declare-fun lt!216985 () (_ BitVec 64))

(declare-fun lt!216993 () (_ BitVec 64))

(declare-fun b!139174 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4994 (_ BitVec 64)) BitStream!4994)

(assert (=> b!139174 (= e!92671 (= (_1!6416 lt!217003) (withMovedBitIndex!0 (_2!6416 lt!217003) (bvsub lt!216993 lt!216985))))))

(assert (=> b!139174 (or (= (bvand lt!216993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!216985 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!216993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!216993 lt!216985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139174 (= lt!216985 (bitIndex!0 (size!2865 (buf!3278 thiss!1634)) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634)))))

(assert (=> b!139174 (= lt!216993 (bitIndex!0 (size!2865 (buf!3278 thiss!1634)) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634)))))

(declare-fun b!139175 () Bool)

(declare-fun lt!216992 () Unit!8686)

(assert (=> b!139175 (= e!92670 lt!216992)))

(declare-fun lt!216991 () (_ BitVec 64))

(assert (=> b!139175 (= lt!216991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216994 () (_ BitVec 64))

(assert (=> b!139175 (= lt!216994 (bitIndex!0 (size!2865 (buf!3278 thiss!1634)) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6328 array!6328 (_ BitVec 64) (_ BitVec 64)) Unit!8686)

(assert (=> b!139175 (= lt!216992 (arrayBitRangesEqSymmetric!0 (buf!3278 thiss!1634) (buf!3278 thiss!1634) lt!216991 lt!216994))))

(declare-fun arrayBitRangesEq!0 (array!6328 array!6328 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139175 (arrayBitRangesEq!0 (buf!3278 thiss!1634) (buf!3278 thiss!1634) lt!216991 lt!216994)))

(declare-fun b!139176 () Bool)

(declare-fun res!116014 () Bool)

(assert (=> b!139176 (=> (not res!116014) (not e!92671))))

(assert (=> b!139176 (= res!116014 (isPrefixOf!0 (_1!6416 lt!217003) thiss!1634))))

(declare-fun b!139177 () Bool)

(declare-fun res!116016 () Bool)

(assert (=> b!139177 (=> (not res!116016) (not e!92671))))

(assert (=> b!139177 (= res!116016 (isPrefixOf!0 (_2!6416 lt!217003) thiss!1634))))

(assert (= (and d!44727 c!7755) b!139175))

(assert (= (and d!44727 (not c!7755)) b!139173))

(assert (= (and d!44727 res!116015) b!139176))

(assert (= (and b!139176 res!116014) b!139177))

(assert (= (and b!139177 res!116016) b!139174))

(assert (=> d!44727 m!214107))

(declare-fun m!214137 () Bool)

(assert (=> d!44727 m!214137))

(assert (=> d!44727 m!214105))

(declare-fun m!214139 () Bool)

(assert (=> d!44727 m!214139))

(declare-fun m!214141 () Bool)

(assert (=> d!44727 m!214141))

(assert (=> d!44727 m!214107))

(declare-fun m!214143 () Bool)

(assert (=> d!44727 m!214143))

(declare-fun m!214145 () Bool)

(assert (=> d!44727 m!214145))

(assert (=> d!44727 m!214143))

(assert (=> d!44727 m!214105))

(assert (=> d!44727 m!214105))

(declare-fun m!214147 () Bool)

(assert (=> b!139176 m!214147))

(declare-fun m!214149 () Bool)

(assert (=> b!139174 m!214149))

(assert (=> b!139174 m!214103))

(assert (=> b!139174 m!214103))

(declare-fun m!214151 () Bool)

(assert (=> b!139177 m!214151))

(assert (=> b!139175 m!214103))

(declare-fun m!214153 () Bool)

(assert (=> b!139175 m!214153))

(declare-fun m!214155 () Bool)

(assert (=> b!139175 m!214155))

(assert (=> b!139137 d!44727))

(declare-fun d!44745 () Bool)

(assert (=> d!44745 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))) ((_ sign_extend 32) (currentByte!6102 thiss!1634)) ((_ sign_extend 32) (currentBit!6097 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))) ((_ sign_extend 32) (currentByte!6102 thiss!1634)) ((_ sign_extend 32) (currentBit!6097 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10953 () Bool)

(assert (= bs!10953 d!44745))

(assert (=> bs!10953 m!214117))

(assert (=> b!139134 d!44745))

(declare-fun d!44747 () Bool)

(declare-fun e!92678 () Bool)

(assert (=> d!44747 e!92678))

(declare-fun res!116029 () Bool)

(assert (=> d!44747 (=> (not res!116029) (not e!92678))))

(declare-fun lt!217049 () (_ BitVec 64))

(declare-fun lt!217053 () (_ BitVec 64))

(declare-fun lt!217048 () (_ BitVec 64))

(assert (=> d!44747 (= res!116029 (= lt!217049 (bvsub lt!217048 lt!217053)))))

(assert (=> d!44747 (or (= (bvand lt!217048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217048 lt!217053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44747 (= lt!217053 (remainingBits!0 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))) ((_ sign_extend 32) (currentByte!6102 thiss!1634)) ((_ sign_extend 32) (currentBit!6097 thiss!1634))))))

(declare-fun lt!217051 () (_ BitVec 64))

(declare-fun lt!217050 () (_ BitVec 64))

(assert (=> d!44747 (= lt!217048 (bvmul lt!217051 lt!217050))))

(assert (=> d!44747 (or (= lt!217051 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217050 (bvsdiv (bvmul lt!217051 lt!217050) lt!217051)))))

(assert (=> d!44747 (= lt!217050 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44747 (= lt!217051 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))))))

(assert (=> d!44747 (= lt!217049 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6102 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6097 thiss!1634))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!44747 (invariant!0 (currentBit!6097 thiss!1634) (currentByte!6102 thiss!1634) (size!2865 (buf!3278 thiss!1634)))))

(assert (=> d!44747 (= (bitIndex!0 (size!2865 (buf!3278 thiss!1634)) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634)) lt!217049)))

(declare-fun b!139191 () Bool)

(declare-fun res!116028 () Bool)

(assert (=> b!139191 (=> (not res!116028) (not e!92678))))

(assert (=> b!139191 (= res!116028 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217049))))

(declare-fun b!139192 () Bool)

(declare-fun lt!217052 () (_ BitVec 64))

(assert (=> b!139192 (= e!92678 (bvsle lt!217049 (bvmul lt!217052 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139192 (or (= lt!217052 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217052 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217052)))))

(assert (=> b!139192 (= lt!217052 ((_ sign_extend 32) (size!2865 (buf!3278 thiss!1634))))))

(assert (= (and d!44747 res!116029) b!139191))

(assert (= (and b!139191 res!116028) b!139192))

(assert (=> d!44747 m!214117))

(declare-fun m!214177 () Bool)

(assert (=> d!44747 m!214177))

(assert (=> b!139133 d!44747))

(declare-fun d!44751 () Bool)

(declare-fun res!116044 () Bool)

(declare-fun e!92689 () Bool)

(assert (=> d!44751 (=> (not res!116044) (not e!92689))))

(assert (=> d!44751 (= res!116044 (= (size!2865 (buf!3278 thiss!1634)) (size!2865 (buf!3278 thiss!1634))))))

(assert (=> d!44751 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!92689)))

(declare-fun b!139207 () Bool)

(declare-fun res!116045 () Bool)

(assert (=> b!139207 (=> (not res!116045) (not e!92689))))

(assert (=> b!139207 (= res!116045 (bvsle (bitIndex!0 (size!2865 (buf!3278 thiss!1634)) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634)) (bitIndex!0 (size!2865 (buf!3278 thiss!1634)) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634))))))

(declare-fun b!139208 () Bool)

(declare-fun e!92688 () Bool)

(assert (=> b!139208 (= e!92689 e!92688)))

(declare-fun res!116046 () Bool)

(assert (=> b!139208 (=> res!116046 e!92688)))

(assert (=> b!139208 (= res!116046 (= (size!2865 (buf!3278 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139209 () Bool)

(assert (=> b!139209 (= e!92688 (arrayBitRangesEq!0 (buf!3278 thiss!1634) (buf!3278 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2865 (buf!3278 thiss!1634)) (currentByte!6102 thiss!1634) (currentBit!6097 thiss!1634))))))

(assert (= (and d!44751 res!116044) b!139207))

(assert (= (and b!139207 res!116045) b!139208))

(assert (= (and b!139208 (not res!116046)) b!139209))

(assert (=> b!139207 m!214103))

(assert (=> b!139207 m!214103))

(assert (=> b!139209 m!214103))

(assert (=> b!139209 m!214103))

(declare-fun m!214179 () Bool)

(assert (=> b!139209 m!214179))

(assert (=> b!139133 d!44751))

(declare-fun d!44755 () Bool)

(assert (=> d!44755 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!217098 () Unit!8686)

(declare-fun choose!11 (BitStream!4994) Unit!8686)

(assert (=> d!44755 (= lt!217098 (choose!11 thiss!1634))))

(assert (=> d!44755 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!217098)))

(declare-fun bs!10955 () Bool)

(assert (= bs!10955 d!44755))

(assert (=> bs!10955 m!214105))

(declare-fun m!214183 () Bool)

(assert (=> bs!10955 m!214183))

(assert (=> b!139133 d!44755))

(declare-fun d!44759 () Bool)

(assert (=> d!44759 (= (array_inv!2654 arr!237) (bvsge (size!2865 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27012 d!44759))

(declare-fun d!44761 () Bool)

(assert (=> d!44761 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6097 thiss!1634) (currentByte!6102 thiss!1634) (size!2865 (buf!3278 thiss!1634))))))

(declare-fun bs!10958 () Bool)

(assert (= bs!10958 d!44761))

(assert (=> bs!10958 m!214177))

(assert (=> start!27012 d!44761))

(declare-fun d!44763 () Bool)

(assert (=> d!44763 (= (array_inv!2654 (buf!3278 thiss!1634)) (bvsge (size!2865 (buf!3278 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139135 d!44763))

(push 1)

(assert (not b!139174))

(assert (not b!139207))

(assert (not d!44707))

(assert (not d!44747))

(assert (not d!44755))

(assert (not b!139209))

(assert (not d!44717))

(assert (not d!44745))

(assert (not b!139177))

(assert (not d!44711))

(assert (not b!139176))

(assert (not b!139175))

(assert (not d!44761))

(assert (not d!44727))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

