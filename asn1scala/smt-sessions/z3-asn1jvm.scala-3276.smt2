; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74144 () Bool)

(assert start!74144)

(declare-fun b!327135 () Bool)

(declare-fun res!268547 () Bool)

(declare-fun e!236301 () Bool)

(assert (=> b!327135 (=> (not res!268547) (not e!236301))))

(declare-datatypes ((T!66855 0))(
  ( (T!66856 (val!574 Int)) )
))
(declare-datatypes ((array!21372 0))(
  ( (array!21373 (arr!10370 (Array (_ BitVec 32) T!66855)) (size!9278 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21372)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun arrayRangesEq!1882 (array!21372 array!21372 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327135 (= res!268547 (arrayRangesEq!1882 a!407 a!407 i!907 (size!9278 a!407)))))

(declare-fun res!268546 () Bool)

(assert (=> start!74144 (=> (not res!268546) (not e!236301))))

(assert (=> start!74144 (= res!268546 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9278 a!407))))))

(assert (=> start!74144 e!236301))

(assert (=> start!74144 true))

(declare-fun e!236302 () Bool)

(declare-fun array_inv!8818 (array!21372) Bool)

(assert (=> start!74144 (and (array_inv!8818 a!407) e!236302)))

(declare-fun mapNonEmpty!3451 () Bool)

(declare-fun mapRes!3451 () Bool)

(declare-fun tp!3451 () Bool)

(declare-fun tp_is_empty!1149 () Bool)

(assert (=> mapNonEmpty!3451 (= mapRes!3451 (and tp!3451 tp_is_empty!1149))))

(declare-fun mapValue!3451 () T!66855)

(declare-fun mapKey!3451 () (_ BitVec 32))

(declare-fun mapRest!3451 () (Array (_ BitVec 32) T!66855))

(assert (=> mapNonEmpty!3451 (= (arr!10370 a!407) (store mapRest!3451 mapKey!3451 mapValue!3451))))

(declare-fun b!327136 () Bool)

(assert (=> b!327136 (= e!236302 (and tp_is_empty!1149 mapRes!3451))))

(declare-fun condMapEmpty!3451 () Bool)

(declare-fun mapDefault!3451 () T!66855)

(assert (=> b!327136 (= condMapEmpty!3451 (= (arr!10370 a!407) ((as const (Array (_ BitVec 32) T!66855)) mapDefault!3451)))))

(declare-fun b!327137 () Bool)

(declare-fun res!268545 () Bool)

(assert (=> b!327137 (=> (not res!268545) (not e!236301))))

(assert (=> b!327137 (= res!268545 (not (= i!907 #b00000000000000000000000000000000)))))

(declare-fun b!327138 () Bool)

(assert (=> b!327138 (= e!236301 (not (arrayRangesEq!1882 a!407 a!407 #b00000000000000000000000000000000 (size!9278 a!407))))))

(declare-datatypes ((Unit!22168 0))(
  ( (Unit!22169) )
))
(declare-fun lt!448697 () Unit!22168)

(declare-fun rec!130 (array!21372 (_ BitVec 32)) Unit!22168)

(assert (=> b!327138 (= lt!448697 (rec!130 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!3451 () Bool)

(assert (=> mapIsEmpty!3451 mapRes!3451))

(assert (= (and start!74144 res!268546) b!327135))

(assert (= (and b!327135 res!268547) b!327137))

(assert (= (and b!327137 res!268545) b!327138))

(assert (= (and b!327136 condMapEmpty!3451) mapIsEmpty!3451))

(assert (= (and b!327136 (not condMapEmpty!3451)) mapNonEmpty!3451))

(assert (= start!74144 b!327136))

(declare-fun m!464907 () Bool)

(assert (=> b!327135 m!464907))

(declare-fun m!464909 () Bool)

(assert (=> start!74144 m!464909))

(declare-fun m!464911 () Bool)

(assert (=> mapNonEmpty!3451 m!464911))

(declare-fun m!464913 () Bool)

(assert (=> b!327138 m!464913))

(declare-fun m!464915 () Bool)

(assert (=> b!327138 m!464915))

(check-sat (not b!327138) tp_is_empty!1149 (not start!74144) (not b!327135) (not mapNonEmpty!3451))
(check-sat)
(get-model)

(declare-fun d!107868 () Bool)

(declare-fun res!268561 () Bool)

(declare-fun e!236313 () Bool)

(assert (=> d!107868 (=> res!268561 e!236313)))

(assert (=> d!107868 (= res!268561 (= i!907 (size!9278 a!407)))))

(assert (=> d!107868 (= (arrayRangesEq!1882 a!407 a!407 i!907 (size!9278 a!407)) e!236313)))

(declare-fun b!327155 () Bool)

(declare-fun e!236314 () Bool)

(assert (=> b!327155 (= e!236313 e!236314)))

(declare-fun res!268562 () Bool)

(assert (=> b!327155 (=> (not res!268562) (not e!236314))))

(assert (=> b!327155 (= res!268562 (= (select (arr!10370 a!407) i!907) (select (arr!10370 a!407) i!907)))))

(declare-fun b!327156 () Bool)

(assert (=> b!327156 (= e!236314 (arrayRangesEq!1882 a!407 a!407 (bvadd i!907 #b00000000000000000000000000000001) (size!9278 a!407)))))

(assert (= (and d!107868 (not res!268561)) b!327155))

(assert (= (and b!327155 res!268562) b!327156))

(declare-fun m!464927 () Bool)

(assert (=> b!327155 m!464927))

(assert (=> b!327155 m!464927))

(declare-fun m!464929 () Bool)

(assert (=> b!327156 m!464929))

(assert (=> b!327135 d!107868))

(declare-fun d!107870 () Bool)

(assert (=> d!107870 (= (array_inv!8818 a!407) (bvsge (size!9278 a!407) #b00000000000000000000000000000000))))

(assert (=> start!74144 d!107870))

(declare-fun d!107872 () Bool)

(declare-fun res!268563 () Bool)

(declare-fun e!236315 () Bool)

(assert (=> d!107872 (=> res!268563 e!236315)))

(assert (=> d!107872 (= res!268563 (= #b00000000000000000000000000000000 (size!9278 a!407)))))

(assert (=> d!107872 (= (arrayRangesEq!1882 a!407 a!407 #b00000000000000000000000000000000 (size!9278 a!407)) e!236315)))

(declare-fun b!327157 () Bool)

(declare-fun e!236316 () Bool)

(assert (=> b!327157 (= e!236315 e!236316)))

(declare-fun res!268564 () Bool)

(assert (=> b!327157 (=> (not res!268564) (not e!236316))))

(assert (=> b!327157 (= res!268564 (= (select (arr!10370 a!407) #b00000000000000000000000000000000) (select (arr!10370 a!407) #b00000000000000000000000000000000)))))

(declare-fun b!327158 () Bool)

(assert (=> b!327158 (= e!236316 (arrayRangesEq!1882 a!407 a!407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9278 a!407)))))

(assert (= (and d!107872 (not res!268563)) b!327157))

(assert (= (and b!327157 res!268564) b!327158))

(declare-fun m!464931 () Bool)

(assert (=> b!327157 m!464931))

(assert (=> b!327157 m!464931))

(declare-fun m!464933 () Bool)

(assert (=> b!327158 m!464933))

(assert (=> b!327138 d!107872))

(declare-fun d!107874 () Bool)

(assert (=> d!107874 (arrayRangesEq!1882 a!407 a!407 #b00000000000000000000000000000000 (size!9278 a!407))))

(declare-fun lt!448703 () Unit!22168)

(declare-fun e!236319 () Unit!22168)

(assert (=> d!107874 (= lt!448703 e!236319)))

(declare-fun c!15484 () Bool)

(assert (=> d!107874 (= c!15484 (= (bvsub i!907 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> d!107874 (and (bvsle #b00000000000000000000000000000000 (bvsub i!907 #b00000000000000000000000000000001)) (bvsle (bvsub i!907 #b00000000000000000000000000000001) (size!9278 a!407)))))

(assert (=> d!107874 (= (rec!130 a!407 (bvsub i!907 #b00000000000000000000000000000001)) lt!448703)))

(declare-fun b!327163 () Bool)

(declare-fun Unit!22172 () Unit!22168)

(assert (=> b!327163 (= e!236319 Unit!22172)))

(declare-fun b!327164 () Bool)

(assert (=> b!327164 (= e!236319 (rec!130 a!407 (bvsub (bvsub i!907 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!107874 c!15484) b!327163))

(assert (= (and d!107874 (not c!15484)) b!327164))

(assert (=> d!107874 m!464913))

(declare-fun m!464935 () Bool)

(assert (=> b!327164 m!464935))

(assert (=> b!327138 d!107874))

(declare-fun condMapEmpty!3457 () Bool)

(declare-fun mapDefault!3457 () T!66855)

(assert (=> mapNonEmpty!3451 (= condMapEmpty!3457 (= mapRest!3451 ((as const (Array (_ BitVec 32) T!66855)) mapDefault!3457)))))

(declare-fun mapRes!3457 () Bool)

(assert (=> mapNonEmpty!3451 (= tp!3451 (and tp_is_empty!1149 mapRes!3457))))

(declare-fun mapIsEmpty!3457 () Bool)

(assert (=> mapIsEmpty!3457 mapRes!3457))

(declare-fun mapNonEmpty!3457 () Bool)

(declare-fun tp!3457 () Bool)

(assert (=> mapNonEmpty!3457 (= mapRes!3457 (and tp!3457 tp_is_empty!1149))))

(declare-fun mapValue!3457 () T!66855)

(declare-fun mapRest!3457 () (Array (_ BitVec 32) T!66855))

(declare-fun mapKey!3457 () (_ BitVec 32))

(assert (=> mapNonEmpty!3457 (= mapRest!3451 (store mapRest!3457 mapKey!3457 mapValue!3457))))

(assert (= (and mapNonEmpty!3451 condMapEmpty!3457) mapIsEmpty!3457))

(assert (= (and mapNonEmpty!3451 (not condMapEmpty!3457)) mapNonEmpty!3457))

(declare-fun m!464937 () Bool)

(assert (=> mapNonEmpty!3457 m!464937))

(check-sat tp_is_empty!1149 (not d!107874) (not b!327164) (not mapNonEmpty!3457) (not b!327156) (not b!327158))
(check-sat)
